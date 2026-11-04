// Batch034 hostile mobs: Monster (findAttackTarget / checkHurtTarget / isDarkEnoughToSpawn / despawn), Zombie (32),
// Creeper (33, swell + explode 2.4), Skeleton (34, bow + Arrow), Spider (35, climb, leap, light-dependent hostility),
// PigZombie (36, neutral until hurt, alerts the group), sun burning, MobSpawner monster category, Arrow entity,
// ZombieModel / SkeletonModel / SpiderModel (+eyes) / CreeperModel (+swell flash) and the flame overlay.
U32 g34_mobTex[5],g34_eyesTex,g34_arrowTex;Bool g34_mobTexTried;I32 g34_spawned,g34_killed,g34_shots,g34_hits,g34_booms;
Bool MC34_KindOk(I32 k){return (k>=10 && k<=13) || (k>=32 && k<=36);}
Bool MC34_Hostile(I32 k){return k>=32 && k<=36;}
U0 MC34_Size(I32 k,F32 *w,F32 *h,I32 *hp,F32 *sp){*w=0.6;*h=1.8;*hp=12;*sp=0.23;if(k==33){*hp=16;*h=1.7;*sp=0.25;}if(k==34){*hp=10;*sp=0.25;}if(k==35){*w=1.4;*h=0.9;*hp=8;*sp=0.3;}}
I32 MC34_Passive(){I32 i,n=0;for(i=0;i<g31_mobN;i++)if(!g31_mobs[i]->removed && g31_mobs[i]->kind<32)n++;return n;}
I32 MC34_Monsters(){I32 i,n=0;for(i=0;i<g31_mobN;i++)if(!g31_mobs[i]->removed && g31_mobs[i]->kind>=32)n++;return n;}
F32 MC34_Flip(MC31Mob *m){if(m->kind==35)return 180;return 90;}
U0 MC34_Sound(MC31Mob *m,I32 which){U8 *n=NULL;I32 k=m->kind;
 if(k==32){if(which==0)n="mob.zombie";else if(which==1)n="mob.zombiehurt";else n="mob.zombiedeath";}
 if(k==34){if(which==0)n="mob.skeleton";else n="mob.skeletonhurt";}
 if(k==35){if(which==2)n="mob.spiderdeath";else n="mob.spider";}
 if(k==33){if(which==0)return;if(which==1)n="mob.creeper";else n="mob.creeperdeath";}
 if(k==36){if(which==0){if(m->anger>0)n="mob.zombiepig.zpigangry";else n="mob.zombiepig.zpig";}else if(which==1)n="mob.zombiepig.zpighurt";else n="mob.zombiepig.zpigdeath";}
 if(n)MC030_Play(n,m->e.body.x,m->e.body.y,m->e.body.z,1.0,MC31_SoundPitch(m));}
U0 MC34_Die(MC31Mob *m){MCBody023 *b=&m->e.body;I32 k=m->kind,n;g34_killed++;
 if(k==32){n=MC31_RandI(3);MC31_Drop(288,0,n,b->x,b->y,b->z,0,0,0,FALSE);if(MC31_RandI(40)==0)MC31_Drop(391,0,1,b->x,b->y,b->z,0,0,0,FALSE);if(MC31_RandI(40)==0)MC31_Drop(392,0,1,b->x,b->y,b->z,0,0,0,FALSE);}
 if(k==33){n=MC31_RandI(3);MC31_Drop(289,0,n,b->x,b->y,b->z,0,0,0,FALSE);}
 if(k==34){n=MC31_RandI(3);MC31_Drop(262,0,n,b->x,b->y,b->z,0,0,0,FALSE);n=MC31_RandI(3);MC31_Drop(352,0,n,b->x,b->y,b->z,0,0,0,FALSE);}
 if(k==35){n=MC31_RandI(3);MC31_Drop(287,0,n,b->x,b->y,b->z,0,0,0,FALSE);}
 if(k==36){n=MC31_RandI(2);MC31_Drop(266,0,n,b->x,b->y,b->z,0,0,0,FALSE);}
 printf("MOB034 died kind=%d\n",k);}
U0 MC34_Anger(MC31Mob *m){Bool was=m->anger>0;m->anger=400+MC31_RandI(400);m->target=TRUE;if(!was)MC030_Play("mob.zombiepig.zpigangry",m->e.body.x,m->e.body.y,m->e.body.z,1.0,MC31_SoundPitch(m)*1.8);}
U0 MC34_Provoked(MC31Mob *m){I32 i;m->target=TRUE;if(m->kind!=36)return;MC34_Anger(m);
 for(i=0;i<g31_mobN;i++){MC31Mob *o=g31_mobs[i];if(o==m || o->removed || o->kind!=36)continue;if(MC31_Dist2(o,m->e.body.x,m->e.body.y,m->e.body.z)<32*32)MC34_Anger(o);}}
