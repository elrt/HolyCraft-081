// Batch033 world-side logic: NormalDayCycleDimension::getTimeOfDay, Level::getSkyDarken/getSkyColor/getCloudColor/
// getStarBrightness, Dimension::updateLightRamp, LevelRenderer::renderSky/_renderSunOrMoon/_renderStars/renderClouds,
// BedTile::use + Player::startSleepInBed/stopSleepInBed + Level sleep skip, ChestTileEntity lid animation/pairing,
// Mob::getDamageAfterArmorAbsorb/Player::hurtArmor, Mob::swing/updateAttackAnim, ItemInHandRenderer::tick.
#define MC33_PI 3.14159265
MCApp028 *g33_app;
// ---- time of day / light ramp ----
F32 MC033_Tod(MCApp028 *s,F32 pt){I32 t=s->level.data.time%19200;if(t<0)t+=19200;F32 a=(t+pt)/19200.0-0.25;if(a<0)a+=1;if(a>1)a-=1;F32 b=1-(cos(a*MC33_PI)+1)/2;return a+(b-a)/3;}
F32 MC33_Cos2(MCApp028 *s,F32 pt){return cos(MC033_Tod(s,pt)*MC33_PI*2);}
F32 MC33_Clamp(F32 v,F32 a,F32 b){if(v<a)return a;if(v>b)return b;return v;}
I32 MC33_SkyDarken(MCApp028 *s){F32 v=1-(MC33_Cos2(s,1)*2+0.5);v=MC33_Clamp(v,0,0.8);I32 r=v*11;return r;}
Bool MC33_IsDay(MCApp028 *s){return MC33_SkyDarken(s)<=3;}
U0 MC33_Ramp(){I32 i;for(i=0;i<16;i++){F32 f=1-i*0.0625;g33_ramp[i]=(1-f)/(f*3+1)*0.95+0.15;}}
// ---- swing / equip / walk animation state (Mob::swing, ItemInHandRenderer::tick, Mob::tick body rotation) ----
Bool g33_swinging;I32 g33_swingT;F32 g33_att,g33_attPrev,g33_equip,g33_equipPrev;I32 g33_handId=-1,g33_handAux=0;
F32 g33_walkPos,g33_walkSpeed,g33_walkSpeedPrev,g33_body,g33_bodyPrev,g33_bob;Bool g33_inited;
U0 MC033_Swing(){if(!g33_swinging || g33_swingT>=4 || g33_swingT<0){g33_swingT=-1;g33_swinging=TRUE;}}
U0 MC033_ItemUsed(){g33_equip=0;}
F32 MC33_Wrap(F32 a){while(a<-180)a+=360;while(a>=180)a-=360;return a;}
F32 MC33_Att(F32 pt){F32 d=g33_att-g33_attPrev;if(d<0)d+=1;return g33_attPrev+d*pt;}
Player *MC33_P(MCApp028 *s){return &s->minecraft.player->player;}
U0 MC33_AnimTick(MCApp028 *s){Player *p=MC33_P(s);MCBody023 *b=&p->mob.entity.body;
 g33_attPrev=g33_att;if(g33_swinging){g33_swingT++;if(g33_swingT>=8){g33_swingT=0;g33_swinging=FALSE;}}else g33_swingT=0;g33_att=g33_swingT/8.0;
 ItemInstance *it=Inventory_getSelected(&p->inventory);I32 id=-1,aux=0;if(MC029_ValidItem(it)){id=ItemInstance_getId(it);aux=it->metadata;}
 g33_equipPrev=g33_equip;Bool same=id==g33_handId && aux==g33_handAux;F32 target=0;if(same)target=1;F32 d=target-g33_equip;if(d<-0.4)d=-0.4;if(d>0.4)d=0.4;g33_equip+=d;if(g33_equip<0.1){g33_handId=id;g33_handAux=aux;}
 if(!g33_inited){g33_inited=TRUE;g33_body=b->yaw;g33_bodyPrev=b->yaw;}
 g33_bodyPrev=g33_body;g33_walkSpeedPrev=g33_walkSpeed;F32 dx=b->x-b->prevX,dz=b->z-b->prevZ,dist=sqrt(dx*dx+dz*dz)*4;if(dist>1)dist=1;g33_walkSpeed+=(dist-g33_walkSpeed)*0.4;g33_walkPos+=g33_walkSpeed;g33_bob+=1;
 F32 tb=g33_body;if(dx*dx+dz*dz>0.0025)tb=atan2f(dz,dx)*180/MC33_PI-90;if(g33_att>0)tb=b->yaw;g33_body+=MC33_Wrap(tb-g33_body)*0.3;F32 f=MC33_Wrap(b->yaw-g33_body);if(f<-75)f=-75;if(f>75)f=75;g33_body=b->yaw-f;
 if(f*f>2500)g33_body+=f*0.2;
 // keep the interpolation continuous across the -180/180 seam
 while(g33_body-g33_bodyPrev<-180)g33_bodyPrev-=360;while(g33_body-g33_bodyPrev>=180)g33_bodyPrev+=360;}
