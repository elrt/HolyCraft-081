// Batch033 rendering: ChestRenderer + ChestModel, HumanoidModel/PlayerRenderer (+ armor layers, held item),
// third-person camera, ItemInHandRenderer (first-person hand / held item), ArmorScreen, InBedScreen, Gui armor bar.
U32 g33_charTex,g33_chestTex,g33_chest2Tex,g33_armorTex[10];Bool g33_texTried;
U8 *g33_matName[5]={"cloth","chain","iron","diamond","gold"};
U0 MC33_LoadTex(){if(g33_texTried)return;g33_texTried=TRUE;MC33_SkyTex();g33_charTex=MC028_Texture("assets/033/mob/char.png",NULL,NULL);g33_chestTex=MC028_Texture("assets/033/chest/normal.png",NULL,NULL);g33_chest2Tex=MC028_Texture("assets/033/chest/double_normal.png",NULL,NULL);
 I32 i,k;U8 path[128];for(i=0;i<5;i++)for(k=0;k<2;k++){sprintf(path,"assets/033/armor/%s_%d.png",g33_matName[i],k+1);g33_armorTex[i*2+k]=MC028_Texture(path,NULL,NULL);}}
U0 MC33_LightOn(){F32 l0[4]={0.16169041,0.80845207,-0.56591643,0},l1[4]={-0.16169041,0.80845207,0.56591643,0},dif[4]={0.6,0.6,0.6,1},amb[4]={0.4,0.4,0.4,1},zero[4]={0,0,0,1};
 hcgl028_glEnable(0xB50);hcgl028_glEnable(0x4000);hcgl028_glEnable(0x4001);hcgl028_glEnable(0xB57);hcgl028_glEnable(0xBA1);
 G31_Lightfv(0x4000,0x1203,l0);G31_Lightfv(0x4000,0x1201,dif);G31_Lightfv(0x4000,0x1200,amb);G31_Lightfv(0x4000,0x1202,zero);
 G31_Lightfv(0x4001,0x1203,l1);G31_Lightfv(0x4001,0x1201,dif);G31_Lightfv(0x4001,0x1200,zero);G31_Lightfv(0x4001,0x1202,zero);}
U0 MC33_LightOff(){hcgl028_glDisable(0xBA1);hcgl028_glDisable(0xB57);hcgl028_glDisable(0x4001);hcgl028_glDisable(0x4000);hcgl028_glDisable(0xB50);}
// ModelPart box with the Java/MCPE texture layout; mirror swaps x like ModelBox(mirror=true).
U0 MC33_Box(F32 u,F32 v,F32 x0,F32 y0,F32 z0,F32 w,F32 h,F32 d,F32 g,Bool mirror){F32 x1=(x0+w+g)/16,y1=(y0+h+g)/16,z1=(z0+d+g)/16,nx=1;x0=(x0-g)/16;y0=(y0-g)/16;z0=(z0-g)/16;if(mirror){F32 t=x0;x0=x1;x1=t;nx=-1;}
 F32 p0[3]={x0,y0,z0},p1[3]={x1,y0,z0},p2[3]={x1,y1,z0},p3[3]={x0,y1,z0},p4[3]={x0,y0,z1},p5[3]={x1,y0,z1},p6[3]={x1,y1,z1},p7[3]={x0,y1,z1};
 hcgl028_glBegin(7);
 MC31_Quad(p5,p1,p2,p6,u+d+w,v+d,u+d+w+d,v+d+h,nx,0,0);
 MC31_Quad(p0,p4,p7,p3,u,v+d,u+d,v+d+h,-nx,0,0);
 MC31_Quad(p5,p4,p0,p1,u+d,v,u+d+w,v+d,0,-1,0);
 MC31_Quad(p2,p3,p7,p6,u+d+w,v+d,u+d+w+w,v,0,1,0);
 MC31_Quad(p1,p0,p3,p2,u+d,v+d,u+d+w,v+d+h,0,0,-1);
 MC31_Quad(p4,p5,p6,p7,u+d+w+d,v+d,u+d+w+d+w,v+d+h,0,0,1);
 hcgl028_glEnd();}