// Level::canSeeSky: nothing light-blocking above the block
Bool MC34_SeeSky(I32 x,I32 y,I32 z){I32 yy;if(y<0)return FALSE;for(yy=y+1;yy<128;yy++){I32 id=MC31_Tile(x,yy,z);if(id>0 && g31_app->catalog.registry.tiles[id].opacity>0)return FALSE;}return TRUE;}
// Mob::canSee: ray from eye to eye, blocked by solid cubes
Bool MC34_CanSee(MC31Mob *m){Player *p=MC31_Player();if(!p)return FALSE;MCBody023 *b=&m->e.body,*pb=&p->mob.entity.body;F32 x=b->x,y=b->y+MC31_Eye(m),z=b->z,dx=pb->x-x,dy=pb->y-y,dz=pb->z-z,d=sqrt(dx*dx+dy*dy+dz*dz);I32 n=d/0.25,i;if(n>200)return FALSE;
 for(i=1;i<n;i++){F32 t=i/(n(F32));I32 id=MC31_Tile(floorf(x+dx*t),floorf(y+dy*t),floorf(z+dz*t));if(MC31_Cube(id))return FALSE;}return TRUE;}
I32 MC34_SkyLight(I32 x,I32 y,I32 z){if(y<0)return 0;if(y>127)return 15;LevelChunk *c=Level_getChunk(&g31_app->level,x>>4,z>>4,FALSE);if(!c)return 15;return DataLayer_get(&c->skyLight,x&15,y,z&15);}
I32 MC34_RawDark(I32 x,I32 y,I32 z){if(y<0)return 0;if(y>127)return 15;LevelChunk *c=Level_getChunk(&g31_app->level,x>>4,z>>4,FALSE);if(!c)return 15;return LevelChunk_getRawBrightness(c,x&15,y,z&15,g33_skyDarken);}
Bool MC34_DarkEnough(I32 x,I32 y,I32 z){if(MC34_SkyLight(x,y,z)>MC31_RandI(32))return FALSE;return MC34_RawDark(x,y,z)<=MC31_RandI(8);}
// ---- Arrow ----
U0 MC34_Shoot(MC31Mob *m){Player *p=MC31_Player();if(!p || g34_arrowN>=MC34_MAXARROW)return;MCBody023 *b=&m->e.body,*pb=&p->mob.entity.body;MC34Arrow *a=&g34_arrow[g34_arrowN++];memset(a,0,sizeof(MC34Arrow));
 F32 yr=m->headYaw*MC31_PI/180;a->x=b->x-cos(yr)*0.16;a->y=b->y+MC31_Eye(m)-0.1;a->z=b->z-sin(yr)*0.16;a->px=a->x;a->py=a->y;a->pz=a->z;
 F32 dx=pb->x-b->x,dz=pb->z-b->z,dy=pb->y-0.7-a->y,dist=sqrt(dx*dx+dz*dz);dy+=dist*0.2;F32 l=sqrt(dx*dx+dy*dy+dz*dz);if(l<0.0001)l=1;
 dx=dx/l+MC31_Gauss()*0.0075*32;dy=dy/l+MC31_Gauss()*0.0075*32;dz=dz/l+MC31_Gauss()*0.0075*32;a->mx=dx*1.6;a->my=dy*1.6;a->mz=dz*1.6;
 F32 hd=sqrt(a->mx*a->mx+a->mz*a->mz);a->yaw=atan2f(a->mx,a->mz)*180/MC31_PI;a->pitch=atan2f(a->my,hd)*180/MC31_PI;a->pyaw=a->yaw;a->ppitch=a->pitch;
 MC030_Play("random.bow",b->x,b->y,b->z,1.0,1/(MC31_Rand()*0.4+0.8));g34_shots++;}