// ---- armor (ArmorItem materials: cloth, chain, iron, diamond, gold) ----
I32 g33_def[20]={1,3,2,1, 2,5,4,1, 2,6,5,2, 3,8,6,3, 2,5,3,1};
Bool MC33_IsArmor(ItemInstance *it){if(!MC029_ValidItem(it))return FALSE;I32 id=ItemInstance_getId(it);return id>=298 && id<=317;}
I32 MC33_ArmorSlot(ItemInstance *it){return (ItemInstance_getId(it)-298)%4;}
I32 MC33_ArmorValue(Player *p){I32 v=0,i;for(i=0;i<4;i++)if(MC33_IsArmor(&p->armor[i]))v+=g33_def[ItemInstance_getId(&p->armor[i])-298];return v;}
I32 g33_absorbCarry;
// Player::hurtArmor: every piece loses max(dmg/4,1) durability; broken pieces are removed.
U0 MC33_HurtArmor(Player *p,I32 dmg){I32 n=dmg/4,i;if(n<1)n=1;for(i=0;i<4;i++){ItemInstance *a=&p->armor[i];if(!MC33_IsArmor(a))continue;a->metadata+=n;I32 mx=0;if(a->itemClass)mx=a->itemClass->maxDamage;if(mx>0 && a->metadata>mx){printf("ARMOR033 slot %d broke\n",i);if(g33_app)MC030_Play("random.break",p->mob.entity.body.x,p->mob.entity.body.y,p->mob.entity.body.z,0.8,0.8+Random_nextFloat(&g30_rng)*0.4);ItemInstance_setNull(a);}}}
// Player::hurt (difficulty scaling) -> Mob::hurt -> actuallyHurt -> getDamageAfterArmorAbsorb.
Bool MC033_Hurt(Player *p,Entity *attacker,I32 damage,Bool hostile){if(p->abilities.invulnerable || p->mob.entity.body.health<=0)return FALSE;
 if(hostile){I32 difficulty=p->mob.entity.level->world.difficulty;if(!difficulty)damage=0;else if(difficulty==1)damage=damage/3+1;else if(difficulty==3)damage=3*damage/2;}if(damage<=0)return FALSE;
 I32 armor=MC33_ArmorValue(p);if(armor>0 && p->mob.invulnerableTime<=10){I32 v=g33_absorbCarry+(25-armor)*damage;MC33_HurtArmor(p,damage);g33_absorbCarry=v%25;I32 after=v/25;printf("ARMOR033 armor=%d damage %d -> %d\n",armor,damage,after);damage=after;if(damage<=0){p->sleeping=FALSE;return FALSE;}}
 return Player_hurt(p,attacker,damage,FALSE);}
