// Batch029 item icons: ItemRenderer::renderGuiItemNew / renderGuiItemInChunk / TileRenderer::renderGuiTile
// (Tesselator offset + scale3d(9*s) + tilt Rx(210)*Ry(45), faces Up/South/West, brightness 1/0.5/0.73).
F32 g29_m[9],g29_tOX=0,g29_tOY=0,g29_tOZ=0,g29_tS=1;
F32 g29_bx0=0,g29_by0=0,g29_bz0=0,g29_bx1=1,g29_by1=1,g29_bz1=1;
U0 MC029_TiltInit(){F32 a=210*3.14159265/180,b=45*3.14159265/180,ca=cosf(a),sa=sinf(a),cb=cosf(b),sb=sinf(b);g29_m[0]=cb;g29_m[1]=0;g29_m[2]=sb;g29_m[3]=sa*sb;g29_m[4]=ca;g29_m[5]=-sa*cb;g29_m[6]=-ca*sb;g29_m[7]=sa;g29_m[8]=ca*cb;}
U0 MC029_TV(F32 x,F32 y,F32 z,F32 u,F32 v){F32 X=g29_m[0]*x+g29_m[1]*y+g29_m[2]*z,Y=g29_m[3]*x+g29_m[4]*y+g29_m[5]*z,Z=g29_m[6]*x+g29_m[7]*y+g29_m[8]*z;hcgl028_glTexCoord2f(u,v);hcgl028_glVertex3f(g29_tOX+X*g29_tS,g29_tOY+Y*g29_tS,g29_tOZ+Z*g29_tS);}
U0 MC029_Shape(F32 x0,F32 y0,F32 z0,F32 x1,F32 y1,F32 z1){g29_bx0=x0;g29_by0=y0;g29_bz0=z0;g29_bx1=x1;g29_by1=y1;g29_bz1=z1;}
F32 MC029_U(TextureUVCoordinateSet *t,F32 f){return t->minX+(t->maxX-t->minX)*f;}
F32 MC029_V(TextureUVCoordinateSet *t,F32 f){return t->minY+(t->maxY-t->minY)*f;}
U0 MC029_FaceUp(TextureUVCoordinateSet *t){F32 u0=MC029_U(t,g29_bx0),u1=MC029_U(t,g29_bx1),v0=MC029_V(t,g29_bz0),v1=MC029_V(t,g29_bz1),y=g29_by1;MC029_TV(g29_bx1,y,g29_bz1,u1,v1);MC029_TV(g29_bx1,y,g29_bz0,u1,v0);MC029_TV(g29_bx0,y,g29_bz0,u0,v0);MC029_TV(g29_bx0,y,g29_bz1,u0,v1);}
U0 MC029_FaceDown(TextureUVCoordinateSet *t){F32 u0=MC029_U(t,g29_bx0),u1=MC029_U(t,g29_bx1),v0=MC029_V(t,g29_bz0),v1=MC029_V(t,g29_bz1),y=g29_by0;MC029_TV(g29_bx0,y,g29_bz1,u0,v1);MC029_TV(g29_bx0,y,g29_bz0,u0,v0);MC029_TV(g29_bx1,y,g29_bz0,u1,v0);MC029_TV(g29_bx1,y,g29_bz1,u1,v1);}
U0 MC029_FaceNorth(TextureUVCoordinateSet *t,F32 dz){F32 u0=MC029_U(t,g29_bx0),u1=MC029_U(t,g29_bx1),v0=MC029_V(t,1-g29_by1),v1=MC029_V(t,1-g29_by0),z=g29_bz0+dz;MC029_TV(g29_bx0,g29_by1,z,u1,v0);MC029_TV(g29_bx1,g29_by1,z,u0,v0);MC029_TV(g29_bx1,g29_by0,z,u0,v1);MC029_TV(g29_bx0,g29_by0,z,u1,v1);}
U0 MC029_FaceSouth(TextureUVCoordinateSet *t,F32 dz){F32 u0=MC029_U(t,g29_bx0),u1=MC029_U(t,g29_bx1),v0=MC029_V(t,1-g29_by1),v1=MC029_V(t,1-g29_by0),z=g29_bz1+dz;MC029_TV(g29_bx0,g29_by1,z,u0,v0);MC029_TV(g29_bx0,g29_by0,z,u0,v1);MC029_TV(g29_bx1,g29_by0,z,u1,v1);MC029_TV(g29_bx1,g29_by1,z,u1,v0);}
U0 MC029_FaceWest(TextureUVCoordinateSet *t,F32 dx){F32 u0=MC029_U(t,g29_bz0),u1=MC029_U(t,g29_bz1),v0=MC029_V(t,1-g29_by1),v1=MC029_V(t,1-g29_by0),x=g29_bx0+dx;MC029_TV(x,g29_by1,g29_bz1,u1,v0);MC029_TV(x,g29_by1,g29_bz0,u0,v0);MC029_TV(x,g29_by0,g29_bz0,u0,v1);MC029_TV(x,g29_by0,g29_bz1,u1,v1);}
U0 MC029_FaceEast(TextureUVCoordinateSet *t,F32 dx){F32 u0=MC029_U(t,g29_bz0),u1=MC029_U(t,g29_bz1),v0=MC029_V(t,1-g29_by1),v1=MC029_V(t,1-g29_by0),x=g29_bx1+dx;MC029_TV(x,g29_by0,g29_bz1,u0,v1);MC029_TV(x,g29_by0,g29_bz0,u1,v1);MC029_TV(x,g29_by1,g29_bz0,u1,v0);MC029_TV(x,g29_by1,g29_bz1,u0,v0);}