U0 MC34_ArrowTick(MCApp028 *s,MC34Arrow *a){a->px=a->x;a->py=a->y;a->pz=a->z;a->pyaw=a->yaw;a->ppitch=a->pitch;if(a->shake>0)a->shake--;
 if(a->inGround){if(Level_getTile(&s->level,a->gx,a->gy,a->gz)!=a->gt){a->inGround=FALSE;a->mx*=MC31_Rand()*0.2;a->my*=MC31_Rand()*0.2;a->mz*=MC31_Rand()*0.2;a->life=0;}else{a->life++;if(a->life>=1200)a->removed=TRUE;return;}}
 a->life++;if(a->life>1200){a->removed=TRUE;return;}
 F32 sp=sqrt(a->mx*a->mx+a->my*a->my+a->mz*a->mz);I32 steps=sp/0.1+1,i;Bool hitBlock=FALSE;F32 t=1;
 for(i=1;i<=steps;i++){F32 f=i/(steps(F32));I32 bx=floorf(a->x+a->mx*f),by=floorf(a->y+a->my*f),bz=floorf(a->z+a->mz*f),id=MC31_Tile(bx,by,bz);if(id>0 && !(id>=8 && id<=11) && (MC31_Solid(id) || MC31_Cube(id))){hitBlock=TRUE;t=f;a->gx=bx;a->gy=by;a->gz=bz;a->gt=id;break;}}
 Player *p=MC31_Player();
 if(a->fromPlayer && MC035_ArrowMobs(s,a,sp,t))return;
 if(!a->fromPlayer && p && p->mob.entity.body.health>0){AABB *pa=&p->mob.entity.box;Vec3 o;Vec3_Init(&o,a->x,a->y,a->z);F32 h=MC31_Slab(&o,a->mx,a->my,a->mz,pa->minX-0.3,pa->minY-0.3,pa->minZ-0.3,pa->maxX+0.3,pa->maxY+0.3,pa->maxZ+0.3);
  if(h>=0 && h<=t){I32 dmg=ceilf(sp*2);Entity tmp;memset(&tmp,0,sizeof(Entity));tmp.body.x=a->x;tmp.body.z=a->z;Bool ok=FALSE;if(!s->creative)ok=MC033_Hurt(p,&tmp,dmg,TRUE);MC030_Play("random.bowhit",a->x,a->y,a->z,1.0,1.2/(MC31_Rand()*0.2+0.9));printf("ARROW034 hit player dmg=%d ok=%d hp=%d\n",dmg,ok,p->mob.entity.body.health);g34_hits++;a->removed=TRUE;return;}}
 if(hitBlock){a->x+=a->mx*t;a->y+=a->my*t;a->z+=a->mz*t;F32 l=sp;if(l<0.0001)l=1;a->x-=a->mx/l*0.05;a->y-=a->my/l*0.05;a->z-=a->mz/l*0.05;a->inGround=TRUE;a->shake=7;a->life=0;MC030_Play("random.bowhit",a->x,a->y,a->z,1.0,1.2/(MC31_Rand()*0.2+0.9));return;}
 a->x+=a->mx;a->y+=a->my;a->z+=a->mz;F32 hd=sqrt(a->mx*a->mx+a->mz*a->mz);a->yaw=atan2f(a->mx,a->mz)*180/MC31_PI;a->pitch=atan2f(a->my,hd)*180/MC31_PI;
 while(a->pitch-a->ppitch<-180)a->ppitch-=360;while(a->pitch-a->ppitch>=180)a->ppitch+=360;while(a->yaw-a->pyaw<-180)a->pyaw-=360;while(a->yaw-a->pyaw>=180)a->pyaw+=360;
 F32 drag=0.99;if(MC31_Water(MC31_Tile(floorf(a->x),floorf(a->y),floorf(a->z))))drag=0.8;a->mx*=drag;a->my*=drag;a->mz*=drag;a->my-=0.05;
 if(a->y<-64)a->removed=TRUE;}
U0 MC34_Arrows(MCApp028 *s){I32 i,j=0;for(i=0;i<g34_arrowN;i++){MC34_ArrowTick(s,&g34_arrow[i]);if(!g34_arrow[i].removed){if(j!=i)g34_arrow[j]=g34_arrow[i];j++;}}g34_arrowN=j;}
// ---- PathfinderMob::updateAi + Monster::checkHurtTarget (old AI: Zombie/Skeleton/Spider/Creeper/PigZombie use useNewAi()==0) ----
U0 MC34_Stroll(MC31Mob *m){MCBody023 *b=&m->e.body;F32 best=-99999;I32 fx=floorf(b->x),fy=floorf(b->y),fz=floorf(b->z),i,bx=0,by=0,bz=0;Bool found=FALSE;
 for(i=0;i<10;i++){I32 x=fx+MC31_RandI(13)-6,y=fy+MC31_RandI(7)-3,z=fz+MC31_RandI(13)-6;if(x<0 || z<0 || x>255 || z>255 || y<1 || y>126)continue;F32 v=0.5-MC31_Bright(x,y,z);if(v>best){best=v;bx=x;by=y;bz=z;found=TRUE;}}
 if(found)MC31_MoveTo(m,bx+0.5,by,bz+0.5,1.0);}