// ---- ChestRenderer::render ----
U0 MC033_RenderTE(MCApp028 *s,F32 pt){MC33_LoadTex();I32 i;Bool lit=FALSE;Player *pp=MC33_P(s);MCBody023 *pb=&pp->mob.entity.body;F32 range=g29_fogFar+8;
 for(i=0;i<g32_teN;i++){MC32TE *t=g32_te[i];if(t->kind!=1 || Level_getTile(&s->level,t->x,t->y,t->z)!=54)continue;F32 dx=t->x+0.5-pb->x,dz=t->z+0.5-pb->z;if(dx*dx+dz*dz>range*range)continue;
  MC32TE *p=MC33_Pair(s,t->x,t->y,t->z,FALSE);if(p){if(p->x<t->x || p->z<t->z)continue;}
  if(!lit){MC33_LightOn();lit=TRUE;}
  I32 data=Level_getData(&s->level,t->x,t->y,t->z);F32 rot=0;if(data==2)rot=180;if(data==4)rot=90;if(data==5)rot=-90;
  MC33Lid *l=MC33_Lid(t);F32 o=0;if(l)o=l->po+(l->o-l->po)*pt;if(p){MC33Lid *l2=MC33_Lid(p);if(l2){F32 o2=l2->po+(l2->o-l2->po)*pt;if(o2>o)o=o2;}}
  F32 v=1-o,ang=-(1-v*v*v)*MC33_PI*0.5,br=MC31_Bright(t->x,t->y,t->z),br2=MC31_Bright(t->x,t->y+1,t->z);if(br2>br)br=br2;
  hcgl028_glPushMatrix();hcgl028_glTranslatef(t->x,t->y+1,t->z+1);hcgl028_glScalef(1,-1,-1);hcgl028_glTranslatef(0.5,0.5,0.5);hcgl028_glRotatef(rot,0,1,0);hcgl028_glTranslatef(-0.5,-0.5,-0.5);
  F32 w=14,xo=1;hcgl028_glEnable(0xDE1);
  if(p){hcgl028_glBindTexture(0xDE1,g33_chest2Tex);g31_tw=128;g31_th=64;w=30;xo=-7;F32 v20=1;if(data==2 || data==5)v20=-1;I32 pc=p->x,own=t->x;if(p->x==t->x){pc=p->z;own=t->z;}F32 off=-0.5;if(pc>=own)off=0.5;hcgl028_glTranslatef(off*v20,0,0);}
  else{hcgl028_glBindTexture(0xDE1,g33_chestTex);g31_tw=64;g31_th=64;}
  hcgl028_glColor4f(br,br,br,1);
  MC31_Part(xo,7,15,ang,0,0);MC33_Box(0,0,0,-5,-14,w,5,14,0,FALSE);MC31_End();
  MC31_Part(8,7,15,ang,0,0);MC33_Box(0,0,-1,-2,-15,2,4,1,0,FALSE);MC31_End();
  MC31_Part(xo,6,1,0,0,0);MC33_Box(0,19,0,0,0,w,10,14,0,FALSE);MC31_End();
  hcgl028_glPopMatrix();}
 if(lit)MC33_LightOff();g31_tw=64;g31_th=32;hcgl028_glColor4f(1,1,1,1);hcgl028_glBindTexture(0xDE1,s->terrainTex);}
// ---- HumanoidModel::setupAnim ----
class MC33Anim {F32 hx,hy,hyo,bx,by,rax,ray,raz,rox,roz,lax,lay,laz,lox,loz,rlx,rly,llx,lly,legY,legZ;};
MC33Anim g33_a;
U0 MC33_SetupAnim(F32 wp,F32 ws,F32 bob,F32 hy,F32 hp,F32 att,Bool holding,Bool sneak){MC33Anim *a=&g33_a;memset(a,0,sizeof(MC33Anim));F32 PI=MC33_PI;
 a->hy=hy/(180/PI);a->hx=hp/(180/PI);F32 v10=wp*0.6662,v11=cos(v10)*ws,v12=cos(v10+PI);
 a->lax=v11;a->rax=v12*ws;a->rlx=v11*1.4;a->llx=v12*ws*1.4;
 if(holding)a->rax=a->rax*0.5-PI*0.5*0.2;
 a->rox=-5;a->roz=0;a->lox=5;a->loz=0;
 if(att>0){F32 v16=sqrt(att),v17=sin(v16*PI*2)*0.2;a->by=v17;a->roz=sin(v17)*5;a->rox=-cos(v17)*5;a->loz=-sin(v17)*5;a->lox=cos(v17)*5;a->lay+=v17;a->lax+=v17;a->ray+=v17;
  F32 q=(1-att)*(1-att);F32 v21=sin((1-q*q)*PI),v22=sin(att*PI),v23=a->hx-0.7;a->ray+=v17*2;a->rax-=-(v23*v22)*0.75+v21*1.2;a->raz=sin(att*PI)*-0.4;}
 if(sneak){a->bx=0.5;a->legZ=4;a->legY=9;a->hyo=1;a->rax+=0.4;a->lax+=0.4;}else{a->bx=0;a->legZ=0;a->legY=12;a->hyo=0;}
 F32 v25=cos(bob*0.09)*0.05+0.05,v26=sin(bob*0.067);a->raz+=v25;a->laz-=v25;a->rax+=v26*0.05;a->lax-=v26*0.05;}