// Carried/GUI textures (getCarriedTexture / getTexture with auxiliary data) for the creative list.
U0 MC029_T(TextureUVCoordinateSet *uv,I32 tex,I32 variant){MC028_UV(uv,tex,variant);}
U0 MC029_TileUV(MCApp028 *s,I32 id,I32 aux,I32 face,TextureUVCoordinateSet *uv){MC028_View(&s->catalog,id,aux);*uv=s->catalog.views[id].uv[face];I32 k=aux&3;
 if(id==2){if(face==1)MC029_T(uv,G29T_GRASS,3);else if(face==0)MC029_T(uv,G29T_DIRT,0);else MC029_T(uv,G29T_GRASS,1);return;}
 if(id==18){MC029_T(uv,G29T_LEAVES,4+k);return;}
 if(id==17){I32 top[4]={1,5,3,7},side[4]={0,4,2,6};if(face<2)MC029_T(uv,G29T_LOG,top[k]);else MC029_T(uv,G29T_LOG,side[k]);return;}
 if(id==5 || id==85 || id==107 || id==53 || id==96+1000){MC029_T(uv,G29T_PLANKS,0);if(id==5)MC029_T(uv,G29T_PLANKS,k);return;}
 if(id==158){MC029_T(uv,G29T_PLANKS,aux&7);return;}
 if(id==134 || id==135 || id==136){MC029_T(uv,G29T_PLANKS,id-133);return;}
 if(id==6){I32 sm[4]={0,2,1,3};MC029_T(uv,G29T_SAPLING,sm[k]);return;}
 if(id==31){if(aux==2)MC029_T(uv,G29T_TALLGRASS,4);else if(aux==1)MC029_T(uv,G29T_TALLGRASS,3);else MC029_T(uv,G29T_TALLGRASS,0);return;}
 if(id==32){MC029_T(uv,G29T_TALLGRASS,1);return;}
 if(id==24 || id==128){if(id==128)aux=0;if(face==1)MC029_T(uv,G29T_SANDSTONE,3);else if(face==0){if(aux>0)MC029_T(uv,G29T_SANDSTONE,3);else MC029_T(uv,G29T_SANDSTONE,4);}else MC029_T(uv,G29T_SANDSTONE,aux%3);return;}
 if(id==155 || id==156){if(id==156)aux=0;I32 q=aux%3;if(q==0){if(face==1)MC029_T(uv,G29T_QUARTZ_BLOCK,1);else if(face==0)MC029_T(uv,G29T_QUARTZ_BLOCK,2);else MC029_T(uv,G29T_QUARTZ_BLOCK,0);}else if(q==1){if(face<2)MC029_T(uv,G29T_QUARTZ_BLOCK,6);else MC029_T(uv,G29T_QUARTZ_BLOCK,5);}else{if(face<2)MC029_T(uv,G29T_QUARTZ_BLOCK,4);else MC029_T(uv,G29T_QUARTZ_BLOCK,3);}return;}
 if(id==61 || id==62){if(face<2)MC029_T(uv,G29T_FURNACE,3);else if(face==3){if(id==62)MC029_T(uv,G29T_FURNACE,1);else MC029_T(uv,G29T_FURNACE,0);}else MC029_T(uv,G29T_FURNACE,2);return;}
 if(id==54){if(face<2)MC029_T(uv,G29T_CHEST_INVENTORY,0);else if(face==3)MC029_T(uv,G29T_CHEST_INVENTORY,2);else MC029_T(uv,G29T_CHEST_INVENTORY,1);return;}
 if(id==86 || id==91){if(face<2)MC029_T(uv,G29T_PUMPKIN,0);else if(face==3){if(id==91)MC029_T(uv,G29T_PUMPKIN,3);else MC029_T(uv,G29T_PUMPKIN,2);}else MC029_T(uv,G29T_PUMPKIN,1);return;}
 if(id==103){if(face<2)MC029_T(uv,G29T_MELON,1);else MC029_T(uv,G29T_MELON,0);return;}
 if(id==58){if(face==1)MC029_T(uv,G29T_CRAFTING_TABLE,0);else if(face==0)MC029_T(uv,G29T_PLANKS,0);else if(face==2 || face==3)MC029_T(uv,G29T_CRAFTING_TABLE,2);else MC029_T(uv,G29T_CRAFTING_TABLE,1);return;}
 if(id==46){if(face==0)MC029_T(uv,G29T_TNT,2);else if(face==1)MC029_T(uv,G29T_TNT,1);else MC029_T(uv,G29T_TNT,0);return;}
 if(id==170){if(face<2)MC029_T(uv,G29T_HAYBLOCK,0);else MC029_T(uv,G29T_HAYBLOCK,1);return;}
 if(id==245){if(face==1)MC029_T(uv,G29T_STONECUTTER,2);else if(face==0)MC029_T(uv,G29T_STONECUTTER,3);else if(face<4)MC029_T(uv,G29T_STONECUTTER,0);else MC029_T(uv,G29T_STONECUTTER,1);return;}
 if(id==247){MC029_T(uv,G29T_REACTOR_CORE_STAGE_X,0);return;}
 if(id==81){if(face==1)MC029_T(uv,G29T_CACTUS,0);else if(face==0)MC029_T(uv,G29T_CACTUS,2);else MC029_T(uv,G29T_CACTUS,1);return;}
 if(id==47){if(face<2)MC029_T(uv,G29T_PLANKS,0);else MC029_T(uv,G29T_BOOKSHELF,0);return;}
 if(id==44 || id==43){I32 t=aux&7;if(t==0){if(face<2)MC029_T(uv,G29T_STONE_SLAB,0);else MC029_T(uv,G29T_STONE_SLAB,1);}else if(t==1){if(face<2)MC029_T(uv,G29T_SANDSTONE,3);else MC029_T(uv,G29T_SANDSTONE,0);}else if(t==2)MC029_T(uv,G29T_PLANKS,0);else if(t==3)MC029_T(uv,G29T_COBBLESTONE,0);else if(t==4)MC029_T(uv,G29T_BRICK,0);else if(t==5)MC029_T(uv,G29T_STONEBRICK,0);else MC029_T(uv,G29T_QUARTZ_BLOCK,0);return;}
 if(id==35 || id==171){MC029_T(uv,G29T_WOOL,aux&15);return;}
 if(id==98){MC029_T(uv,G29T_STONEBRICK,aux&3);return;}
 if(id==139){if(aux==1)MC029_T(uv,G29T_COBBLESTONE_MOSSY,0);else MC029_T(uv,G29T_COBBLESTONE,0);return;}
 if(id==67){MC029_T(uv,G29T_COBBLESTONE,0);return;}
 if(id==108){MC029_T(uv,G29T_BRICK,0);return;}
 if(id==109){MC029_T(uv,G29T_STONEBRICK,0);return;}
 if(id==114 || id==112){MC029_T(uv,G29T_NETHER_BRICK,0);return;}
 if(id==96){MC029_T(uv,G29T_TRAPDOOR,0);return;}
 if(id==78 || id==80){MC029_T(uv,G29T_SNOW,0);return;}
 if(id==65){MC029_T(uv,G29T_LADDER,0);return;}
 if(id==50){MC029_T(uv,G29T_TORCH_ON,0);return;}
 if(id==66){MC029_T(uv,G29T_RAIL_NORMAL,0);return;}
 if(id==27){MC029_T(uv,G29T_RAIL_GOLDEN,0);return;}
 if(id==30){MC029_T(uv,G29T_WEB,0);return;}
 if(id==37){MC029_T(uv,G29T_FLOWER_DANDELION,0);return;}
 if(id==38){MC029_T(uv,G29T_FLOWER_ROSE_BLUE,0);return;}
 if(id==39){MC029_T(uv,G29T_MUSHROOM_BROWN,0);return;}
 if(id==40){MC029_T(uv,G29T_MUSHROOM_RED,0);return;}
 if(id==20){MC029_T(uv,G29T_GLASS,0);return;}
 if(id==102){MC029_T(uv,G29T_GLASS,0);return;}
 if(id==101){MC029_T(uv,G29T_IRON_BARS,0);return;}
}
U0 MC029_ItemUV(MCApp028 *s,I32 id,I32 aux,TextureUVCoordinateSet *uv){*uv=s->catalog.itemUV[id];I32 tex=-1,variant=0;if(id==261 && g35_using){tex=17;variant=MC035_BowFrame();}if(id==351){tex=41;variant=aux&15;}if(id==383){tex=141;variant=aux-10;if(variant<0)variant=0;}if(id==325){tex=22;if(aux==1)variant=1;if(aux==8)variant=2;if(aux==10)variant=3;}
 if(tex>=0){if(variant>=ItemCount028[tex])variant=0;F32 *u=ItemUV028+(ItemFirst028[tex]+variant)*6;TextureUVCoordinateSet_Init(uv,u[0],u[1],u[2],u[3],u[4],u[5]);}}