U0 MC34_Explode(MC31Mob *m){MCBody023 *b=&m->e.body;F32 x=b->x,y=b->y,z=b->z;m->removed=TRUE;b->health=0;g34_booms++;printf("CREEPER034 explode at=%.1f,%.1f,%.1f\n",x,y,z);MC32_Explode(g31_app,x,y,z,2.4);}
U0 MC34_CheckHurt(MC31Mob *m,F32 d){I32 k=m->kind;Player *p=MC31_Player();MCBody023 *b=&m->e.body,*pb=&p->mob.entity.body;AABB *pa=&p->mob.entity.box;
 if(k==33){if((m->swellDir<=0 && d<3) || (m->swellDir>0 && d<7)){if(m->swell==0)MC030_Play("random.fuse",b->x,b->y,b->z,1.0,0.5);m->swellDir=1;}else m->swellDir=-1;if(m->swell>=30)MC34_Explode(m);return;}
 if(k==34){if(d<10){if(m->attackTime==0){MC34_Shoot(m);m->attackTime=60;}F32 dx=pb->x-b->x,dz=pb->z-b->z;b->yaw=atan2f(dz,dx)*180/MC31_PI-90;m->hold=TRUE;}return;}
 if(k==35){F32 br=MC31_Bright(floorf(b->x),floorf(b->y),floorf(b->z));if(br>0.5 && MC31_RandI(100)==0){m->target=FALSE;return;}
  if(d>2 && d<6 && MC31_RandI(10)==0){if(b->onGround){F32 dx=pb->x-b->x,dz=pb->z-b->z,dd=sqrt(dx*dx+dz*dz);if(dd<0.01)dd=0.01;b->motionX=dx/dd*0.5*0.8+b->motionX*0.2;b->motionZ=dz/dd*0.5*0.8+b->motionZ*0.2;b->motionY=0.4;}return;}}
 if(m->attackTime<=0 && d<2 && pa->maxY>m->e.box.minY && pa->minY<m->e.box.maxY){m->attackTime=20;I32 dmg=2;if(k==32)dmg=4;if(k==36)dmg=5;Bool ok=MC033_Hurt(p,&m->e,dmg,TRUE);m->swing=8;printf("MOB034 kind=%d hits player dmg=%d ok=%d hp=%d\n",k,dmg,ok,pb->health);}}
U0 MC34_Ai(MC31Mob *m){MCBody023 *b=&m->e.body;Player *p=MC31_Player();I32 k=m->kind;MCApp028 *s=g31_app;if(m->attackTime>0)m->attackTime--;if(m->swing>0)m->swing--;
 F32 br=MC31_Bright(floorf(b->x),floorf(b->y+b->height*0.66),floorf(b->z));if(br>0.5)m->noAction+=2;
 Bool valid=p!=NULL && p->mob.entity.body.health>0 && !s->creative && s->level.world.difficulty>0;F32 px=0,py=0,pz=0,d=1000;
 if(p){px=p->mob.entity.body.x;py=p->mob.entity.box.minY;pz=p->mob.entity.body.z;d=sqrt(MC31_PlayerDist2(m));}
 if(k==36 && m->anger>0)m->anger--;
 if(m->target && (!valid || d>32 || (k==36 && m->anger<=0)))m->target=FALSE;
 if(!m->target && valid){Bool want=TRUE;if(k==36)want=FALSE;if(k==35 && br>=0.5)want=FALSE;if(want && d<16 && MC34_CanSee(m))m->target=TRUE;}
 m->hold=FALSE;Bool see=FALSE;
 if(m->target){see=MC34_CanSee(m);if(see)MC34_CheckHurt(m,d);else if(k==33)m->swellDir=-1;}else if(k==33)m->swellDir=-1;
 if(m->removed)return;
 F32 sp=1.0;if(k==36 && m->anger>0)sp=1.8;
 if(m->hold)MC31_NavStop(m);
 else if(m->target && (MC31_NavDone(m) || MC31_RandI(20)==0))MC31_MoveTo(m,px,py,pz,sp);
 else if(!m->target && ((MC31_NavDone(m) && MC31_RandI(180)==0) || MC31_RandI(120)==0) && m->noAction<100)MC34_Stroll(m);
 if(m->target && see && d<3 && !m->hold)MC31_SetWanted(m,px,py,pz,sp);
 if(m->target)MC31_LookAtPlayer(m,30,30);else if(MC31_Rand()<0.02 && d<8)MC31_LookAtPlayer(m,10,40);
 if(b->inWater || b->inLava){if(MC31_Rand()<0.8)m->jumpFlag=TRUE;}}
U0 MC34_PostTick(MC31Mob *m){MCBody023 *b=&m->e.body;I32 k=m->kind;MCApp028 *s=g31_app;if(m->removed)return;
 if(s->level.world.difficulty==0){m->removed=TRUE;printf("MOB034 peaceful removes kind=%d\n",k);return;}
 F32 d2=MC31_PlayerDist2(m);if(d2>128*128 || (m->noAction>600 && MC31_RandI(800)==0 && d2>1024)){m->removed=TRUE;return;}
 if(k==33){m->oldSwell=m->swell;m->swell+=m->swellDir;if(m->swell<0)m->swell=0;if(m->swell>30)m->swell=30;}
 if(k==35 && m->e.horizontalCollision){b->motionY=0.2;m->e.fallDistance=0;}
 m->sunTick++;if((k==32 || k==34) && (m->sunTick&1) && g33_skyDarken<4 && m->age>=0 && b->health>0 && m->e.fire<=0){I32 x=floorf(b->x),y=floorf(b->y),z=floorf(b->z);if(MC31_Bright(x,y+1,z)>0.5 && MC34_SeeSky(x,y,z) && !b->inWater){m->e.fire=160;printf("MOB034 burns in daylight kind=%d\n",k);}}}