// parts: 1 head, 2 body, 4 right arm, 8 left arm, 16 right leg, 32 left leg
U0 MC33_Parts(I32 mask,F32 g){MC33Anim *a=&g33_a;
 if(mask&1){MC31_Part(0,a->hyo,0,a->hx,a->hy,0);MC33_Box(0,0,-4,-8,-4,8,8,8,g,FALSE);MC31_End();}
 if(mask&2){MC31_Part(0,0,0,a->bx,a->by,0);MC33_Box(16,16,-4,0,-2,8,12,4,g,FALSE);MC31_End();}
 if(mask&4){MC31_Part(a->rox,2,a->roz,a->rax,a->ray,a->raz);MC33_Box(40,16,-3,-2,-2,4,12,4,g,FALSE);MC31_End();}
 if(mask&8){MC31_Part(a->lox,2,a->loz,a->lax,a->lay,a->laz);MC33_Box(40,16,-1,-2,-2,4,12,4,g,TRUE);MC31_End();}
 if(mask&16){MC31_Part(-2,a->legY,a->legZ,a->rlx,0,0);MC33_Box(0,16,-2,0,-2,4,12,4,g,FALSE);MC31_End();}
 if(mask&32){MC31_Part(2,a->legY,a->legZ,a->llx,0,0);MC33_Box(0,16,-2,0,-2,4,12,4,g,TRUE);MC31_End();}}
// ---- item rendering (ItemRenderer::renderItem: block as 6-face cube centred on the origin, sprite as a 1/16 thick slab) ----
Bool MC33_Full3D(I32 id){if(id>=256 && id<=259)return TRUE;if(id>=267 && id<=280)return TRUE;if(id>=283 && id<=286)return TRUE;if(id>=290 && id<=294)return TRUE;if(id==346 || id==352)return TRUE;return FALSE;}
Bool MC33_IsBlock(I32 id){return id<256 && G29_TileShape[id]>=0 && MC029_Can3D(G29_TileShape[id]);}
F32 g33_saveM[9];
U0 MC33_BlockShade(F32 b,F32 f){hcgl028_glColor4f(b*f,b*f,b*f,1);}
U0 MC33_Block(MCApp028 *s,I32 id,I32 aux,F32 b){I32 i;for(i=0;i<9;i++)g33_saveM[i]=g29_m[i];for(i=0;i<9;i++)g29_m[i]=0;g29_m[0]=1;g29_m[4]=1;g29_m[8]=1;g29_tOX=-0.5;g29_tOY=-0.5;g29_tOZ=-0.5;g29_tS=1;
 MC029_Bind(&g29_texTerrain);I32 shape=G29_TileShape[id];TextureUVCoordinateSet t;hcgl028_glBegin(7);
 if(shape==0 || shape==31 || shape==22 || id==54){MC029_Shape(0,0,0,1,1,1);if(id==44 || id==158)MC029_Shape(0,0,0,1,0.5,1);if(id==78)MC029_Shape(0,0,0,1,0.125,1);if(id==171)MC029_Shape(0,0,0,1,0.0625,1);if(id==96)MC029_Shape(0,0.40625,0,1,0.59375,1);if(id==54)MC029_Shape(0.0625,0,0.0625,0.9375,0.875,0.9375);if(id==60)MC029_Shape(0,0,0,1,0.9375,1);
  MC33_BlockShade(b,0.5);MC029_TileUV(s,id,aux,0,&t);MC029_FaceDown(&t);MC33_BlockShade(b,1);MC029_TileUV(s,id,aux,1,&t);MC029_FaceUp(&t);
  MC33_BlockShade(b,0.8);MC029_TileUV(s,id,aux,2,&t);MC029_FaceNorth(&t,0);MC029_TileUV(s,id,aux,3,&t);MC029_FaceSouth(&t,0);
  MC33_BlockShade(b,0.6);MC029_TileUV(s,id,aux,4,&t);MC029_FaceWest(&t,0);MC029_TileUV(s,id,aux,5,&t);MC029_FaceEast(&t,0);}
 else MC029_GuiTile(s,id,aux,b,1);
 hcgl028_glEnd();for(i=0;i<9;i++)g29_m[i]=g33_saveM[i];hcgl028_glColor4f(1,1,1,1);}