// ---- chests: ChestTileEntity::canPairWith + lid animation (tick) ----
class MC33Lid {MC32TE *t;F32 o,po;};
MC33Lid g33_lid[MC32_MAXTE];I32 g33_lidN;
MC32TE *g33_chestT,*g33_chestPair;I32 g33_chestDelay;
MC33Lid *MC33_Lid(MC32TE *t){I32 i;for(i=0;i<g33_lidN;i++)if(g33_lid[i].t==t)return &g33_lid[i];if(g33_lidN>=MC32_MAXTE)return NULL;MC33Lid *l=&g33_lid[g33_lidN++];l->t=t;l->o=0;l->po=0;return l;}
MC32TE *MC33_Pair(MCApp028 *s,I32 x,I32 y,I32 z,Bool create){Level *l=&s->level;I32 d=Level_getData(l,x,y,z),k,ox[4]={-1,1,0,0},oz[4]={0,0,-1,1};
 for(k=0;k<4;k++){I32 nx=x+ox[k],nz=z+oz[k];if(Level_getTile(l,nx,y,nz)!=54 || Level_getData(l,nx,y,nz)!=d)continue;if(nx==x){if(d!=4 && d!=5)continue;}else{if(d!=2 && d!=3)continue;}
  if(create)return MC32_Get(1,nx,y,nz);return MC32_Find(nx,y,nz);}return NULL;}
// ChestTile::use -> ChestTileEntity::openBy (screen opens after 6 ticks while the lid starts to rise)
Bool MC033_ChestUse(MCApp028 *s,I32 x,I32 y,I32 z){if(MC32_Solid(s,x,y+1,z))return TRUE;MC32TE *t=MC32_Get(1,x,y,z);if(!t)return TRUE;MC32TE *p=MC33_Pair(s,x,y,z,TRUE);
 if(p){if(MC32_Solid(s,p->x,p->y+1,p->z))return TRUE;}if(g33_chestDelay>0 || g32_openReq)return TRUE;g33_chestT=t;g33_chestPair=p;g33_chestDelay=6;return TRUE;}
Bool MC33_ChestOpen(MC32TE *t){if(!t)return FALSE;if(g33_chestDelay>0 && (t==g33_chestT || t==g33_chestPair))return TRUE;if(g29_screen==G32S_CHEST && (t==g32_open || t==g32_pair))return TRUE;return FALSE;}
U0 MC33_ChestTick(MCApp028 *s){I32 i;if(g33_chestDelay>0){g33_chestDelay--;if(!g33_chestDelay){if(Level_getTile(&s->level,g33_chestT->x,g33_chestT->y,g33_chestT->z)==54){g32_open=g33_chestT;g32_pair=g33_chestPair;g32_openReq=TRUE;}g33_chestT=NULL;g33_chestPair=NULL;}}
 I32 j=0;for(i=0;i<g33_lidN;i++){Bool live=FALSE;I32 k;for(k=0;k<g32_teN;k++)if(g32_te[k]==g33_lid[i].t)live=TRUE;if(live)g33_lid[j++]=g33_lid[i];}g33_lidN=j;
 for(i=0;i<g32_teN;i++){MC32TE *t=g32_te[i];if(t->kind!=1)continue;if(Level_getTile(&s->level,t->x,t->y,t->z)!=54)continue;MC33Lid *l=MC33_Lid(t);if(!l)continue;MC32TE *p=MC33_Pair(s,t->x,t->y,t->z,FALSE);
  Bool open=MC33_ChestOpen(t) || MC33_ChestOpen(p);Bool master=p==NULL || p->x>t->x || p->z>t->z;F32 sx=t->x+0.5,sz=t->z+0.5;if(p){sx=(t->x+p->x)*0.5+0.5;sz=(t->z+p->z)*0.5+0.5;}
  l->po=l->o;if(open && l->o==0 && master)MC030_Play("random.chestopen",sx,t->y+0.5,sz,0.5,Random_nextFloat(&g30_rng)*0.1+0.9);
  if(open){l->o+=0.1;if(l->o>1)l->o=1;}else if(l->o>0){F32 was=l->o;l->o-=0.1;if(l->o<0.5 && was>=0.5 && master)MC030_Play("random.chestclosed",sx,t->y+0.5,sz,0.5,Random_nextFloat(&g30_rng)*0.1+0.9);if(l->o<0)l->o=0;}}}