// ---- MobSpawner (monster category, cap 8): random positions 24..48 blocks from the player in loaded chunks ----
I32 g34_spawnW[4]={8,12,6,4},g34_spawnK[4]={35,32,34,33},g34_spawnMin[4]={2,2,1,1},g34_spawnMax[4]={3,4,3,1};
Bool MC34_TrySpawn(MCApp028 *s,I32 kind,I32 x,I32 y,I32 z){if(!MC31_SpawnOk(x,y,z))return FALSE;Player *p=MC31_Player();MCBody023 *pb=&p->mob.entity.body;F32 fx=x+0.5,fz=z+0.5,dx=fx-pb->x,dy=y-p->mob.entity.box.minY,dz=fz-pb->z;if(dx*dx+dy*dy+dz*dz<576)return FALSE;
 dx=fx-s->level.data.xSpawn;dy=y-s->level.data.ySpawn;dz=fz-s->level.data.zSpawn;if(dx*dx+dy*dy+dz*dz<576)return FALSE;if(!MC34_DarkEnough(x,y,z))return FALSE;
 if(kind==35 && (!MC31_SpawnOk(x+1,y,z) || !MC31_SpawnOk(x,y,z+1)))return FALSE;
 MC31Mob *m=MC31_New(kind,fx,y,fz,MC31_Rand()*360);if(!m)return FALSE;MCVector cubes;Level_getCubes(&s->level,&m->e.box,&cubes);Bool clear=cubes.size==0;MCVector_Destroy(&cubes);
 if(!clear || MC31_InLiquid(&m->e.box,FALSE) || MC31_InLiquid(&m->e.box,TRUE)){g31_mobN--;free(m);return FALSE;}g34_spawned++;printf("SPAWN034 kind=%d at=%d,%d,%d\n",kind,x,y,z);return TRUE;}
U0 MC34_Spawn(MCApp028 *s){if(s->level.world.difficulty==0 || (s->ticks%5)!=0)return;if(MC34_Monsters()>=8)return;Player *p=MC31_Player();if(!p)return;MCBody023 *pb=&p->mob.entity.body;I32 tries,i;
 for(tries=0;tries<2;tries++){I32 x=floorf(pb->x)+MC31_RandI(97)-48,z=floorf(pb->z)+MC31_RandI(97)-48;if(x<0 || z<0 || x>255 || z>255)continue;if(!s->level.chunks[(x>>4)+16*(z>>4)])continue;I32 top=MC31_Top(x,z),y=1+MC31_RandI(top);
  I32 w=MC31_RandI(30),e=0;while(e<3 && w>=g34_spawnW[e]){w-=g34_spawnW[e];e++;}I32 n=g34_spawnMin[e]+MC31_RandI(1+g34_spawnMax[e]-g34_spawnMin[e]),made=0;
  for(i=0;i<n*4 && made<n;i++){I32 x2=x+MC31_RandI(6)-MC31_RandI(6),z2=z+MC31_RandI(6)-MC31_RandI(6);if(MC34_TrySpawn(s,g34_spawnK[e],x2,y,z2))made++;if(MC34_Monsters()>=8)return;}if(made)s->unsaved=TRUE;}}
// ---- rendering ----
U0 MC34_LoadTex(){if(g34_mobTexTried)return;g34_mobTexTried=TRUE;g34_mobTex[0]=MC028_Texture("assets/034/mob/zombie.png",NULL,NULL);g34_mobTex[1]=MC028_Texture("assets/034/mob/creeper.png",NULL,NULL);g34_mobTex[2]=MC028_Texture("assets/034/mob/skeleton.png",NULL,NULL);
 g34_mobTex[3]=MC028_Texture("assets/034/mob/spider.png",NULL,NULL);g34_mobTex[4]=MC028_Texture("assets/034/mob/pigzombie.png",NULL,NULL);g34_eyesTex=MC028_Texture("assets/034/mob/spider_eyes.png",NULL,NULL);g34_arrowTex=MC028_Texture("assets/034/item/arrows.png",NULL,NULL);}
U0 MC34_ZombieArms(F32 att,F32 bob){MC33Anim *a=&g33_a;F32 PI=MC31_PI,a2=sin(att*PI),a3=sin((1-(1-att)*(1-att))*PI);
 a->raz=0;a->laz=0;a->ray=-(0.1-a2*0.6);a->lay=0.1-a2*0.6;a->rax=-PI/2;a->lax=-PI/2;a->rax-=a2*1.2-a3*0.4;a->lax-=a2*1.2-a3*0.4;
 a->raz+=cos(bob*0.09)*0.05+0.05;a->laz-=cos(bob*0.09)*0.05+0.05;a->rax+=sin(bob*0.067)*0.05;a->lax-=sin(bob*0.067)*0.05;}