U0 MC33_Sprite(MCTex029 *tex,TextureUVCoordinateSet *uv,F32 b,I32 col){F32 r=b,g=b,bl=b;if(col!=-1){r=((col>>16)&255)/255.0*b;g=((col>>8)&255)/255.0*b;bl=(col&255)/255.0*b;}
 F32 u0=uv->maxX,u1=uv->minX,v0=uv->minY,v1=uv->maxY,th=0.0625;I32 i;MC029_Bind(tex);hcgl028_glBegin(7);
 hcgl028_glColor4f(r,g,bl,1);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(0,0,0);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(1,0,0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(1,1,0);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(0,1,0);
 hcgl028_glColor4f(r*0.8,g*0.8,bl*0.8,1);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(0,1,-th);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(1,1,-th);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(1,0,-th);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(0,0,-th);
 hcgl028_glColor4f(r*0.6,g*0.6,bl*0.6,1);
 for(i=0;i<16;i++){F32 f=i/16.0,f2=(i+0.5)/16.0,uu=u0+(u1-u0)*f2,vv=v1+(v0-v1)*f2;
  hcgl028_glTexCoord2f(uu,v1);hcgl028_glVertex3f(f,0,-th);hcgl028_glTexCoord2f(uu,v1);hcgl028_glVertex3f(f,0,0);hcgl028_glTexCoord2f(uu,v0);hcgl028_glVertex3f(f,1,0);hcgl028_glTexCoord2f(uu,v0);hcgl028_glVertex3f(f,1,-th);
  F32 e=f+0.0625;hcgl028_glTexCoord2f(uu,v0);hcgl028_glVertex3f(e,1,-th);hcgl028_glTexCoord2f(uu,v0);hcgl028_glVertex3f(e,1,0);hcgl028_glTexCoord2f(uu,v1);hcgl028_glVertex3f(e,0,0);hcgl028_glTexCoord2f(uu,v1);hcgl028_glVertex3f(e,0,-th);
  hcgl028_glTexCoord2f(u0,vv);hcgl028_glVertex3f(0,f,0);hcgl028_glTexCoord2f(u1,vv);hcgl028_glVertex3f(1,f,0);hcgl028_glTexCoord2f(u1,vv);hcgl028_glVertex3f(1,f,-th);hcgl028_glTexCoord2f(u0,vv);hcgl028_glVertex3f(0,f,-th);
  hcgl028_glTexCoord2f(u0,vv);hcgl028_glVertex3f(0,e,-th);hcgl028_glTexCoord2f(u1,vv);hcgl028_glVertex3f(1,e,-th);hcgl028_glTexCoord2f(u1,vv);hcgl028_glVertex3f(1,e,0);hcgl028_glTexCoord2f(u0,vv);hcgl028_glVertex3f(0,e,0);}
 hcgl028_glEnd();hcgl028_glColor4f(1,1,1,1);}
U0 MC33_Item(MCApp028 *s,I32 id,I32 aux,F32 b){if(id<1 || id>511 || !s->catalog.itemExists[id])return;if(MC33_IsBlock(id)){MC33_Block(s,id,aux,b);return;}TextureUVCoordinateSet uv;
 hcgl028_glPushMatrix();hcgl028_glTranslatef(0,-0.3,0);hcgl028_glScalef(1.5,1.5,1.5);hcgl028_glRotatef(50,0,1,0);hcgl028_glRotatef(335,0,0,1);hcgl028_glTranslatef(-0.9375,-0.0625,0);
 if(id<256){MC029_TileUV(s,id,aux,2,&uv);MC33_Sprite(&g29_texTerrain,&uv,b,MC029_TileColor(id,aux));}else{MC029_ItemUV(s,id,aux,&uv);MC33_Sprite(&g29_texItems,&uv,b,-1);}hcgl028_glPopMatrix();}
// ---- PlayerRenderer: skin + armor layers + held item ----
U0 MC33_DrawPlayer(MCApp028 *s,Player *p,F32 wp,F32 ws,F32 bob,F32 hy,F32 hp,F32 att,F32 light,Bool menu){MC33_LoadTex();I32 hid=g33_handId,haux=g33_handAux;if(menu)hid=-1;
 MC33_SetupAnim(wp,ws,bob,hy,hp,att,hid>0,FALSE);hcgl028_glEnable(0xDE1);g31_tw=64;g31_th=32;hcgl028_glColor4f(light,light,light,1);
 if(g33_charTex){hcgl028_glBindTexture(0xDE1,g33_charTex);MC33_Parts(63,0);}
 I32 k;I32 masks[4]={1,2|4|8,2|16|32,16|32};for(k=0;k<4;k++){ItemInstance *a=&p->armor[k];if(!MC33_IsArmor(a))continue;I32 m=(ItemInstance_getId(a)-298)/4,layer=0;F32 g=1.0;if(k==2){layer=1;g=0.5;}U32 tex=g33_armorTex[m*2+layer];if(!tex)continue;
  hcgl028_glBindTexture(0xDE1,tex);hcgl028_glColor4f(light,light,light,1);MC33_Parts(masks[k],g);}
 if(hid>0){MC33Anim *a=&g33_a;hcgl028_glPushMatrix();MC31_Part(a->rox,2,a->roz,a->rax,a->ray,a->raz);hcgl028_glTranslatef(-0.0625,0.4375,0.0625);
  if(MC33_IsBlock(hid)){hcgl028_glTranslatef(0,0.1875,-0.3125);hcgl028_glRotatef(20,1,0,0);hcgl028_glRotatef(45,0,1,0);hcgl028_glScalef(-0.375,-0.375,0.375);}
  else if(MC33_Full3D(hid)){hcgl028_glTranslatef(0,0.1875,0);hcgl028_glScalef(0.625,-0.625,0.625);hcgl028_glRotatef(-100,1,0,0);hcgl028_glRotatef(45,0,1,0);}
  else{hcgl028_glTranslatef(0.25,0.1875,-0.1875);hcgl028_glScalef(0.375,0.375,0.375);hcgl028_glRotatef(60,0,0,1);hcgl028_glRotatef(-90,1,0,0);hcgl028_glRotatef(20,0,0,1);}
  MC33_Item(s,hid,haux,light);MC31_End();hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);g31_th=32;}
// third person: MobRenderer transform at the interpolated feet position
U0 MC033_RenderPlayer(MCApp028 *s,F32 pt){if(!g29_opt.thirdPerson && !g35_shooting)return;Player *p=MC33_P(s);MCBody023 *b=&p->mob.entity.body;if(b->health<=0)return;
 F32 x=b->prevX+(b->x-b->prevX)*pt,y=b->prevY+(b->y-b->prevY)*pt-1.62,z=b->prevZ+(b->z-b->prevZ)*pt,body=g33_bodyPrev+(g33_body-g33_bodyPrev)*pt,yaw=b->prevYaw+MC33_Wrap(b->yaw-b->prevYaw)*pt,pitch=b->prevPitch+(b->pitch-b->prevPitch)*pt;
 F32 ws=g33_walkSpeedPrev+(g33_walkSpeed-g33_walkSpeedPrev)*pt,wp=g33_walkPos-g33_walkSpeed*(1-pt);if(ws>1)ws=1;F32 light=MC31_Bright(floorf(x),floorf(y+1.2),floorf(z));
 MC33_LightOn();hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,z);
 if(p->sleeping){F32 r=Player_getSleepRotation(p);hcgl028_glTranslatef(0,-1.0,0);hcgl028_glRotatef(r,0,1,0);hcgl028_glRotatef(-90,1,0,0);hcgl028_glRotatef(270,0,1,0);body=0;yaw=0;}
 hcgl028_glRotatef(180-body,0,1,0);hcgl028_glScalef(-1,-1,1);hcgl028_glTranslatef(0,-24*0.0625-0.0078125,0);
 MC33_DrawPlayer(s,p,wp,ws,g33_bob+pt,MC33_Wrap(yaw-body),pitch,MC33_Att(pt),light,FALSE);hcgl028_glPopMatrix();MC33_LightOff();hcgl028_glBindTexture(0xDE1,s->terrainTex);}