// ---- beds: BedTile::use / Player::startSleepInBed / stopSleepInBed ----
F32 g33_bedOX[4]={0.5,0.1,0.5,0.9},g33_bedOZ[4]={0.9,0.5,0.1,0.5};I32 g33_wake;
Bool MC033_Sleeping(MCApp028 *s){if(!s->worldReady)return FALSE;return MC33_P(s)->sleeping;}
U0 MC33_StandUp(MCApp028 *s){Player *p=MC33_P(s);Entity *e=&p->mob.entity;MCBody023 *b=&e->body;Entity_setPos(e,p->bedX+0.5,p->bedY+0.5625+1.62+0.01,p->bedZ+0.5);b->prevX=b->x;b->prevY=b->y;b->prevZ=b->z;b->motionX=0;b->motionY=0;b->motionZ=0;s->previousFall=0;}
U0 MC33_Wake(MCApp028 *s,Bool byTime){Player *p=MC33_P(s);if(!p->sleeping)return;p->sleeping=FALSE;if(byTime)p->sleepingCounter=100;else p->sleepingCounter=0;MC33_StandUp(s);if(g29_screen==G33S_BED)MC029_Go(G29S_NONE);printf("SLEEP033 wake byTime=%d time=%d\n",byTime,s->level.data.time);}
U0 MC033_LeaveBed(MCApp028 *s){MC33_Wake(s,FALSE);MC029_Go(G29S_NONE);}
Bool MC033_BedUse(MCApp028 *s,I32 x,I32 y,I32 z,I32 m){Level *l=&s->level;Player *p=MC33_P(s);I32 d=m&3,ox=0,oz=0;if(d==0)oz=1;if(d==1)ox=-1;if(d==2)oz=-1;if(d==3)ox=1;
 if(!(m&8)){x+=ox;z+=oz;if(Level_getTile(l,x,y,z)!=26)return TRUE;m=Level_getData(l,x,y,z);d=m&3;}
 if(p->sleeping)return TRUE;U8 msg[256];
 if(MC33_IsDay(s)){MC029_Get("tile.bed.noSleep",msg);MC029_Status(msg);printf("SLEEP033 refused: day (darken=%d)\n",MC33_SkyDarken(s));return TRUE;}
 MCBody023 *b=&p->mob.entity.body;F32 dx=b->x-x-0.5,dz=b->z-z-0.5;if(dx*dx+dz*dz>16)return TRUE;
 p->bedX=x;p->bedY=y;p->bedZ=z;p->sleeping=TRUE;p->sleepingCounter=0;s->level.data.xSpawn=x;s->level.data.ySpawn=y;s->level.data.zSpawn=z;p->spawnX=x;p->spawnY=y;p->spawnZ=z;p->hasRespawnPosition=TRUE;s->unsaved=TRUE;
 MC33_StandUp(s);MC029_Go(G33S_BED);printf("SLEEP033 start bed=%d,%d,%d dir=%d time=%d\n",x,y,z,d,s->level.data.time);return TRUE;}
U0 MC33_SleepTick(MCApp028 *s){Player *p=MC33_P(s);
 if(!p->sleeping){if(p->sleepingCounter>=100){p->sleepingCounter++;if(p->sleepingCounter>=110)p->sleepingCounter=0;}else p->sleepingCounter=0;if(g29_screen==G33S_BED)MC029_Go(G29S_NONE);return;}
 if(Level_getTile(&s->level,p->bedX,p->bedY,p->bedZ)!=26){MC33_Wake(s,FALSE);return;}
 MC33_StandUp(s);if(p->sleepingCounter<100)p->sleepingCounter++;
 if(p->sleepingCounter>=100){I32 t=s->level.data.time+19200;s->level.data.time=t-t%19200;s->unsaved=TRUE;MC33_Wake(s,TRUE);return;}
 if(MC33_IsDay(s))MC33_Wake(s,FALSE);}