U0 MC34_SkelParts(){MC33Anim *a=&g33_a;
 MC31_Part(0,0,0,a->hx,a->hy,0);MC33_Box(0,0,-4,-8,-4,8,8,8,0,FALSE);MC31_End();
 MC31_Part(0,0,0,0,0,0);MC33_Box(16,16,-4,0,-2,8,12,4,0,FALSE);MC31_End();
 MC31_Part(-5,2,0,a->rax,a->ray,a->raz);MC33_Box(40,16,-1,-2,-1,2,12,2,0,FALSE);MC31_End();
 MC31_Part(5,2,0,a->lax,a->lay,a->laz);MC33_Box(40,16,-1,-2,-1,2,12,2,0,TRUE);MC31_End();
 MC31_Part(-2,12,0,a->rlx,0,0);MC33_Box(0,16,-1,0,-1,2,12,2,0,FALSE);MC31_End();
 MC31_Part(2,12,0,a->llx,0,0);MC33_Box(0,16,-1,0,-1,2,12,2,0,TRUE);MC31_End();}
U0 MC34_SpiderModel(F32 wp,F32 ws,F32 hy,F32 hp){F32 PI=MC31_PI,sr=PI/4,ur=PI/8,zr[8],yr[8];I32 i;
 MC31_Part(0,15,-3,hp/(180/PI),hy/(180/PI),0);MC31_Box(32,4,-4,-4,-8,8,8,8,0);MC31_End();
 MC31_Part(0,15,0,0,0,0);MC31_Box(0,0,-3,-3,-3,6,6,6,0);MC31_End();
 MC31_Part(0,15,9,0,0,0);MC31_Box(0,12,-5,-4,-6,10,8,12,0);MC31_End();
 zr[0]=-sr;zr[1]=sr;zr[2]=-sr*0.74;zr[3]=sr*0.74;zr[4]=-sr*0.74;zr[5]=sr*0.74;zr[6]=-sr;zr[7]=sr;
 yr[0]=ur*2;yr[1]=-ur*2;yr[2]=ur;yr[3]=-ur;yr[4]=-ur;yr[5]=ur;yr[6]=-ur*2;yr[7]=ur*2;
 F32 c[4],sn[4],ph[4];ph[0]=0;ph[1]=PI;ph[2]=PI/2;ph[3]=PI*3/2;for(i=0;i<4;i++){c[i]=-(cos(wp*0.6662*2+ph[i])*0.4)*ws;sn[i]=fabs(sin(wp*0.6662+ph[i])*0.4)*ws;}
 for(i=0;i<4;i++){yr[i*2]+=c[i];yr[i*2+1]-=c[i];zr[i*2]+=sn[i];zr[i*2+1]-=sn[i];}
 F32 lz[4]={2,1,0,-1};for(i=0;i<8;i++){F32 x=-4;if(i&1)x=4;MC31_Part(x,15,lz[i/2],0,yr[i],zr[i]);if(i&1)MC31_Box(18,0,-1,-1,-1,16,2,2,0);else MC31_Box(18,0,-15,-1,-1,16,2,2,0);MC31_End();}}
U0 MC34_CreeperModel(F32 wp,F32 ws,F32 hy,F32 hp){F32 PI=MC31_PI;
 MC31_Part(0,4,0,hp/(180/PI),hy/(180/PI),0);MC31_Box(0,0,-4,-8,-4,8,8,8,0);MC31_End();
 MC31_Part(0,4,0,0,0,0);MC31_Box(16,16,-4,0,-2,8,12,4,0);MC31_End();
 F32 a=cos(wp*0.6662)*1.4*ws,b=cos(wp*0.6662+PI)*1.4*ws;
 MC31_Part(-2,16,4,a,0,0);MC31_Box(0,16,-2,0,-2,4,6,4,0);MC31_End();MC31_Part(2,16,4,b,0,0);MC31_Box(0,16,-2,0,-2,4,6,4,0);MC31_End();
 MC31_Part(-2,16,-4,b,0,0);MC31_Box(0,16,-2,0,-2,4,6,4,0);MC31_End();MC31_Part(2,16,-4,a,0,0);MC31_Box(0,16,-2,0,-2,4,6,4,0);MC31_End();}
U0 MC34_Model(MC31Mob *m,F32 wp,F32 ws,F32 hy,F32 hp,F32 pt,Bool item,F32 light){I32 k=m->kind;g31_tw=64;g31_th=32;
 if(k==35){MC34_SpiderModel(wp,ws,hy,hp);return;}if(k==33){MC34_CreeperModel(wp,ws,hy,hp);return;}
 F32 bob=m->age+m->walkPos*0+g31_app->ticks+pt,att=0;if(m->swing>0)att=1-(m->swing-pt)/8.0;if(att<0)att=0;if(att>1)att=1;
 MC33_SetupAnim(wp,ws,bob,hy,hp,0,FALSE,FALSE);MC34_ZombieArms(att,bob);
 if(k==34)MC34_SkelParts();else MC33_Parts(63,0);
 if(!item)return;I32 hid=0;if(k==34)hid=261;if(k==36)hid=283;if(!hid)return;MC33Anim *a=&g33_a;
 hcgl028_glPushMatrix();MC31_Part(a->rox,2,a->roz,a->rax,a->ray,a->raz);hcgl028_glTranslatef(-0.0625,0.4375,0.0625);
 if(hid==261){hcgl028_glTranslatef(0,0.125,0.3125);hcgl028_glRotatef(-20,0,1,0);hcgl028_glScalef(0.625,-0.625,0.625);hcgl028_glRotatef(-100,1,0,0);hcgl028_glRotatef(45,0,1,0);}
 else{hcgl028_glTranslatef(0,0.1875,0);hcgl028_glScalef(0.625,-0.625,0.625);hcgl028_glRotatef(-100,1,0,0);hcgl028_glRotatef(45,0,1,0);}
 MC33_Item(g31_app,hid,0,light);MC31_End();hcgl028_glPopMatrix();hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,g34_mobTex[k-32]);g31_tw=64;g31_th=32;}