// ---- camera: third person pull-back (GameRenderer::moveCameraToPlayer) and the in-bed eye ----
Bool MC33_Blocks(MCApp028 *s,F32 x,F32 y,F32 z){I32 id=Level_getTile(&s->level,floorf(x),floorf(y),floorf(z));if(id<=0)return FALSE;if(id>=8 && id<=11)return FALSE;return s->catalog.registry.tiles[id].solid;}
U0 MC033_Camera(MCApp028 *s,Vec3 *eye,Vec3 *target,F32 pt){Player *p=MC33_P(s);F32 dx=target->x-eye->x,dy=target->y-eye->y,dz=target->z-eye->z,len=sqrt(dx*dx+dy*dy+dz*dz);if(len<=0)return;dx/=len;dy/=len;dz/=len;
 if(p->sleeping){I32 d=Level_getData(&s->level,p->bedX,p->bedY,p->bedZ)&3;eye->x=p->bedX+g33_bedOX[d];eye->y=p->bedY+0.7;eye->z=p->bedZ+g33_bedOZ[d];}
 if(g29_opt.thirdPerson){F32 best=4;I32 k;for(k=0;k<8;k++){F32 ox=((k&1)*2-1)*0.1,oy=(((k>>1)&1)*2-1)*0.1,oz=(((k>>2)&1)*2-1)*0.1,t=0;while(t<best){F32 px=eye->x+ox-dx*t,py=eye->y+oy-dy*t,pz=eye->z+oz-dz*t;if(MC33_Blocks(s,px,py,pz)){best=t;break;}t+=0.05;}}
  best-=0.05;if(best<0)best=0;eye->x-=dx*best;eye->y-=dy*best;eye->z-=dz*best;}
 target->x=eye->x+dx;target->y=eye->y+dy;target->z=eye->z+dz;}