// ---- per-tick hook (after MC032_Tick) ----
I32 g33_demo;Bool g33_demoRead;
U0 MC33_DemoTick(MCApp028 *s);U0 MC33_Demo();
U0 MC033_Tick(MCApp028 *s){g33_app=s;if(!g33_demoRead){g33_demoRead=TRUE;MC33_Demo();MC33_Ramp();}MC33_AnimTick(s);MC33_ChestTick(s);MC33_SleepTick(s);I32 d=MC33_SkyDarken(s);
 if(d!=g33_skyDarken){g33_skyDarken=d;I32 i,y;for(i=0;i<256;i++)if(s->meshes[i])for(y=0;y<8;y++)s->meshes[i]->section[y].dirty=TRUE;}
 if(g33_demo)MC33_DemoTick(s);}

// ---- sky / fog / clear colour (GameRenderer::setupClearColor, Dimension::getFogColor, Level::getSunriseColor) ----
I32 g33_bioX=-99999,g33_bioZ=-99999;F32 g33_bio[3]={0.48,0.65,1};
U0 MC33_SkyColor(MCApp028 *s,F32 pt,F32 *c){Player *pp=MC33_P(s);MCBody023 *b=&pp->mob.entity.body;I32 x=floorf(b->x),z=floorf(b->z);
 if(x!=g33_bioX || z!=g33_bioZ){g33_bioX=x;g33_bioZ=z;Biome *bio=BiomeSource_getBiome(&s->biome,x,z);if(bio){Color4 col;Biome_getSkyColor(bio,Biome_getTemperature(bio),&col);g33_bio[0]=col.r;g33_bio[1]=col.g;g33_bio[2]=col.b;}}
 F32 v=MC33_Clamp(MC33_Cos2(s,pt)*2+0.5,0,1);c[0]=g33_bio[0]*v;c[1]=g33_bio[1]*v;c[2]=g33_bio[2]*v;}
U0 MC33_Fog(MCApp028 *s,F32 pt,F32 *c){F32 sky[3];MC33_SkyColor(s,pt,sky);F32 v=MC33_Clamp(MC33_Cos2(s,pt)*2+0.5,0,1)*0.94+0.06,f[3];f[0]=0.50196*v;f[1]=0.8549*v;f[2]=v;
 I32 vd=g29_opt.viewDistance;if(vd<0)vd=0;if(vd>3)vd=3;F32 k=1-pow(1.0/(4-vd),0.25);I32 i;for(i=0;i<3;i++)c[i]=f[i]+(sky[i]-f[i])*k;
 F32 tod=MC033_Tod(s,pt),cs=cos(tod*MC33_PI*2);if(cs>=-0.4 && cs<=0.4){F32 v5=cs/0.4*0.5+0.5,a=1-(1-sin(v5*MC33_PI))*0.99;a=a*a;F32 sr[3];sr[0]=v5*0.3+0.7;sr[1]=v5*v5*0.7+0.2;sr[2]=0.2;
  Player *p=MC33_P(s);MCBody023 *b=&p->mob.entity.body;F32 yaw=b->yaw*MC33_PI/180,pitch=b->pitch*MC33_PI/180,lx=-sin(yaw)*cos(pitch),ly=-sin(pitch),lz=cos(yaw)*cos(pitch),sa=tod*MC33_PI*2;
  F32 in=((lx*0.25+ly*cos(sa)+lz*sin(sa))+1)*0.5;in=MC33_Clamp(in,0,1);a*=in;for(i=0;i<3;i++)c[i]+=(sr[i]-c[i])*a;}
 Player *pq=MC33_P(s);MCBody023 *bb=&pq->mob.entity.body;I32 eyes=Level_getTile(&s->level,floorf(bb->x),floorf(bb->y),floorf(bb->z));if(eyes==8 || eyes==9){c[0]=0.02;c[1]=0.02;c[2]=0.2;}if(eyes==10 || eyes==11){c[0]=0.6;c[1]=0.1;c[2]=0;}}