F32 MC34_Swelling(MC31Mob *m,F32 pt){F32 v=(m->oldSwell+(m->swell-m->oldSwell)*pt)/28.0;if(v<0)v=0;return v;}
U0 MC34_Draw(MC31Mob *m,F32 pt,F32 light,F32 wp,F32 ws,F32 hy,F32 hp){MC34_LoadTex();I32 k=m->kind;U32 tex=g34_mobTex[k-32];
 hcgl028_glPushMatrix();F32 sw=0;
 if(k==33){sw=MC34_Swelling(m,pt);F32 wob=1+sin(sw*100)*sw*0.01,g=sw;if(g>1)g=1;g=g*g;g=g*g;F32 sc=(1+g*0.4)*wob,hs=(1+g*0.1)/wob;hcgl028_glTranslatef(0,1.5078125,0);hcgl028_glScalef(sc,hs,sc);hcgl028_glTranslatef(0,-1.5078125,0);}
 hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,tex);hcgl028_glColor4f(light,light,light,1);MC34_Model(m,wp,ws,hy,hp,pt,TRUE,light);
 if(k==35 && g34_eyesTex){hcgl028_glBindTexture(0xDE1,g34_eyesTex);hcgl028_glEnable(0xBE2);hcgl028_glDisable(0xBC0);hcgl028_glBlendFunc(1,1);hcgl028_glDisable(0xB50);hcgl028_glDepthFunc(0x203);hcgl028_glColor4f(1,1,1,1);MC34_Model(m,wp,ws,hy,hp,pt,FALSE,1);hcgl028_glEnable(0xB50);hcgl028_glEnable(0xBC0);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glDisable(0xBE2);}
 F32 fr=0,fg=0,fb=0,fa=0;if(m->hurtTime>0 || m->deathTime>0){fr=light;fa=0.4;}
 if(k==33 && sw>0){I32 st=sw*10;if(st%2){F32 al=sw*0.2;if(al>1)al=1;fr=1;fg=1;fb=1;fa=al*0.5+0.1;}}
 if(fa>0){hcgl028_glDisable(0xDE1);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glDepthFunc(0x202);hcgl028_glColor4f(fr,fg,fb,fa);MC34_Model(m,wp,ws,hy,hp,pt,FALSE,light);hcgl028_glDepthFunc(0x203);hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xDE1);}
 hcgl028_glPopMatrix();hcgl028_glColor4f(1,1,1,1);}
// FireTexture (procedural, two variants side by side in a 32x16 texture)
F32 g34_fireCur[640],g34_fireNext[640];U8 g34_firePix[2048];U32 g34_fireTex=0;Bool g34_fireDirty=FALSE;
F32 MC34_RF(){return MC31_RandI(65536)(F32)/65536.0;}
U0 MC34_FireStep(I32 v){I32 x,y,xx,yy,c;F32 pw;F32 *cur=&g34_fireCur[v*320],*nx=&g34_fireNext[v*320];
 for(x=0;x<16;x++)for(y=0;y<20;y++){c=18;pw=cur[x+((y+1)%20)*16]*c;
  for(xx=x-1;xx<=x+1;xx++)for(yy=y;yy<=y+1;yy++){if(xx>=0 && yy>=0 && xx<16 && yy<20)pw+=cur[xx+yy*16];c++;}
  nx[x+y*16]=pw/(c*1.06);if(y>=19){F32 a=MC34_RF(),b=MC34_RF(),d=MC34_RF();nx[x+y*16]=a*b*d*4+MC34_RF()*0.1+0.2;}}
 for(x=0;x<320;x++)cur[x]=nx[x];
 for(y=0;y<16;y++)for(x=0;x<16;x++){pw=cur[x+y*16]*1.8;if(pw>1)pw=1;if(pw<0)pw=0;F32 p2=pw*pw,p10=p2*p2;p10=p10*p10*p2;
  I32 o=(y*32+x+v*16)*4,r=pw*155+100,g=p2*255,bb=p10*255,al=255;if(pw<0.5)al=0;
  g34_firePix[o]=r(U8);g34_firePix[o+1]=g(U8);g34_firePix[o+2]=bb(U8);g34_firePix[o+3]=al(U8);}}