// ---- ItemInHandRenderer::render (first person) ----
U0 MC033_Hand(MCApp028 *s,F32 pt){if(g29_opt.thirdPerson || g29_opt.hideGui)return;MC035_AnimMode(s,1);Player *p=MC33_P(s);MCBody023 *b=&p->mob.entity.body;if(b->health<=0 || p->sleeping)return;MC33_LoadTex();
 F32 eq=g33_equipPrev+(g33_equip-g33_equipPrev)*pt,a=MC33_Att(pt),PI=MC33_PI,light=MC31_Bright(floorf(b->x),floorf(b->y),floorf(b->z));
 hcgl028_glClear(0x100);hcgl028_glMatrixMode(0x1701);hcgl028_glLoadMatrixf(s->camera.projectionMat);hcgl028_glMatrixMode(0x1700);hcgl028_glLoadIdentity();hcgl028_glEnable(0xB71);hcgl028_glDepthMask(1);hcgl028_glDisable(0xB60);hcgl028_glEnable(0xDE1);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.1);hcgl028_glDisable(0xBE2);
 I32 id=g33_handId;Bool bowing=id==261 && g35_using;if(bowing)a=0;
 if(id>0 && s->catalog.itemExists[id]){F32 v13=sin(sqrt(a)*PI);hcgl028_glPushMatrix();hcgl028_glTranslatef(-v13*0.4,sin(sqrt(a)*PI*2)*0.2,-sin(a*PI)*0.2);hcgl028_glTranslatef(0.56,-0.52-(1-eq)*0.6,-0.72);hcgl028_glRotatef(45,0,1,0);
  hcgl028_glRotatef(-sin(a*a*PI)*20,0,1,0);hcgl028_glRotatef(-v13*20,0,0,1);hcgl028_glRotatef(-v13*80,1,0,0);hcgl028_glScalef(0.4,0.4,0.4);if(bowing)MC035_BowPose(pt);
  if(MC33_Full3D(id)){hcgl028_glRotatef(0,0,1,0);}MC33_Item(s,id,g33_handAux,light);hcgl028_glPopMatrix();}
 else if(g33_charTex){F32 v13=sin(sqrt(a)*PI);hcgl028_glPushMatrix();hcgl028_glTranslatef(-v13*0.3,sin(sqrt(a)*PI*2)*0.4,-sin(a*PI)*0.4);hcgl028_glTranslatef(0.64,-0.6-(1-eq)*0.6,-0.72);hcgl028_glRotatef(45,0,1,0);
  hcgl028_glRotatef(v13*70,0,1,0);hcgl028_glRotatef(-sin(a*a*PI)*20,0,0,1);hcgl028_glBindTexture(0xDE1,g33_charTex);hcgl028_glTranslatef(-1,3.6,3.5);hcgl028_glRotatef(120,0,0,1);hcgl028_glRotatef(200,1,0,0);hcgl028_glRotatef(-135,0,1,0);hcgl028_glTranslatef(5.6,0,0);
  MC33_LightOn();g31_tw=64;g31_th=32;hcgl028_glColor4f(light,light,light,1);MC31_Part(-5,2,0,0,0,0.1);MC33_Box(40,16,-3,-2,-2,4,12,4,0,FALSE);MC31_End();
  ItemInstance *ch=&p->armor[1];if(MC33_IsArmor(ch)){U32 tex=g33_armorTex[((ItemInstance_getId(ch)-298)/4)*2];if(tex){hcgl028_glBindTexture(0xDE1,tex);MC31_Part(-5,2,0,0,0,0.1);MC33_Box(40,16,-3,-2,-2,4,12,4,1,FALSE);MC31_End();}}
  MC33_LightOff();hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);hcgl028_glBindTexture(0xDE1,s->terrainTex);hcgl028_glLoadMatrixf(s->camera.modelViewMat);}
// ---- Gui::render armor bar ----
U0 MC033_ArmorHud(MCApp028 *s){I32 armor=MC33_ArmorValue(MC33_P(s)),v;if(armor<=0)return;for(v=1;v<20;v+=2){I32 x=4*v+82;if(v<armor)MC029_Blit(&g29_texIcons,x,2,34,9,9,9,0,0);else if(v==armor)MC029_Blit(&g29_texIcons,x,2,52,9,9,9,0,0);else MC029_Blit(&g29_texIcons,x,2,16,9,9,9,0,0);}MC029_White();}
// ---- ArmorScreen ----
MCPatch029 g33_pBox;Bool g33_pInit;I32 g33_slotX,g33_slotY[4],g33_boxX,g33_boxY,g33_boxW,g33_boxH,g33_armN;
U0 MC33_ArmorItems(MCApp028 *s){Player *pp=MC33_P(s);Inventory *inv=&pp->inventory;I32 i,n=0;for(i=9;i<inv->size && n<256;i++)if(MC33_IsArmor(inv->items[i]))g29_ipItem[n++]=inv->items[i];g33_armN=n;if(g29_screen!=G33S_ARMOR)return;g29_ip.real=TRUE;if(n!=g29_ip.n)MC029_PaneCount(n);}
U0 MC033_ArmorInit(MCApp028 *s){MC32_InitPatches();if(!g33_pInit){g33_pInit=TRUE;MC029_PatchInit(&g33_pBox,&g29_texSprite,0,20,8,8,3,3);}g29_btnN=0;I32 w=g29_gw,h=g29_gh,i;
 MC029_Add(50,2,0,0,w,26,"Armor");MC029_AddT(3,4,4,38,18,"Back");I32 v3=w/1.8,v4=v3-20;if(v4<0)v4=v3+11;I32 pw=v4&0xFFFFFFE0;if(pw<32)pw=32;g33_slotX=pw+20;
 for(i=0;i<4;i++){g33_slotY[i]=32+24*i;MC029_Add(10+i,6,g33_slotX,g33_slotY[i],20,20,NULL);}
 I32 r=w-(g33_slotX+20);g33_boxX=g33_slotX+20+r/10;g33_boxW=r-2*(r/10);g33_boxY=32;g33_boxH=h-40;
 MC029_PaneSet(10,32,pw,h-40,32,4,FALSE,0);g29_ip.f248=0;g29_ip.f24C=0;g29_ip.real=TRUE;g29_ip.n=-1;MC33_ArmorItems(s);}