U0 MC033_ClearColor(MCApp028 *s,F32 pt){F32 c[3];MC33_Fog(s,pt,c);hcgl028_glClearColor(c[0],c[1],c[2],1);}
U0 MC033_FogColor(MCApp028 *s,F32 pt,F32 *fog){MC33_Fog(s,pt,fog);fog[3]=1;}
// ---- sky dome, sun, moon, stars (LevelRenderer::renderSky) ----
U32 g33_sunTex,g33_moonTex,g33_cloudTex,g33_starList,g33_cloudList;Bool g33_skyTried;U8 *g33_cloudPix;I32 g33_cloudW,g33_cloudH,g33_cloudCX=-99999,g33_cloudCZ=-99999;F32 g33_cloudCol[3];
U32 g33_rs=10842;
F32 MC33_Rand(){g33_rs=g33_rs*1103515245+12345;return ((g33_rs>>8)&0xFFFF)/65536.0;}
U0 MC33_BuildStars(){g33_starList=hcgl028_glGenLists(1);hcgl028_glNewList(g33_starList,0x1300);hcgl028_glBegin(7);I32 i;
 for(i=0;i<1500;i++){F32 x=MC33_Rand()*2-1,y=MC33_Rand()*2-1,z=MC33_Rand()*2-1,sz=0.15+MC33_Rand()*0.1,d=x*x+y*y+z*z,rot=MC33_Rand()*MC33_PI*2;if(d>=1 || d<=0.01)continue;d=1/sqrt(d);x*=d;y*=d;z*=d;
  // tangent basis around the star direction, rotated by a random angle
  F32 ax=0,ay=1,az=0;if(y*y>0.8){ax=1;ay=0;}F32 ux=ay*z-az*y,uy=az*x-ax*z,uz=ax*y-ay*x,ul=sqrt(ux*ux+uy*uy+uz*uz);ux/=ul;uy/=ul;uz/=ul;F32 vx=y*uz-z*uy,vy=z*ux-x*uz,vz=x*uy-y*ux;
  F32 cr=cos(rot),sr=sin(rot),px=(ux*cr+vx*sr)*sz,py=(uy*cr+vy*sr)*sz,pz=(uz*cr+vz*sr)*sz,qx=(vx*cr-ux*sr)*sz,qy=(vy*cr-uy*sr)*sz,qz=(vz*cr-uz*sr)*sz,cx=x*100,cy=y*100,cz=z*100;
  hcgl028_glVertex3f(cx-px-qx,cy-py-qy,cz-pz-qz);hcgl028_glVertex3f(cx+px-qx,cy+py-qy,cz+pz-qz);hcgl028_glVertex3f(cx+px+qx,cy+py+qy,cz+pz+qz);hcgl028_glVertex3f(cx-px+qx,cy-py+qy,cz-pz+qz);}
 hcgl028_glEnd();hcgl028_glEndList();}
U0 MC33_SkyTex(){if(g33_skyTried)return;g33_skyTried=TRUE;MC33_Ramp();g33_sunTex=MC028_Texture("assets/033/environment/sun.png",NULL,NULL);g33_moonTex=MC028_Texture("assets/033/environment/moon_phases.png",NULL,NULL);
 I32 n;g33_cloudPix=stbi_load("assets/033/environment/clouds.png",&g33_cloudW,&g33_cloudH,&n,4);MC33_BuildStars();}