Bool MC029_Can3D(I32 shape){return shape==0 || shape==13 || shape==10 || shape==11 || shape==21 || shape==32 || shape==22 || shape==31;}
U0 MC029_Bright(F32 b,F32 a){hcgl028_glColor4f(b,b,b,a);}
// TileRenderer::renderGuiTile (brightness b, alpha a); emitted inside glBegin(GL_QUADS).
U0 MC029_GuiTile(MCApp028 *s,I32 id,I32 aux,F32 b,F32 a){I32 shape=G29_TileShape[id];TextureUVCoordinateSet t;I32 i,f;MC029_Shape(0,0,0,1,1,1);
 if(shape==0 || shape==31 || id==54 || shape==22){
  if(id==44 || id==158)MC029_Shape(0,0,0,1,0.5,1);if(id==78)MC029_Shape(0,0,0,1,0.125,1);if(id==171)MC029_Shape(0,0,0,1,0.0625,1);if(id==96)MC029_Shape(0,0.40625,0,1,0.59375,1);if(id==54)MC029_Shape(0.0625,0,0.0625,0.9375,0.875,0.9375);if(id==60)MC029_Shape(0,0,0,1,0.9375,1);
  MC029_Bright(b,a);MC029_TileUV(s,id,aux,1,&t);MC029_FaceUp(&t);MC029_Bright(b*0.5,a);MC029_TileUV(s,id,aux,3,&t);MC029_FaceSouth(&t,0);MC029_Bright(b*0.73,a);MC029_TileUV(s,id,aux,4,&t);MC029_FaceWest(&t,0);return;}
 if(shape==13){MC029_Bright(b,a);MC029_TileUV(s,id,0,0,&t);MC029_FaceDown(&t);MC029_TileUV(s,id,0,1,&t);MC029_FaceUp(&t);MC029_Bright(b*0.5,a);MC029_TileUV(s,id,0,2,&t);MC029_FaceNorth(&t,0.0625);MC029_TileUV(s,id,0,3,&t);MC029_FaceSouth(&t,-0.0625);MC029_Bright(b*0.73,a);MC029_TileUV(s,id,0,4,&t);MC029_FaceWest(&t,0.0625);MC029_TileUV(s,id,0,5,&t);MC029_FaceEast(&t,-0.0625);return;}
 I32 n=0;F32 box[24];
 if(shape==10){n=2;F32 b10[12]={0,0,0,1,1,0.5, 0,0,0.5,1,0.5,1};for(i=0;i<12;i++)box[i]=b10[i];}
 if(shape==11){n=4;F32 b11[24]={0.375,0,0,0.625,1,0.25, 0.375,0,0.75,0.625,1,1, 0.4375,0.8125,-0.125,0.5625,0.9375,1.125, 0.4375,0.3125,-0.125,0.5625,0.4375,1.125};for(i=0;i<24;i++)box[i]=b11[i];}
 if(shape==21){n=3;F32 b21[18]={0.4375,0.3,0,0.5625,1,0.125, 0.4375,0.3,0.875,0.5625,1,1, 0.4375,0.5,0,0.5625,0.9375,1};for(i=0;i<18;i++)box[i]=b21[i];}
 if(shape==32){n=4;F32 b32[24]={0.75,0,0.25,1.25,1,0.75, 0.5,0,0.3125,0.75,0.8125,0.6875, 0.25,0,0.3125,0.5,0.8125,0.6875, -0.25,0,0.25,0.25,1,0.75};for(i=0;i<24;i++)box[i]=b32[i];}
 for(i=0;i<n;i++){MC029_Shape(box[i*6],box[i*6+1],box[i*6+2],box[i*6+3],box[i*6+4],box[i*6+5]);MC029_Bright(b,a);
  if(shape==10 || shape==11){MC029_TileUV(s,id,aux,0,&t);MC029_FaceDown(&t);MC029_TileUV(s,id,aux,1,&t);MC029_FaceUp(&t);}else{MC029_TileUV(s,id,aux,0,&t);MC029_FaceUp(&t);MC029_TileUV(s,id,aux,1,&t);MC029_FaceDown(&t);}
  MC029_Bright(b*0.5,a);MC029_TileUV(s,id,aux,2,&t);MC029_FaceNorth(&t,0);MC029_TileUV(s,id,aux,3,&t);MC029_FaceSouth(&t,0);MC029_Bright(b*0.73,a);MC029_TileUV(s,id,aux,4,&t);MC029_FaceWest(&t,0);MC029_TileUV(s,id,aux,5,&t);MC029_FaceEast(&t,0);}
 f=0;}