U0 MC033_ArmorOpen(MCApp028 *s){MC029_ScrollZero(&g29_ip.sc);g29_ip.ticker=-1;g29_ip.tickIdx=-1;printf("SCREEN033 armor open value=%d\n",MC33_ArmorValue(MC33_P(s)));}
// ArmorScreen::addItem: equip into the item's armor slot, the previous piece goes back into that inventory slot.
U0 MC33_Equip(MCApp028 *s,ItemInstance *it){if(!MC33_IsArmor(it))return;Player *p=MC33_P(s);I32 k=MC33_ArmorSlot(it);ItemInstance old=p->armor[k];p->armor[k]=*it;p->armor[k].count=1;
 if(it->count>1)it->count--;else if(MC33_IsArmor(&old))*it=old;else ItemInstance_setNull(it);s->unsaved=TRUE;printf("ARMOR033 equip slot=%d id=%d value=%d\n",k,ItemInstance_getId(&p->armor[k]),MC33_ArmorValue(p));MC33_ArmorItems(s);}
// ArmorScreen::takeAndClearSlot
U0 MC33_Unequip(MCApp028 *s,I32 k){Player *p=MC33_P(s);ItemInstance *a=&p->armor[k];if(!MC33_IsArmor(a))return;I32 n;ItemInstance **inv=MC32_InvSlots(s,&n);I32 id=ItemInstance_getId(a);MC32_Put(s,inv,n,a,a->count);if(MC33_IsArmor(a))MC32_DropItem(s,a);ItemInstance_setNull(a);s->unsaved=TRUE;printf("ARMOR033 unequip slot=%d id=%d value=%d\n",k,id,MC33_ArmorValue(p));MC33_ArmorItems(s);}
U0 MC033_ArmorPress(MCApp028 *s){MC029_PressButtons();if(g29_pressId<0)MC029_PanePress();}
U0 MC033_ArmorRelease(MCApp028 *s){I32 tap=MC029_PaneRelease();I32 id=MC029_ReleaseButtons();if(id==3){MC029_Go(G29S_SURVIVAL);return;}if(id>=10 && id<=13){MC33_Unequip(s,id-10);return;}
 if(tap>=0 && tap<g33_armN){MC030_PlayUI("random.pop2",1.0,0.3);MC33_Equip(s,g29_ipItem[tap]);}}
U0 MC033_ArmorMove(){MC029_ScrollMove(&g29_ip.sc);}
U0 MC033_ArmorWheel(I32 a){MC029_ScrollWheel(&g29_ip.sc,a);}
U0 MC33_MenuPlayer(MCApp028 *s,F32 x,F32 y){Player *p=MC33_P(s);F32 t=getTimeS()-g29_t0,v17=sin(t)*10,v18=cos(t*0.05)*10,body=atan2f(v17/40,1)*20,pitch=atan2f(v18/40,1)*-20;
 hcgl028_glClear(0x100);hcgl028_glEnable(0xB71);hcgl028_glDepthMask(1);hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.1);
 hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,-200);hcgl028_glScalef(-45,45,45);hcgl028_glRotatef(180,0,0,1);hcgl028_glRotatef(pitch,1,0,0);
 hcgl028_glRotatef(180-body,0,1,0);hcgl028_glScalef(-1,-1,1);hcgl028_glTranslatef(0,-24*0.0625-0.0078125,0);MC33_DrawPlayer(s,p,t*0.25*20,0.25,t*20,body,pitch,0,1,TRUE);hcgl028_glPopMatrix();
 hcgl028_glDisable(0xB71);hcgl028_glEnable(0xBE2);hcgl028_glAlphaFunc(0x204,0.0);MC029_White();}
U0 MC033_ArmorRender(MCApp028 *s,F32 pt){MC32_InitPatches();MC33_ArmorItems(s);MC029_White();MC029_Patch(&g32_pBg,0,0,g29_gw,g29_gh);MC029_RenderButtons();MC029_PaneRender(s);MC029_White();MC029_Patch(&g32_pFrame,g29_ip.x-1,g29_ip.y-1,g29_ip.w+2,g29_ip.h+2);
 MC029_White();MC029_Patch(&g33_pBox,g33_boxX,g33_boxY,g33_boxW,g33_boxH);MC33_MenuPlayer(s,g33_boxX+g33_boxW/2,g29_gh*0.85);
 Player *p=MC33_P(s);I32 k;for(k=0;k<4;k++){I32 x=g33_slotX,y=g33_slotY[k];MC029_White();MC029_Patch(&g32_pSlot,x,y,20,20);ItemInstance *a=&p->armor[k];
  if(MC33_IsArmor(a)){MC029_RenderItem(s,ItemInstance_getId(a),a->metadata,x+3,y,1,1,1);MC029_Decorations(a,x+2,y+3);}else MC029_Blit(&g29_texItems,x+2,y,240,16*k,16,16,16,16);}
 MC029_White();}