U0 MC33_RotOnly(MCApp028 *s){F32 m[16];I32 i;for(i=0;i<16;i++)m[i]=s->camera.modelViewMat[i];m[12]=0;m[13]=0;m[14]=0;hcgl028_glMatrixMode(0x1700);hcgl028_glLoadMatrixf(m);}
U0 MC33_Quad(F32 r,F32 y,F32 u0,F32 v0,F32 u1,F32 v1){hcgl028_glBegin(7);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(-r,y,-r);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(r,y,-r);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(r,y,r);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(-r,y,r);hcgl028_glEnd();}
U0 MC033_Sky(MCApp028 *s,F32 pt){if(!g29_opt.fancySkies)return;MC33_SkyTex();F32 sky[3];MC33_SkyColor(s,pt,sky);MC33_RotOnly(s);hcgl028_glDepthMask(0);hcgl028_glDisable(0xDE1);hcgl028_glDisable(0xBC0);
 // skyMesh: a 16-high plane fogged toward the horizon
 hcgl028_glColor4f(sky[0],sky[1],sky[2],1);I32 i,j;hcgl028_glBegin(7);for(i=-384;i<384;i+=64)for(j=-384;j<384;j+=64){hcgl028_glVertex3f(i,16,j);hcgl028_glVertex3f(i+64,16,j);hcgl028_glVertex3f(i+64,16,j+64);hcgl028_glVertex3f(i,16,j+64);}hcgl028_glEnd();
 // dark plane below the horizon (Java renderSky "sky2")
 hcgl028_glColor4f(sky[0]*0.2+0.04,sky[1]*0.2+0.04,sky[2]*0.6+0.1,1);hcgl028_glBegin(7);for(i=-384;i<384;i+=64)for(j=-384;j<384;j+=64){hcgl028_glVertex3f(i,-16,j+64);hcgl028_glVertex3f(i+64,-16,j+64);hcgl028_glVertex3f(i+64,-16,j);hcgl028_glVertex3f(i,-16,j);}hcgl028_glEnd();
 hcgl028_glDisable(0xB60);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(1,1);F32 tod=MC033_Tod(s,pt);hcgl028_glPushMatrix();hcgl028_glRotatef(tod*360,1,0,0);
 F32 star=MC33_Clamp(1-(MC33_Cos2(s,pt)*2+0.75),0,1);star=star*star*0.5;if(star>0 && g33_starList){hcgl028_glColor4f(star,star,star,star);hcgl028_glCallList(g33_starList);}
 hcgl028_glEnable(0xDE1);hcgl028_glColor4f(1,1,1,1);if(g33_sunTex){hcgl028_glBindTexture(0xDE1,g33_sunTex);MC33_Quad(30,100,0,0,1,1);}
 if(g33_moonTex){I32 ph=(s->level.data.time/19200)%8;if(ph<0)ph+=8;F32 u0=(ph%4)/4.0,v0=(ph/4)/2.0;hcgl028_glBindTexture(0xDE1,g33_moonTex);MC33_Quad(20,-100,u0+0.25,v0+0.5,u0,v0);}
 hcgl028_glPopMatrix();hcgl028_glBlendFunc(0x302,0x303);hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xB60);hcgl028_glEnable(0xBC0);hcgl028_glDepthMask(1);hcgl028_glColor4f(1,1,1,1);
 hcgl028_glLoadMatrixf(s->camera.modelViewMat);hcgl028_glBindTexture(0xDE1,s->terrainTex);}
// ---- clouds (LevelRenderer::renderClouds + TextureTesselator: one 16x7x16 box per opaque clouds.png texel) ----
Bool MC33_Cloud(I32 x,I32 z){if(!g33_cloudPix)return FALSE;x&=255;z&=255;if(x>=g33_cloudW || z>=g33_cloudH)return FALSE;return g33_cloudPix[(z*g33_cloudW+x)*4+3]>127;}
U0 MC33_CV(F32 x,F32 y,F32 z){hcgl028_glVertex3f(x,y,z);}
U0 MC33_BuildClouds(I32 cx,I32 cz,F32 *c){if(!g33_cloudList)g33_cloudList=hcgl028_glGenLists(1);hcgl028_glNewList(g33_cloudList,0x1300);hcgl028_glBegin(7);I32 i,j;F32 a=0.7;
 for(i=0;i<64;i++)for(j=0;j<64;j++){I32 wx=cx-32+i,wz=cz-32+j;if(!MC33_Cloud(wx,wz))continue;F32 x0=i,x1=i+1,z0=j,z1=j+1;
  hcgl028_glColor4f(c[0]*0.88,c[1]*0.88,c[2]*0.88,a);MC33_CV(x0,1,z0);MC33_CV(x0,1,z1);MC33_CV(x1,1,z1);MC33_CV(x1,1,z0);
  hcgl028_glColor4f(c[0]*0.6,c[1]*0.6,c[2]*0.6,a);MC33_CV(x0,0,z0);MC33_CV(x1,0,z0);MC33_CV(x1,0,z1);MC33_CV(x0,0,z1);
  if(!MC33_Cloud(wx,wz-1)){hcgl028_glColor4f(c[0]*0.6,c[1]*0.6,c[2]*0.6,a);MC33_CV(x0,0,z0);MC33_CV(x0,1,z0);MC33_CV(x1,1,z0);MC33_CV(x1,0,z0);}
  if(!MC33_Cloud(wx,wz+1)){hcgl028_glColor4f(c[0]*0.88,c[1]*0.88,c[2]*0.88,a);MC33_CV(x0,0,z1);MC33_CV(x1,0,z1);MC33_CV(x1,1,z1);MC33_CV(x0,1,z1);}
  if(!MC33_Cloud(wx-1,wz)){hcgl028_glColor4f(c[0]*0.6,c[1]*0.6,c[2]*0.6,a);MC33_CV(x0,0,z0);MC33_CV(x0,0,z1);MC33_CV(x0,1,z1);MC33_CV(x0,1,z0);}
  if(!MC33_Cloud(wx+1,wz)){hcgl028_glColor4f(c[0]*0.6,c[1]*0.6,c[2]*0.6,a);MC33_CV(x1,0,z0);MC33_CV(x1,1,z0);MC33_CV(x1,1,z1);MC33_CV(x1,0,z1);}}
 hcgl028_glEnd();hcgl028_glEndList();}