// ItemRenderer::iconBlit
U0 MC029_IconBlit(MCTex029 *tex,F32 x,F32 y,TextureUVCoordinateSet *uv,F32 w,F32 h,F32 b,F32 a,I32 col,F32 sc){F32 r=b,g=b,bl=b;if(col!=-1){r=((col>>16)&255)/255.0*b;g=((col>>8)&255)/255.0*b;bl=(col&255)/255.0*b;if(r>1)r=1;if(g>1)g=1;if(bl>1)bl=1;}hcgl028_glColor4f(r,g,bl,a);F32 dx=w*0.5*(sc-1),dy=h*0.5*(sc-1);MC029_Bind(tex);hcgl028_glBegin(7);hcgl028_glTexCoord2f(uv->minX,uv->maxY);hcgl028_glVertex3f(x-dx,y+h+dy,0);hcgl028_glTexCoord2f(uv->maxX,uv->maxY);hcgl028_glVertex3f(x+w+dx,y+h+dy,0);hcgl028_glTexCoord2f(uv->maxX,uv->minY);hcgl028_glVertex3f(x+w+dx,y-dy,0);hcgl028_glTexCoord2f(uv->minX,uv->minY);hcgl028_glVertex3f(x-dx,y-dy,0);hcgl028_glEnd();}
I32 MC029_TileColor(I32 id,I32 aux){if(id==31 && aux==0)return 0x87CD49;return -1;}
// ItemRenderer::renderGuiItemNew(textures,item,frame,x,y,alpha,brightness,scale)
U0 MC029_RenderItem(MCApp028 *s,I32 id,I32 aux,F32 x,F32 y,F32 alpha,F32 b,F32 sc){if(id<1 || id>511 || !s->catalog.itemExists[id])return;TextureUVCoordinateSet uv;
 if(id<256 && G29_TileShape[id]>=0 && MC029_Can3D(G29_TileShape[id])){g29_tOX=x+(sc-1)*-6+1;g29_tOY=y+(sc-1)*4+13;g29_tOZ=-10;g29_tS=sc*9;MC029_Bind(&g29_texTerrain);hcgl028_glBegin(7);MC029_GuiTile(s,id,aux,b,alpha);hcgl028_glEnd();MC029_White();return;}
 if(id<256){MC029_TileUV(s,id,aux,2,&uv);MC029_IconBlit(&g29_texTerrain,x-1,y+1,&uv,16,16,b,1,MC029_TileColor(id,aux),sc);MC029_White();return;}
 MC029_ItemUV(s,id,aux,&uv);MC029_IconBlit(&g29_texItems,x-1,y+1,&uv,16,16,b,1,-1,sc);MC029_White();}
// Gui::itemCountItoa
U0 MC029_CountText(I32 n,U8 *out){if(n>99)strcpy(out,"99+");else sprintf(out,"%d",n);}