// ---- InBedScreen ----
U0 MC033_BedInit(MCApp028 *s){g29_btnN=0;I32 w=g29_gw/3,h=g29_gh*0.15;MC029_AddT(1,(g29_gw-w)/2,g29_gh-h-h/2,w,h,"Leave Bed");}
U0 MC033_BedPress(MCApp028 *s){MC029_PressButtons();}
U0 MC033_BedRelease(MCApp028 *s){I32 id=MC029_ReleaseButtons();if(id==1)MC033_LeaveBed(s);}
U0 MC033_BedRender(MCApp028 *s){MC029_RenderButtons();MC029_White();}
// ---- MCPE_DEMO033=night|chest|armor|third|sleep (scripted checks for the batch033 tests) ----
U0 MC33_Demo(){U8 *v=C31_getenv("MCPE_DEMO033");g33_demo=0;if(C31_getenv("MCPE_TIME"))g33_demo=99;if(!v)return;if(v[0]=='n')g33_demo=1;if(v[0]=='c')g33_demo=2;if(v[0]=='a')g33_demo=3;if(v[0]=='t')g33_demo=4;if(v[0]=='s')g33_demo=5;if(v[0]=='h')g33_demo=6;if(v[0]=='d')g33_demo=7;printf("DEMO033 mode=%d\n",g33_demo);}
U0 MC33_DemoBed(MCApp028 *s){Player *p=MC33_P(s);I32 x=floorf(p->mob.entity.body.x)+2,y=floorf(p->mob.entity.box.minY+0.01),z=floorf(p->mob.entity.body.z);
 Level_setTileAndData(&s->level,x,y,z,26,3,3);Level_setTileAndData(&s->level,x+1,y,z,26,3|8,3);MC028_Dirty(s,x,y,z);MC028_Dirty(s,x+1,y,z);printf("DEMO033 bed at=%d,%d,%d\n",x,y,z);MC033_BedUse(s,x,y,z,3);}
U0 MC33_DemoTick(MCApp028 *s){I32 t=s->ticks;Player *p=MC33_P(s);MCBody023 *b=&p->mob.entity.body;Level *l=&s->level;
 if(t==2){U8 *tv=C31_getenv("MCPE_TIME");if(tv){s->level.data.time=atoi(tv);printf("DEMO033 time=%d tod=%.3f darken=%d\n",s->level.data.time,MC033_Tod(s,0),MC33_SkyDarken(s));}}
 if(t==6 && (g33_demo==3 || g33_demo==4 || g33_demo==6)){MC028_Give(s,306,1,0);MC028_Give(s,307,1,0);MC028_Give(s,308,1,0);MC028_Give(s,309,1,0);MC028_Give(s,310,1,0);MC028_Give(s,276,1,0);printf("DEMO033 gave armor\n");}
 if(t==8 && g33_demo==4){I32 i;MC33_ArmorItems(s);for(i=0;i<4 && g33_armN>0;i++)MC33_Equip(s,g29_ipItem[0]);g29_opt.thirdPerson=TRUE;printf("DEMO033 third person armor=%d\n",MC33_ArmorValue(p));}
 if(t==10 && g33_demo==3){MC029_Go(G33S_ARMOR);}
 if(t==20 && g33_demo==3 && g29_screen==G33S_ARMOR){I32 i;for(i=0;i<4 && g33_armN>0;i++)MC33_Equip(s,g29_ipItem[0]);printf("DEMO033 armor value=%d hud\n",MC33_ArmorValue(p));}
 if(t==30 && g33_demo==3){I32 hp=b->health;MC033_Hurt(p,NULL,8,FALSE);printf("DEMO033 hurt 8 with armor: hp %d -> %d armor0 dmg=%d\n",hp,b->health,p->armor[0].metadata);}
 if(t==12 && g33_demo==6){MC028_Select(s,0);}
 if(g33_demo==6 && t>=20 && (t%12)==0)MC033_Swing();
 if(g33_demo==2 && t==40){MC032_TileUse(s,g32_gx-4,g32_gy+1,g32_gz+4);printf("DEMO033 chest use pair=%d\n",MC33_Pair(s,g32_gx-4,g32_gy+1,g32_gz+4,FALSE)!=NULL);}
 if(g33_demo==2 && t==48)printf("DEMO033 chest screen=%d lid=%.2f\n",g29_screen,MC33_Lid(MC32_Find(g32_gx-3,g32_gy+1,g32_gz+4))->o);
 if(g33_demo==5 && t==25){MC33_DemoBed(s);}
 if(g33_demo==5 && (t%20)==0)printf("DEMO033 sleep t=%d sleeping=%d counter=%d time=%d screen=%d\n",t,p->sleeping,p->sleepingCounter,s->level.data.time,g29_screen);}