U0 MC033_Clouds(MCApp028 *s,F32 pt){if(!g29_opt.fancySkies)return;MC33_SkyTex();if(!g33_cloudPix)return;Player *pp=MC33_P(s);MCBody023 *b=&pp->mob.entity.body;
 F32 cy=b->prevY+(b->y-b->prevY)*pt,camX=b->prevX+(b->x-b->prevX)*pt,camZ=b->prevZ+(b->z-b->prevZ)*pt,h=128-cy+0.33;
 F32 fx=(camX+(s->ticks+pt)*0.03)*0.0625,fz=camZ*0.0625;I32 ix=floorf(fx),iz=floorf(fz);fx-=ix;fz-=iz;
 F32 v6=MC33_Clamp(MC33_Cos2(s,pt)*2+0.5,0,1),c[3];c[0]=v6*0.9+0.1;c[1]=c[0];c[2]=v6*0.85+0.15;
 if(ix!=g33_cloudCX || iz!=g33_cloudCZ || !g33_cloudList || fabs(c[0]-g33_cloudCol[0])+fabs(c[1]-g33_cloudCol[1])+fabs(c[2]-g33_cloudCol[2])>0.06){g33_cloudCX=ix;g33_cloudCZ=iz;g33_cloudCol[0]=c[0];g33_cloudCol[1]=c[1];g33_cloudCol[2]=c[2];MC33_BuildClouds(ix,iz,c);}
 MC33_RotOnly(s);hcgl028_glDisable(0xDE1);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glFogf(0xB63,0);hcgl028_glFogf(0xB64,sqrt(h*h+262140.0));
 hcgl028_glPushMatrix();hcgl028_glTranslatef(-fx*16,h,-fz*16);hcgl028_glScalef(16,7,16);hcgl028_glTranslatef(-32,0,-32);hcgl028_glCallList(g33_cloudList);hcgl028_glPopMatrix();
 hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xDE1);hcgl028_glColor4f(1,1,1,1);F32 far=g29_fogFar,start=g29_fogFar*0.7;if(b->inWater){far=14;start=2;}hcgl028_glFogf(0xB63,start);hcgl028_glFogf(0xB64,far);
 hcgl028_glLoadMatrixf(s->camera.modelViewMat);hcgl028_glBindTexture(0xDE1,s->terrainTex);}
// ---- in-bed fade (Gui::render: sleep overlay) ----
U0 MC033_Overlay(MCApp028 *s){if(!s->worldReady)return;I32 c=MC33_P(s)->sleepingCounter;if(c<=0)return;F32 a=c/100.0;if(c>100)a=1-(c-100)/10.0;if(a<0)a=0;if(a>1)a=1;I32 al=a*220;U32 col=(al(U32)<<24)|0x101020;MC029_Fill(0,0,g29_gw,g29_gh,col);MC029_White();}