U0 MC34_FireTick(){MC34_FireStep(0);MC34_FireStep(1);g34_fireDirty=TRUE;}
U0 MC34_FireUpload(){if(!g34_fireTex){hcgl028_glGenTextures(1,&g34_fireTex);hcgl028_glBindTexture(0xDE1,g34_fireTex);hcgl028_glTexParameteri(0xDE1,0x2801,0x2600);hcgl028_glTexParameteri(0xDE1,0x2800,0x2600);g34_fireDirty=TRUE;
  I32 i;for(i=0;i<20;i++)MC34_FireTick();}
 hcgl028_glBindTexture(0xDE1,g34_fireTex);if(g34_fireDirty){hcgl028_glTexImage2D(0xDE1,0,0x1908,32,16,0,0x1908,0x1401,g34_firePix);g34_fireDirty=FALSE;}}
// EntityRenderer::renderFlame for burning mobs + ArrowRenderer
U0 MC34_Flames(MCApp028 *s,F32 pt){I32 i;TextureUVCoordinateSet f0,f1;f0.minX=0;f0.maxX=0.5;f0.minY=0;f0.maxY=1;f1.minX=0.5;f1.maxX=1;f1.minY=0;f1.maxY=1;Player *p=MC31_Player();if(!p)return;F32 vy=p->mob.entity.body.yaw;
 hcgl028_glEnable(0xDE1);MC34_FireUpload();hcgl028_glDisable(0xB50);hcgl028_glEnable(0xBC0);hcgl028_glColor4f(1,1,1,1);
 for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(m->removed || m->e.fire<=0)continue;MCBody023 *b=&m->e.body;F32 x=b->prevX+(b->x-b->prevX)*pt,y=b->prevY+(b->y-b->prevY)*pt,z=b->prevZ+(b->z-b->prevZ)*pt,sc=b->width*1.4,h=b->height/sc,r=0.5,yo=0,z0=0;I32 ss=0;
  hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,z);hcgl028_glScalef(sc,sc,sc);hcgl028_glRotatef(-vy,0,1,0);I32 hi=h;hcgl028_glTranslatef(0,0,-0.3+hi*0.02);hcgl028_glBegin(7);
  while(h>0){TextureUVCoordinateSet *u=&f0;if(ss%2)u=&f1;F32 u0=u->minX,u1=u->maxX,v0=u->minY,v1=u->maxY;if((ss/2)%2==0){F32 t=u0;u0=u1;u1=t;}
   hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(r,0-yo,z0);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(-r,0-yo,z0);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(-r,1.4-yo,z0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(r,1.4-yo,z0);
   h-=0.45;yo-=0.45;r*=0.9;z0+=0.03;ss++;}
  hcgl028_glEnd();hcgl028_glPopMatrix();}}
U0 MC34_RenderArrows(MCApp028 *s,F32 pt){if(!g34_arrowN)return;MC34_LoadTex();if(!g34_arrowTex)return;I32 i;hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,g34_arrowTex);hcgl028_glDisable(0xB44);
 for(i=0;i<g34_arrowN;i++){MC34Arrow *a=&g34_arrow[i];F32 x=a->px+(a->x-a->px)*pt,y=a->py+(a->y-a->py)*pt,z=a->pz+(a->z-a->pz)*pt,yaw=a->pyaw+(a->yaw-a->pyaw)*pt,pitch=a->ppitch+(a->pitch-a->ppitch)*pt,l=MC028_Brightness(s,floorf(x),floorf(y),floorf(z));
  hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,z);hcgl028_glRotatef(yaw-90,0,1,0);hcgl028_glRotatef(pitch,0,0,1);F32 sh=a->shake-pt;if(sh>0)hcgl028_glRotatef(-sin(sh*3)*sh,0,0,1);hcgl028_glRotatef(45,1,0,0);hcgl028_glScalef(0.05625,0.05625,0.05625);hcgl028_glTranslatef(-4,0,0);hcgl028_glColor4f(l,l,l,1);
  F32 u0=0,u1=0.5,v0=0,v1=5/32.0,su0=0,su1=0.15625,sv0=5/32.0,sv1=10/32.0;hcgl028_glBegin(7);
  hcgl028_glTexCoord2f(su0,sv0);hcgl028_glVertex3f(-7,-2,-2);hcgl028_glTexCoord2f(su1,sv0);hcgl028_glVertex3f(-7,-2,2);hcgl028_glTexCoord2f(su1,sv1);hcgl028_glVertex3f(-7,2,2);hcgl028_glTexCoord2f(su0,sv1);hcgl028_glVertex3f(-7,2,-2);
  I32 k;hcgl028_glEnd();for(k=0;k<4;k++){hcgl028_glRotatef(90,1,0,0);hcgl028_glBegin(7);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(-8,-2,0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(8,-2,0);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(8,2,0);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(-8,2,0);hcgl028_glEnd();}
  hcgl028_glPopMatrix();}
 hcgl028_glEnable(0xB44);hcgl028_glColor4f(1,1,1,1);}
