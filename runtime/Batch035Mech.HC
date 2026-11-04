// Batch035 mechanics. See Batch035.HH for the list of ported original classes.
// ---- helpers ----
Player *MC35_P(MCApp028 *s){if(!s->minecraft.player)return NULL;return &s->minecraft.player->player;}
Tile *MC35_TileObj(MCApp028 *s,I32 id){if(id<=0 || id>255)return NULL;return s->level.tileObjects[id];}
Bool MC35_MatSolid(MCApp028 *s,I32 id){Tile *t=MC35_TileObj(s,id);if(!t || !t->material)return FALSE;return Material_isSolid(t->material);}
Bool MC35_MatBlocks(MCApp028 *s,I32 id){Tile *t=MC35_TileObj(s,id);if(!t || !t->material)return FALSE;return Material_blocksMotion(t->material);}
Bool MC35_MatLiquid(MCApp028 *s,I32 id){Tile *t=MC35_TileObj(s,id);if(!t || !t->material)return FALSE;return Material_isLiquid(t->material);}
Bool MC35_SolidBlocking(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return FALSE;I32 id=Level_getTile(&s->level,x,y,z);Tile *t=MC35_TileObj(s,id);if(!t || !t->material)return FALSE;return Material_isSolidBlocking(t->material) && s->catalog.registry.tiles[id].cube;}
I32 MC35_BlockLight(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return 0;LevelChunk *c=Level_getChunk(&s->level,x>>4,z>>4,FALSE);if(!c)return 0;return DataLayer_get(&c->blockLight,x&15,y,z&15);}
I32 MC35_RI(I32 n){if(n<=1)return 0;U32 v=Random_genrand_int32(&g35_app->level.world.random);return v%n;}
F32 MC35_RF(){return Random_nextFloat(&g35_app->level.world.random);}
Bool MC35_Overlap(AABB *a,F32 x0,F32 y0,F32 z0,F32 x1,F32 y1,F32 z1){return a->maxX>x0 && a->minX<x1 && a->maxY>y0 && a->minY<y1 && a->maxZ>z0 && a->minZ<z1;}
// Level::containsTile-like test on a deflated entity box (Entity::checkInside / containsFireTile)
Bool MC35_BoxHas(MCApp028 *s,AABB *b,I32 id){I32 x,y,z,x0=floorf(b->minX+0.001),x1=floorf(b->maxX-0.001),y0=floorf(b->minY+0.001),y1=floorf(b->maxY-0.001),z0=floorf(b->minZ+0.001),z1=floorf(b->maxZ-0.001);
 for(x=x0;x<=x1;x++)for(y=y0;y<=y1;y++)for(z=z0;z<=z1;z++)if(Level_InBounds(x,y,z) && Level_getTile(&s->level,x,y,z)==id)return TRUE;return FALSE;}
// Cactus is inset by 1/16, so entityInside fires when the entity box touches the cactus cell (Level::checkInside grows by 0.001).
Bool MC35_TouchCactus(MCApp028 *s,AABB *b){I32 x,y,z,x0=floorf(b->minX-0.001),x1=floorf(b->maxX+0.001),y0=floorf(b->minY-0.0635),y1=floorf(b->maxY-0.001),z0=floorf(b->minZ-0.001),z1=floorf(b->maxZ+0.001);
 for(x=x0;x<=x1;x++)for(y=y0;y<=y1;y++)for(z=z0;z<=z1;z++)if(Level_InBounds(x,y,z) && Level_getTile(&s->level,x,y,z)==81)return TRUE;return FALSE;}
U0 MC35_Bits(MCApp028 *s,I32 item,F32 x,F32 y,F32 z,I32 n){TextureUVCoordinateSet uv;MC029_ItemUV(s,item,0,&uv);I32 i;for(i=0;i<n && g35_bitN<MC35_MAXBIT;i++){MC35Bit *b=&g35_bit[g35_bitN++];memset(b,0,sizeof(MC35Bit));b->x=x;b->y=y;b->z=z;b->px=x;b->py=y;b->pz=z;
 b->mx=(MC31_Rand()*2-1)*0.4;b->my=(MC31_Rand()*2-1)*0.4+0.1;b->mz=(MC31_Rand()*2-1)*0.4;F32 sp=(MC31_Rand()+MC31_Rand()+1)*0.15,d=sqrt(b->mx*b->mx+b->my*b->my+b->mz*b->mz);if(d<1.0e-4)d=1;b->mx=b->mx/d*sp*0.4;b->my=b->my/d*sp*0.4+0.1;b->mz=b->mz/d*sp*0.4;
 F32 du=(uv.maxX-uv.minX)/4,dv=(uv.maxY-uv.minY)/4,ou=MC31_Rand()*3,ov=MC31_Rand()*3;b->u0=uv.minX+ou*du;b->u1=b->u0+du;b->v0=uv.minY+ov*dv;b->v1=b->v0+dv;b->size=0.1*(MC31_Rand()*0.5+0.5);b->life=4/(MC31_Rand()*0.9+0.1);}}
U0 MC35_BitsTick(MCApp028 *s){I32 i,j=0;for(i=0;i<g35_bitN;i++){MC35Bit *b=&g35_bit[i];b->px=b->x;b->py=b->y;b->pz=b->z;b->age++;if(b->age>=b->life)continue;b->my-=0.04;b->x+=b->mx;b->y+=b->my;b->z+=b->mz;
 if(MC31_Solid(MC31_Tile(floorf(b->x),floorf(b->y),floorf(b->z)))){b->y=b->py;b->my=0;b->mx*=0.7;b->mz*=0.7;}b->mx*=0.98;b->my*=0.98;b->mz*=0.98;g35_bit[j++]=*b;}g35_bitN=j;}
U0 MC35_Notice(MCApp028 *s,U8 *msg){MC028_Notice(s,msg);printf("NOTICE035 %s\n",msg);}

// ---- Motive + Painting (HangingEntity) ----
U8 *g35_motName[28]={"Kebab","Aztec2","Alban","Bomb","Plant","Wasteland","Pool","Courbet","Sea","Sunset","Creebet","Wanderer","Graham","Match","Bust","Stage","Void","SkullAndRoses","Fighters","Pointer","Pigscene","BurningSkull","Skeleton","DonkeyKong","Earth","Wind","Fire","Water"};
I32 g35_mot[28*5]={16,16,0,0,1, 16,16,48,0,1, 16,16,32,0,1, 16,16,48,0,1, 16,16,80,0,1, 16,16,96,0,1, 32,16,0,32,1, 32,16,32,32,1, 32,16,32,32,1, 32,16,96,32,1, 32,16,128,32,1,
 16,32,0,64,1, 16,32,16,64,1, 32,32,0,128,1, 32,32,32,128,1, 32,32,64,128,1, 32,32,96,128,1, 32,32,128,128,1, 64,32,0,96,1, 64,64,0,192,1, 64,64,64,192,1, 64,64,128,192,1, 64,48,192,64,1, 64,48,192,112,1,
 32,32,0,160,0, 32,32,32,160,0, 32,32,64,160,0, 32,32,96,160,0};
F32 MC35_Offs(I32 v){if(v==32 || v==64)return 0.5;return 0;}
// HangingEntity::setDir
U0 MC35_SetDir(MC35Paint *p,I32 dir){I32 w=g35_mot[p->motive*5],h=g35_mot[p->motive*5+1],opp[4]={2,3,0,1};p->dir=dir;p->yaw=90*dir;F32 ex=2,ez=w;if(dir==2 || dir==0){ex=w;ez=2;p->yaw=90*opp[dir];}
 F32 hx=ex*0.03125,hy=h*0.03125,hz=ez*0.03125,cx=p->tx+0.5,cy=p->ty+0.5,cz=p->tz+0.5;
 if(dir==2){cz-=0.5625;cx-=MC35_Offs(w);}else if(dir==1){cx-=0.5625;cz+=MC35_Offs(w);}else if(dir==3){cx+=0.5625;cz-=MC35_Offs(w);}else {cz+=0.5625;cx+=MC35_Offs(w);}
 cy+=MC35_Offs(h);p->x=cx;p->y=cy;p->z=cz;p->box.minX=cx-hx+0.03125;p->box.minY=cy-hy+0.03125;p->box.minZ=cz-hz+0.03125;p->box.maxX=cx+hx-0.03125;p->box.maxY=cy+hy-0.03125;p->box.maxZ=cz+hz-0.03125;}
// HangingEntity::survives
Bool MC35_Survives(MCApp028 *s,MC35Paint *p){AABB *b=&p->box;I32 x,y,z;for(x=floorf(b->minX);x<=floorf(b->maxX);x++)for(y=floorf(b->minY);y<=floorf(b->maxY);y++)for(z=floorf(b->minZ);z<=floorf(b->maxZ);z++){if(!Level_InBounds(x,y,z))return FALSE;I32 id=Level_getTile(&s->level,x,y,z);if(id>0 && MC31_Solid(id)){AABB t;if(!MC032_Box(s,id,x,y,z,TRUE,&t))Tile_getAABB(&s->catalog.tiles[id],x,y,z,&t);if(MC35_Overlap(b,t.minX,t.minY,t.minZ,t.maxX,t.maxY,t.maxZ))return FALSE;}}
 I32 w=g35_mot[p->motive*5],h=g35_mot[p->motive*5+1],wb=w/16,hb=h/16,tx=p->tx,tz=p->tz,off;if(wb<1)wb=1;if(hb<1)hb=1;
 if(p->dir==2 || p->dir==0)tx=floorf(p->x-w*0.03125);else tz=floorf(p->z-w*0.03125);I32 minY=floorf(p->y-h*0.03125);
 for(off=0;off<wb;off++)for(y=minY;y<minY+hb;y++){I32 id;if(p->dir==2 || p->dir==0)id=Level_getTile(&s->level,off+tx,y,p->tz);else id=Level_getTile(&s->level,p->tx,y,off+tz);if(!MC35_MatSolid(s,id))return FALSE;}
 I32 i;for(i=0;i<g35_paintN;i++){MC35Paint *o=&g35_paint[i];if(o==p || o->removed)continue;if(MC35_Overlap(b,o->box.minX,o->box.minY,o->box.minZ,o->box.maxX,o->box.maxY,o->box.maxZ))return FALSE;}
 return TRUE;}
// Painting::setRandomMotive
I32 MC35_Pick(I32 n){if(n<=1)return 0;U32 v=Random_genrand_int32(&g31_rng);return v%n;}
U0 MC35_RandomMotive(MCApp028 *s,MC35Paint *p,I32 dir){I32 ok[28],n=0,i;for(i=0;i<28;i++){if(!g35_mot[i*5+4])continue;p->motive=i;MC35_SetDir(p,dir);if(MC35_Survives(s,p))ok[n++]=i;}if(!n)p->motive=0;else p->motive=ok[MC35_Pick(n)];MC35_SetDir(p,dir);}
U0 MC35_PaintDrop(MCApp028 *s,MC35Paint *p){if(!s->creative)MC31_Drop(321,0,1,p->x,p->y,p->z,0,0,0,FALSE);}
U0 MC35_PaintRemove(MCApp028 *s,MC35Paint *p,Bool drop){if(p->removed)return;p->removed=TRUE;if(drop)MC35_PaintDrop(s,p);s->unsaved=TRUE;printf("PAINT035 removed motive=%s drop=%d\n",g35_motName[p->motive],drop);}
U0 MC35_PaintTick(MCApp028 *s){I32 i,j=0;for(i=0;i<g35_paintN;i++){MC35Paint *p=&g35_paint[i];if(!p->removed){p->survive++;if(p->survive==101){p->survive=0;if(!MC35_Survives(s,p))MC35_PaintRemove(s,p,TRUE);}}if(!p->removed)g35_paint[j++]=*p;}g35_paintN=j;}
// HangingEntityItem::useOn (Direction::FACING_DIRECTION)
I32 MC35_PlacePainting(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face){if(face<2 || face>5)return 0;if(g35_paintN>=MC35_MAXPAINT)return 1;I32 facing[6]={-1,-1,2,0,1,3};MC35Paint *p=&g35_paint[g35_paintN];memset(p,0,sizeof(MC35Paint));p->tx=x;p->ty=y;p->tz=z;MC35_RandomMotive(s,p,facing[face]);
 if(!MC35_Survives(s,p))return 1;g35_paintN++;if(!s->creative){item->count--;if(item->count<1)ItemInstance_setNull(item);}s->unsaved=TRUE;MC030_Play("step.wood",p->x,p->y,p->z,1.0,0.8);printf("PAINT035 placed motive=%s dir=%d at=%d,%d,%d\n",g35_motName[p->motive],p->dir,x,y,z);return 1;}

// ---- Throwable (Snowball 332, ThrownEgg 344) ----
U0 MC35_Throw(MCApp028 *s,I32 item){Player *p=MC35_P(s);if(!p || g35_throwN>=MC35_MAXTHROW)return;MCBody023 *b=&p->mob.entity.body;MC35Throw *t=&g35_throw[g35_throwN++];memset(t,0,sizeof(MC35Throw));t->item=item;
 F32 yr=b->yaw*MC31_PI/180,pr=b->pitch*MC31_PI/180;t->x=b->x-cos(yr)*0.16;t->y=b->y-0.1;t->z=b->z-sin(yr)*0.16;
 F32 dx=-sin(yr)*cos(pr),dy=-sin(pr),dz=cos(yr)*cos(pr);if(g29_dirMode==1){dx=g29_rayX;dy=g29_rayY;dz=g29_rayZ;}
 F32 l=sqrt(dx*dx+dy*dy+dz*dz),sp=1.5;if(l<0.001)l=1;dx=dx/l+MC31_Gauss()*0.0075*sp;dy=dy/l+MC31_Gauss()*0.0075*sp;dz=dz/l+MC31_Gauss()*0.0075*sp;t->mx=dx*sp;t->my=dy*sp;t->mz=dz*sp;t->px=t->x;t->py=t->y;t->pz=t->z;
 F32 base=0.4;if(item==344)base=0.5;MC030_Play("random.bow",b->x,b->y,b->z,0.5,base/(MC31_Rand()*0.4+0.8));g35_shots++;printf("THROW035 item=%d\n",item);}
// Mob::hurt(this,0): no health loss, but hurt animation + knockback away from the projectile
U0 MC35_Knock(MC31Mob *m,F32 fx,F32 fz){MCBody023 *b=&m->e.body;if(m->invul>10)return;m->invul=20;m->hurtTime=10;m->lastHurt=0;F32 dx=fx-b->x,dz=fz-b->z;while(dx*dx+dz*dz<1.0e-4){dx=(MC31_Rand()-MC31_Rand())*0.01;dz=(MC31_Rand()-MC31_Rand())*0.01;}F32 d=sqrt(dx*dx+dz*dz);
 b->motionX/=2;b->motionY/=2;b->motionZ/=2;b->motionX-=dx/d*0.4;b->motionY+=0.4;b->motionZ-=dz/d*0.4;if(b->motionY>0.4)b->motionY=0.4;MC31_Sound(m,1);}
MC31Mob *MC35_HitMob(F32 x,F32 y,F32 z,F32 mx,F32 my,F32 mz,F32 limit,F32 *at){Vec3 o;Vec3_Init(&o,x,y,z);MC31Mob *best=NULL;I32 i;for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(!MC31_Alive(m))continue;AABB *a=&m->e.box;F32 h=MC31_Slab(&o,mx,my,mz,a->minX-0.3,a->minY-0.3,a->minZ-0.3,a->maxX+0.3,a->maxY+0.3,a->maxZ+0.3);if(h>=0 && h<=limit){limit=h;best=m;}}*at=limit;return best;}
U0 MC35_ThrowHit(MCApp028 *s,MC35Throw *t,MC31Mob *m){if(m)MC35_Knock(m,t->x,t->y*0+t->z);
 if(t->item==344 && MC35_RI(8)==0){I32 n=1,i;if(MC35_RI(32)==0)n=4;for(i=0;i<n;i++){MC31Mob *c=MC31_New(10,t->x,t->y,t->z,MC31_Rand()*360);if(c)c->age=-24000;}printf("EGG035 hatched %d\n",n);}
 MC35_Bits(s,t->item,t->x,t->y,t->z,6);t->removed=TRUE;}
U0 MC35_ThrowTick(MCApp028 *s,MC35Throw *t){t->px=t->x;t->py=t->y;t->pz=t->z;t->air++;if(t->air>1200 || t->y<-64){t->removed=TRUE;return;}
 F32 sp=sqrt(t->mx*t->mx+t->my*t->my+t->mz*t->mz),hitT=1;I32 steps=sp/0.1+1,i;Bool block=FALSE;
 for(i=1;i<=steps;i++){F32 f=i/(steps(F32));I32 bx=floorf(t->x+t->mx*f),by=floorf(t->y+t->my*f),bz=floorf(t->z+t->mz*f),id=MC31_Tile(bx,by,bz);if(id>0 && !(id>=8 && id<=11) && (MC31_Solid(id) || MC31_Cube(id))){block=TRUE;hitT=f;break;}}
 F32 at;MC31Mob *m=MC35_HitMob(t->x,t->y,t->z,t->mx,t->my,t->mz,hitT,&at);if(m){t->x+=t->mx*at;t->y+=t->my*at;t->z+=t->mz*at;MC35_ThrowHit(s,t,m);return;}
 if(block){t->x+=t->mx*hitT;t->y+=t->my*hitT;t->z+=t->mz*hitT;MC35_ThrowHit(s,t,NULL);return;}
 t->x+=t->mx;t->y+=t->my;t->z+=t->mz;F32 drag=0.99;if(MC31_Water(MC31_Tile(floorf(t->x),floorf(t->y),floorf(t->z)))){drag=0.8;I32 k;for(k=0;k<4;k++)MC31_Particle(3,t->x-t->mx*0.25,t->y-t->my*0.25,t->z-t->mz*0.25,t->mx,t->my,t->mz);}
 t->mx*=drag;t->my*=drag;t->mz*=drag;t->my-=0.03;}

// ---- BowItem: use -> startUsingItem, releaseUsing -> Arrow(level,player,power*2) ----
F32 MC35_LaunchPower(I32 ticks){F32 f=ticks/20.0;f=(f*f+f*2)/3;if(f>1)f=1;return f;}
I32 MC035_BowFrame(){if(!g35_using)return -1;I32 f=MC35_LaunchPower(g35_useTicks)*0.99*3;return f;}
Bool MC35_HasArrow(MCApp028 *s){Player *p=MC35_P(s);if(p->abilities.instabuild)return TRUE;return MC028_Count(s,262)>0;}
U0 MC35_TakeArrow(MCApp028 *s){Player *pl=MC35_P(s);Inventory *inv=&pl->inventory;I32 i;for(i=9;i<inv->size;i++){ItemInstance *it=inv->items[i];if(it && it->count>0 && ItemInstance_getId(it)==262){it->count--;if(it->count<1)ItemInstance_setNull(it);return;}}}
U0 MC35_StartBow(MCApp028 *s){if(g35_using || !MC35_HasArrow(s))return;g35_using=TRUE;g35_useTicks=0;}
U0 MC35_Release(MCApp028 *s){Player *p=MC35_P(s);g35_using=FALSE;F32 power=MC35_LaunchPower(g35_useTicks);g35_useTicks=0;if(power<0.1)return;ItemInstance *held=Inventory_getSelected(&p->inventory);if(!held || ItemInstance_getId(held)!=261)return;
 if(!p->abilities.instabuild){if(!MC35_HasArrow(s))return;ItemInstance_hurtAndBreak(held,1,&p->view);if(held->count<1)ItemInstance_setNull(held);MC35_TakeArrow(s);}
 MCBody023 *b=&p->mob.entity.body;MC030_Play("random.bow",b->x,b->y,b->z,1.0,1/(MC31_Rand()*0.4+1.2)+power*0.5);if(g34_arrowN>=MC34_MAXARROW)return;MC34Arrow *a=&g34_arrow[g34_arrowN++];memset(a,0,sizeof(MC34Arrow));a->fromPlayer=TRUE;a->crit=power==1.0;
 F32 yr=b->yaw*MC31_PI/180,pr=b->pitch*MC31_PI/180;a->x=b->x-cos(yr)*0.16;a->y=b->y-0.1;a->z=b->z-sin(yr)*0.16;a->px=a->x;a->py=a->y;a->pz=a->z;
 F32 dx=-sin(yr)*cos(pr),dy=-sin(pr),dz=cos(yr)*cos(pr);if(g29_dirMode==1){dx=g29_rayX;dy=g29_rayY;dz=g29_rayZ;}F32 sp=power*2*1.5,l=sqrt(dx*dx+dy*dy+dz*dz);if(l<0.0001)l=1;
 dx=(dx/l+MC31_Gauss()*0.0075)*sp;dy=(dy/l+MC31_Gauss()*0.0075)*sp;dz=(dz/l+MC31_Gauss()*0.0075)*sp;a->mx=dx;a->my=dy;a->mz=dz;F32 hd=sqrt(dx*dx+dz*dz);a->yaw=atan2f(dx,dz)*180/MC31_PI;a->pitch=atan2f(dy,hd)*180/MC31_PI;a->pyaw=a->yaw;a->ppitch=a->pitch;
 s->unsaved=TRUE;g35_shots++;printf("BOW035 shot power=%.2f crit=%d\n",power,a->crit);}
// Arrow::tick entity hit for player-shot arrows (critical bonus, bounce when hurt is refused)
Bool MC035_ArrowMobs(MCApp028 *s,MC34Arrow *a,F32 sp,F32 t){F32 at;MC31Mob *m=MC35_HitMob(a->x,a->y,a->z,a->mx,a->my,a->mz,t,&at);if(!m)return FALSE;I32 dmg=ceilf(sp*2);if(a->crit)dmg+=Random_genrand_int32(&g31_rng)%(dmg/2+2);
 if(MC31_Hurt(m,TRUE,dmg)){MC030_Play("random.bowhit",a->x,a->y,a->z,1.0,1.2/(MC31_Rand()*0.2+0.9));a->removed=TRUE;g35_mobHits++;printf("ARROW035 hit mob kind=%d dmg=%d hp=%d\n",m->kind,dmg,m->e.body.health);}
 else {a->life=0;a->mx*=-0.1;a->my*=-0.1;a->mz*=-0.1;a->yaw+=180;a->pyaw+=180;}return TRUE;}
// Arrow::playerTouch
U0 MC35_ArrowPickup(MCApp028 *s){Player *p=MC35_P(s);if(!p || p->mob.entity.body.health<=0)return;AABB *pb=&p->mob.entity.box;I32 i;for(i=0;i<g34_arrowN;i++){MC34Arrow *a=&g34_arrow[i];if(a->removed || !a->inGround || !a->fromPlayer || a->shake>0)continue;
 if(a->x<pb->minX-1 || a->x>pb->maxX+1 || a->y+0.5<pb->minY || a->y>pb->maxY || a->z<pb->minZ-1 || a->z>pb->maxZ+1)continue;
 if(!s->creative){ItemInstance it;ItemInstance_Init(&it,&s->catalog.registry,262,1,0);if(!Inventory_add(&p->inventory,&it) && it.count>0)continue;}
 MC030_Play("random.pop",a->x,a->y,a->z,0.2,((MC31_Rand()-MC31_Rand())*0.7+1)*2);a->removed=TRUE;g35_pickups++;s->unsaved=TRUE;}}

// ---- Item::use for bow / snowball / egg / mushroom stew (BowlFoodItem) ----
U0 MC35_CamAdd(MCApp028 *s);
I32 MC035_UseHeld(MCApp028 *s,ItemInstance *held){g35_app=s;if(held==NULL || held->count<1)return -1;I32 id=ItemInstance_getId(held);Player *p=MC35_P(s);if(p==NULL)return -1;
 if(id==261){MC35_StartBow(s);if(s->hasHit)return 0;return 1;}
 if(id==332 || id==344){if(s->placeCooldown>0)return 1;if(!s->creative){held->count--;if(held->count<1)ItemInstance_setNull(held);}MC35_Throw(s,id);s->unsaved=TRUE;return 1;}
 if(id==282){MCBody023 *b=&p->mob.entity.body;if(b->health<20){b->health+=8;if(b->health>20)b->health=20;MC030_EatSound(s);if(!s->creative)ItemInstance_Init(held,&s->catalog.registry,281,1,0);s->unsaved=TRUE;printf("STEW035 ate hp=%d\n",b->health);}return 1;}
 if(id==456){MC35_CamAdd(s);return 1;}
 return -1;}
Bool MC35_HoldingBow(MCApp028 *s){Player *p=MC35_P(s);if(p==NULL)return FALSE;ItemInstance *h=Inventory_getSelected(&p->inventory);return h!=NULL && h->count>0 && ItemInstance_getId(h)==261;}
// Player::startUsingItem / LocalPlayer: movement *0.2 while using; touch: hold-to-draw replaces mining
U0 MC035_Input(MCApp028 *s){g35_app=s;if(!MC35_HoldingBow(s)){g35_using=FALSE;g35_useTicks=0;return;}
 if(g29_touchOn && g29_tbState==3){MC35_StartBow(s);s->leftDown=FALSE;s->leftPressed=FALSE;}
 if(g35_using){s->input.strafeInput*=0.2;s->input.forwardInput*=0.2;if(g29_touchOn)s->leftDown=FALSE;}}
U0 MC35_BowTick(MCApp028 *s){if(!g35_using)return;if(!MC35_HoldingBow(s)){g35_using=FALSE;g35_useTicks=0;return;}g35_useTicks++;if(g35_demo)return;
 Bool hold=s->rightDown;if(g29_touchOn && g29_tbState==3)hold=TRUE;if(!hold)MC35_Release(s);}

// ---- redstone ore (RedStoneOreTile::interact/attack/stepOn, poof particles) ----
U0 MC35_RedDust(MCApp028 *s,I32 x,I32 y,I32 z){I32 i;for(i=0;i<6;i++){F32 px=x+MC35_RF(),py=y+MC35_RF(),pz=z+MC35_RF();if(i==0 && !MC31_Solid(MC31_Tile(x,y+1,z)))py=y+1.0625;if(i==1 && !MC31_Solid(MC31_Tile(x,y-1,z)))py=y-0.0625;if(i==2 && !MC31_Solid(MC31_Tile(x,y,z+1)))pz=z+1.0625;if(i==3 && !MC31_Solid(MC31_Tile(x,y,z-1)))pz=z-0.0625;if(i==4 && !MC31_Solid(MC31_Tile(x+1,y,z)))px=x+1.0625;if(i==5 && !MC31_Solid(MC31_Tile(x-1,y,z)))px=x-0.0625;
  if(px<x || px>x+1 || py<y || py>y+1 || pz<z || pz>z+1){MC31_Particle(1,px,py,pz,0,0,0);if(g31_partN>0){MC31Part *q=&g31_parts[g31_partN-1];q->r=1;q->g=0;q->b=0;}}}}
U0 MC35_RedInteract(MCApp028 *s,I32 x,I32 y,I32 z){I32 id=Level_getTile(&s->level,x,y,z);MC35_RedDust(s,x,y,z);if(id==73){Level_setTileAndData(&s->level,x,y,z,74,0,3);s->lightsDirty=TRUE;printf("REDSTONE035 lit %d,%d,%d\n",x,y,z);}}

// ---- Entity::baseTick / Mob::baseTick: burning, fire tiles, cactus, suffocation ----
Bool MC35_InWall(MCApp028 *s,F32 x,F32 ey,F32 z,F32 w){I32 i;for(i=0;i<8;i++){F32 xx=x+(((i>>0)&1)-0.5)*w*0.8,yy=ey+(((i>>1)&1)-0.5)*0.1,zz=z+(((i>>2)&1)-0.5)*w*0.8;if(MC35_SolidBlocking(s,floorf(xx),floorf(yy),floorf(zz)))return TRUE;}return FALSE;}
U0 MC35_PlayerEnv(MCApp028 *s){Player *p=MC35_P(s);if(p==NULL)return;Entity *e=&p->mob.entity;MCBody023 *b=&e->body;if(b->health<=0)return;
 if(s->creative || p->abilities.invulnerable){e->fire=0;return;}
 if(MC35_BoxHas(s,&e->box,8) || MC35_BoxHas(s,&e->box,9) || b->inWater)e->fire=0;
 if(b->inLava)e->fire=300;
 if(MC35_BoxHas(s,&e->box,51)){if(MC033_Hurt(p,NULL,1,FALSE))printf("ENV035 player burned in fire hp=%d\n",b->health);if(e->fire<=0)e->fire=160;}
 if(e->fire>0){if((e->fire%20)==0)MC033_Hurt(p,NULL,1,FALSE);e->fire--;}
 if(MC35_TouchCactus(s,&e->box)){if(MC033_Hurt(p,NULL,1,FALSE))printf("ENV035 player cactus hp=%d\n",b->health);}
 if(!p->sleeping && MC35_InWall(s,b->x,b->y,b->z,e->box.maxX-e->box.minX)){if(MC033_Hurt(p,NULL,1,FALSE))printf("ENV035 player suffocating hp=%d\n",b->health);}
 if(b->onGround && !s->input.sneaking){I32 fx=floorf(b->x),fy=floorf(e->box.minY-0.2),fz=floorf(b->z);if(Level_getTile(&s->level,fx,fy,fz)==73)MC35_RedInteract(s,fx,fy,fz);}}
U0 MC35_MobEnv(MCApp028 *s){I32 i;for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(!MC31_Alive(m))continue;AABB *a=&m->e.box;
 if(MC35_BoxHas(s,a,51)){MC31_Hurt(m,FALSE,1);if(m->e.fire<=0)m->e.fire=160;}
 if(MC35_TouchCactus(s,a))MC31_Hurt(m,FALSE,1);
 F32 ey=a->minY+(a->maxY-a->minY)*0.85;if(MC35_InWall(s,(a->minX+a->maxX)/2,ey,(a->minZ+a->maxZ)/2,a->maxX-a->minX))MC31_Hurt(m,FALSE,1);
 if(m->e.body.onGround){I32 fx=floorf(m->e.body.x),fy=floorf(a->minY-0.2),fz=floorf(m->e.body.z);if(Level_getTile(&s->level,fx,fy,fz)==73)MC35_RedInteract(s,fx,fy,fz);}}}

// ---- painting picking (Entity hit by the crosshair / touch ray) ----
U0 MC35_CamPick(MCApp028 *s);
U0 MC035_Pick(MCApp028 *s){g35_paintSel=-1;MC35_CamPick(s);if(g35_camSel>=0)return;if(!s->worldReady || s->minecraft.player==NULL || g29_dirMode==2 || s->paused || s->inventory || !g35_paintN)return;if(g31_sel!=NULL || g34_cartSel>=0)return;
 Vec3 eye,end;MC028_Direction(s,&eye,&end,1);F32 dx=end.x-eye.x,dy=end.y-eye.y,dz=end.z-eye.z,limit=3;if(s->creative)limit=5;
 if(s->hasHit){I32 id=Level_getTile(&s->level,s->hit.x,s->hit.y,s->hit.z);AABB box;Tile_getAABB(&s->catalog.tiles[id],s->hit.x,s->hit.y,s->hit.z,&box);F32 t=MC31_Slab(&eye,dx,dy,dz,box.minX,box.minY,box.minZ,box.maxX,box.maxY,box.maxZ);if(t>=0 && t<limit)limit=t;}
 I32 i;for(i=0;i<g35_paintN;i++){MC35Paint *p=&g35_paint[i];if(p->removed)continue;AABB *a=&p->box;F32 t=MC31_Slab(&eye,dx,dy,dz,a->minX-0.03,a->minY-0.03,a->minZ-0.03,a->maxX+0.03,a->maxY+0.03,a->maxZ+0.03);if(t>=0 && t<=limit){limit=t;g35_paintSel=i;}}
 if(g35_paintSel<0)return;s->hasHit=FALSE;Bool attack=s->leftPressed;if(g29_touchOn && s->rightPressed)attack=TRUE;
 if(attack){MC35Paint *p=&g35_paint[g35_paintSel];MC033_Swing();MC35_PaintRemove(s,p,TRUE);MC030_Play("step.wood",p->x,p->y,p->z,1.0,0.8);s->leftPressed=FALSE;s->rightPressed=FALSE;s->mineCooldown=5;s->placeCooldown=5;g35_paintSel=-1;}}

// ---- tile rules: Ice, TopSnow, RedStoneOre, Mushroom, Cactus, Reed ----
Bool MC35_MushroomSurvive(MCApp028 *s,I32 x,I32 y,I32 z){if(y<0 || y>127 || !Level_InBounds(x,y,z))return FALSE;return MC31_RawLight(x,y,z)<=12 && MC31_Solid(Level_getTile(&s->level,x,y-1,z));}
Bool MC35_CactusSurvive(MCApp028 *s,I32 x,I32 y,I32 z){if(MC35_MatSolid(s,Level_getTile(&s->level,x-1,y,z)) || MC35_MatSolid(s,Level_getTile(&s->level,x+1,y,z)) || MC35_MatSolid(s,Level_getTile(&s->level,x,y,z-1)) || MC35_MatSolid(s,Level_getTile(&s->level,x,y,z+1)))return FALSE;I32 b=Level_getTile(&s->level,x,y-1,z);return b==81 || b==12;}
Bool MC35_ReedSurvive(MCApp028 *s,I32 x,I32 y,I32 z){I32 b=Level_getTile(&s->level,x,y-1,z);if(b==83)return TRUE;if(b!=2 && b!=3 && b!=12)return FALSE;I32 w[4];w[0]=Level_getTile(&s->level,x-1,y-1,z);w[1]=Level_getTile(&s->level,x+1,y-1,z);w[2]=Level_getTile(&s->level,x,y-1,z-1);w[3]=Level_getTile(&s->level,x,y-1,z+1);I32 i;for(i=0;i<4;i++)if(w[i]==8 || w[i]==9)return TRUE;return FALSE;}
Bool MC35_SnowSurvive(MCApp028 *s,I32 x,I32 y,I32 z){I32 b=Level_getTile(&s->level,x,y-1,z);if(!b)return FALSE;if(b==18)return TRUE;return MC31_Solid(b) && MC35_MatBlocks(s,b);}
U0 MC035_RandomTick(MCApp028 *s,I32 x,I32 y,I32 z){g35_app=s;g31_app=s;Level *l=&s->level;I32 id=Level_getTile(l,x,y,z);
 if(id==79){if(MC35_BlockLight(s,x,y,z)>8){Level_setTileAndData(l,x,y,z,9,0,3);printf("ICE035 melted %d,%d,%d\n",x,y,z);}return;}
 if(id==78){if(MC35_BlockLight(s,x,y,z)>11){Level_setTileAndData(l,x,y,z,0,0,3);printf("SNOW035 melted %d,%d,%d\n",x,y,z);}return;}
 if(id==74){Level_setTileAndData(l,x,y,z,73,0,3);s->lightsDirty=TRUE;return;}
 if(id==39 || id==40){if(MC35_RI(25))return;I32 n=5,a,b,c;for(a=x-4;a<=x+4;a++)for(c=z-4;c<=z+4;c++)for(b=y-1;b<=y+1;b++)if(Level_getTile(l,a,b,c)==id){n--;if(n<=0)return;}
  I32 xx=x+MC35_RI(3)-1,yy=y+MC35_RI(2)-MC35_RI(2),zz=z+MC35_RI(3)-1,k;
  for(k=0;k<4;k++){if(Level_InBounds(xx,yy,zz) && !Level_getTile(l,xx,yy,zz) && MC35_MushroomSurvive(s,xx,yy,zz)){x=xx;y=yy;z=zz;}xx=x+MC35_RI(3)-1;yy=y+MC35_RI(2)-MC35_RI(2);zz=z+MC35_RI(3)-1;}
  if(Level_InBounds(xx,yy,zz) && !Level_getTile(l,xx,yy,zz) && MC35_MushroomSurvive(s,xx,yy,zz)){Level_setTileAndData(l,xx,yy,zz,id,0,3);printf("MUSHROOM035 spread %d,%d,%d\n",xx,yy,zz);}return;}}
U0 MC035_Neighbor(MCApp028 *s,I32 x,I32 y,I32 z,I32 id){g35_app=s;g31_app=s;if(!Level_InBounds(x,y,z))return;
 if(id==81 && !MC35_CactusSurvive(s,x,y,z)){MC32_Pop(s,x,y,z,81,0);printf("CACTUS035 popped %d,%d,%d\n",x,y,z);return;}
 if(id==83 && !MC35_ReedSurvive(s,x,y,z)){MC32_Pop(s,x,y,z,83,0);return;}
 if((id==39 || id==40) && !MC31_Solid(Level_getTile(&s->level,x,y-1,z))){MC32_Pop(s,x,y,z,id,0);return;}
 if(id==78 && !MC35_SnowSurvive(s,x,y,z)){Level_setTileAndData(&s->level,x,y,z,0,0,3);return;}}
Bool MC035_Drops(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta){g35_app=s;
 if(id==79){I32 b=Level_getTile(&s->level,x,y-1,z);if(MC35_MatBlocks(s,b) || MC35_MatLiquid(s,b)){if(!Level_getTile(&s->level,x,y,z))Level_setTileAndData(&s->level,x,y,z,8,0,3);}return TRUE;}
 if(id==246){MC027_DropAt(&s->level,x,y,z,49,1,0);return TRUE;}
 return FALSE;}
I32 MC035_UseOn(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face){g35_app=s;g31_app=s;if(item==NULL || item->count<1)return -1;I32 id=ItemInstance_getId(item);
 if(id==321)return MC35_PlacePainting(s,item,x,y,z,face);
 if(id==261 || id==332 || id==344)return 0;
 if(Level_getTile(&s->level,x,y,z)==73)MC35_RedInteract(s,x,y,z);
 if(id==81 || id==39 || id==40){I32 nx=x,ny=y,nz=z;if(!MC32_Next(s,&nx,&ny,&nz,face))return -1;if(id==81 && !MC35_CactusSurvive(s,nx,ny,nz))return 0;if(id!=81 && !MC35_MushroomSurvive(s,nx,ny,nz))return 0;}
 return -1;}

// ---- NetherReactor + NetherReactorPattern + NetherReactorTileEntity ----
I32 g35_pattern[27]={41,4,41,4,4,4,41,4,41, 4,0,4,0,247,0,4,0,4, 0,4,0,4,4,4,0,4,0};
I32 MC35_PatternAt(I32 layer,I32 j,I32 k){return g35_pattern[9*layer+3*j+k];}
Bool MC35_PatternOk(MCApp028 *s,I32 x,I32 y,I32 z){I32 a,j,k;for(a=0;a<3;a++)for(j=0;j<3;j++)for(k=0;k<3;k++)if(Level_getTile(&s->level,x-1+j,y-1+a,z-1+k)!=MC35_PatternAt(a,j,k))return FALSE;return TRUE;}
U0 MC35_Set(MCApp028 *s,I32 x,I32 y,I32 z,I32 id){if(!Level_InBounds(x,y,z))return;if(Level_getTile(&s->level,x,y,z)==id && !Level_getData(&s->level,x,y,z))return;Level_setTileAndData(&s->level,x,y,z,id,0,3);}
U0 MC35_SetPhase(MCApp028 *s,I32 x,I32 y,I32 z,I32 phase){if(Level_getTile(&s->level,x,y,z)==247 && Level_getData(&s->level,x,y,z)!=phase)Level_setTileAndData(&s->level,x,y,z,247,phase,2);}
MC35Reactor *MC35_React(I32 x,I32 y,I32 z,Bool create){I32 i;for(i=0;i<g35_reactN;i++){MC35Reactor *r=&g35_react[i];if(r->x==x && r->y==y && r->z==z)return r;}if(!create || g35_reactN>=MC35_MAXREACT)return NULL;MC35Reactor *r=&g35_react[g35_reactN++];memset(r,0,sizeof(MC35Reactor));r->x=x;r->y=y;r->z=z;return r;}
Bool MC35_IsEdge(I32 x,I32 y,I32 z){return x==-y || x==y || z==-y || z==y;}
U0 MC35_Floor(MCApp028 *s,I32 x,I32 y,I32 z,I32 r,I32 h,I32 id){I32 a,i,j;for(a=0;a<h;a++)for(i=-r;i<=r;i++)for(j=-r;j<=r;j++)MC35_Set(s,x+i,y+a,z+j,id);}
U0 MC35_Hollow(MCApp028 *s,I32 x,I32 y,I32 z,I32 r,I32 h,I32 wall,I32 fill){I32 a,i,j;for(a=0;a<h;a++)for(i=-r;i<=r;i++)for(j=-r;j<=r;j++){if(i==-r || i==r || j==-r || j==r)MC35_Set(s,x+i,y+a,z+j,wall);else if(a>2 || i<-1 || i>1 || j<-1 || j>1)MC35_Set(s,x+i,y+a,z+j,fill);}}
U0 MC35_Roof(MCApp028 *s,Bool flip,I32 x,I32 y,I32 z,I32 r,I32 h,I32 id){I32 i,j,k;for(i=-r;i<=r;i++)for(j=-r;j<=r;j++){I32 v=i+j;if(flip)v=-i-j;I32 top=v/2+h+r;for(k=0;k<h+r+r;k++)if(top>=k && (MC35_IsEdge(i,r,j) || top==k))MC35_Set(s,x+i,y+k,z+j,id);}}
U0 MC35_RoofDecay(MCApp028 *s,Bool flip,I32 x,I32 y,I32 z,I32 r,I32 h){I32 i,j,k;for(i=-r;i<=r;i++)for(j=-r;j<=r;j++){I32 v=i+j;if(flip)v=-i-j;I32 top=v/2+h+r;for(k=0;k<h+r+r;k++)if(top>=k && MC35_IsEdge(i,r,j) && !(Random_genrand_int32(&s->level.world.random)&3))MC35_Set(s,x+i,y+k,z+j,0);}}
U0 MC35_HollowDecay(MCApp028 *s,I32 x,I32 y,I32 z,I32 r,I32 h){I32 a,i,j;for(a=0;a<h;a++)for(i=-r;i<=r;i++)for(j=-r;j<=r;j++)if((i==-r || i==r || j==-r || j==r) && !(Random_genrand_int32(&s->level.world.random)%3))MC35_Set(s,x+i,y+a,z+j,0);}
U0 MC35_BuildDome(MCApp028 *s,I32 x,I32 y,I32 z){MC35_Floor(s,x,y-3,z,8,2,87);MC35_Hollow(s,x,y-1,z,8,4,87,0);MC35_Floor(s,x,y+3,z,8,1,87);MC35_Roof(s,FALSE,x,y+4,z,8,1,87);MC35_Roof(s,TRUE,x,y+5,z,5,8,87);MC35_Roof(s,FALSE,x,y+11,z,3,14,87);s->lightsDirty=TRUE;}
U0 MC35_DecayDome(MCApp028 *s,I32 x,I32 y,I32 z){MC35_HollowDecay(s,x,y-1,z,8,5);MC35_RoofDecay(s,FALSE,x,y+4,z,8,1);MC35_RoofDecay(s,TRUE,x,y+5,z,5,8);MC35_RoofDecay(s,FALSE,x,y+11,z,3,14);s->lightsDirty=TRUE;}
Bool MC35_NightCheck(){I32 i;for(i=0;i<g35_reactN;i++)if(g35_react[i].init && !g35_react[i].finished)return TRUE;return FALSE;}
U0 MC35_LightItUp(MCApp028 *s,MC35Reactor *r){r->level=0;MC35_SetPhase(s,r->x,r->y,r->z,1);r->init=TRUE;r->finished=FALSE;r->progress=0;MC35_BuildDome(s,r->x,r->y,r->z);g35_nightMode=TRUE;s->unsaved=TRUE;printf("REACTOR035 active at %d,%d,%d\n",r->x,r->y,r->z);}
Bool MC35_PlayersClose(MCApp028 *s,I32 x,I32 y,I32 z){Player *p=MC35_P(s);if(p==NULL)return FALSE;MCBody023 *b=&p->mob.entity.body;F32 fy=p->mob.entity.box.minY;return !(b->x<x-5 || b->x>x+5 || fy<y-1 || fy>y+1 || b->z<z-5 || b->z>z+5);}
Bool MC35_ReactorUse(MCApp028 *s,I32 x,I32 y,I32 z){if(s->creative)return FALSE;
 if(!MC35_PatternOk(s,x,y,z)){MC35_Notice(s,"Not the correct pattern!");return FALSE;}
 if(!MC35_PlayersClose(s,x,y,z)){MC35_Notice(s,"All players need to be close to the reactor.");return FALSE;}
 if(y>100){MC35_Notice(s,"The nether reactor needs to be built lower down.");return FALSE;}
 if(y<=1){MC35_Notice(s,"The nether reactor needs to be built higher up.");return FALSE;}
 MC35Reactor *r=MC35_React(x,y,z,TRUE);if(r==NULL)return FALSE;if(r->init)return FALSE;MC35_Notice(s,"Active!");MC35_LightItUp(s,r);return TRUE;}
Bool MC035_TileUse(MCApp028 *s,I32 x,I32 y,I32 z){g35_app=s;g31_app=s;I32 id=Level_getTile(&s->level,x,y,z);if(id==247)return MC35_ReactorUse(s,x,y,z);if(id==73)MC35_RedInteract(s,x,y,z);return FALSE;}
U0 MC35_ToGlowing(MCApp028 *s,MC35Reactor *r,I32 layer,I32 id){I32 i,k;for(i=-1;i<=1;i++)for(k=-1;k<=1;k++)if(MC35_PatternAt(layer,i+1,k+1)==id)MC35_Set(s,r->x+i,r->y-1+layer,r->z+k,246);s->lightsDirty=TRUE;}
U0 MC35_ToObsidian(MCApp028 *s,MC35Reactor *r,I32 layer){I32 i,k;for(i=-1;i<=1;i++)for(k=-1;k<=1;k++)if(Level_getTile(&s->level,r->x+i,r->y-1+layer,r->z+k)!=247)MC35_Set(s,r->x+i,r->y-1+layer,r->z+k,49);s->lightsDirty=TRUE;}
Bool MC35_LevelChange(I32 v){I32 t[10]={10,13,20,22,25,30,34,36,38,40},i;for(i=0;i<10;i++)if(t[i]==v)return TRUE;return FALSE;}
I32 MC35_ItemsPerLevel(MCApp028 *s,I32 lv){if(!lv)return 9;if(lv<=3)return 15;I32 v;if(lv>7)v=Random_genrand_int32(&s->level.world.random)%27-2;else v=Random_genrand_int32(&s->level.world.random)%42-4;if(v<0)v=0;return v;}
I32 MC35_EnemiesPerLevel(MCApp028 *s,I32 lv){if(!lv)return 3;if(lv<=3)return 2;U32 r=Random_genrand_int32(&s->level.world.random);if(lv<=5)return r&1;return 0;}
U0 MC35_SpawnPos(MCApp028 *s,MC35Reactor *r,F32 *x,F32 *y,F32 *z){I32 n;for(n=0;n<64;n++){F32 d=3+MC35_RF()*4,a=MC35_RF()*6.2832;*x=r->x+sin(a)*d;*z=r->z+cos(a)*d;*y=r->y-1;if(*x>=0 && *z>=0 && *x<256 && *z<256)return;}*x=r->x+0.5;*z=r->z+0.5;*y=r->y-1;}
U0 MC35_SpawnItem(MCApp028 *s,MC35Reactor *r){F32 x,y,z;MC35_SpawnPos(s,r,&x,&y,&z);I32 id=0,n=1;U32 k=Random_genrand_int32(&s->level.world.random)%9;
 if(k==0){id=348;n=3;}else if(k==1)id=362;else if(k==2)id=39;else if(k==3)id=40;else if(k==4)id=338;else if(k==5)id=81;else if(k==6){id=406;n=4;}else if(k==7)id=361;else{I32 low[8]={262,355,352,261,281,288,321,324};id=low[Random_genrand_int32(&s->level.world.random)%8];}
 if(!s->catalog.itemExists[id])return;MC31_Drop(id,0,n,x,y,z,0,0,0,TRUE);}
I32 MC35_PigZombiesNear(MC35Reactor *r){I32 i,n=0;for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(m->kind!=36 || !MC31_Alive(m))continue;MCBody023 *b=&m->e.body;if(b->x>=r->x-7 && b->x<=r->x+8 && b->y>=r->y-7 && b->y<=r->y+8 && b->z>=r->z-7 && b->z<=r->z+8)n++;}return n;}
U0 MC35_TrySpawnPigZombies(MCApp028 *s,MC35Reactor *r,I32 maxN,I32 count){if(!s->level.world.difficulty)return;I32 have=MC35_PigZombiesNear(r);if(have>=maxN)return;I32 i,want=maxN-have;for(i=0;i<count && i!=want;i++){F32 x,y,z;MC35_SpawnPos(s,r,&x,&y,&z);MC31Mob *m=MC31_New(36,x,y,z,MC31_Rand()*360);if(m!=NULL)printf("REACTOR035 pigzombie spawned\n");}}
U0 MC35_Finish(MCApp028 *s,MC35Reactor *r){MC35_SetPhase(s,r->x,r->y,r->z,2);r->finished=TRUE;MC35_DecayDome(s,r->x,r->y,r->z);I32 i,j,k;for(i=r->x-1;i<=r->x+1;i++)for(j=r->y-1;j<=r->y+1;j++)for(k=r->z-1;k<=r->z+1;k++)if(i!=r->x || j!=r->y || k!=r->z)MC35_Set(s,i,j,k,49);g35_nightMode=MC35_NightCheck();s->unsaved=TRUE;printf("REACTOR035 finished at %d,%d,%d\n",r->x,r->y,r->z);}
U0 MC35_ReactorTick(MCApp028 *s,MC35Reactor *r){if(!r->init || r->finished)return;r->progress++;if(!(r->progress%20)){I32 v=r->progress/20;
  if(v<=9){if(v==2)MC35_ToGlowing(s,r,0,4);if(v==3)MC35_ToGlowing(s,r,1,4);if(v==4)MC35_ToGlowing(s,r,2,4);if(v==7)MC35_ToGlowing(s,r,0,41);if(v==8)MC35_ToGlowing(s,r,1,41);if(v==9)MC35_ToGlowing(s,r,2,41);}
  if(v>=43 && v<=45)MC35_ToObsidian(s,r,45-v);
  if(MC35_LevelChange(v)){r->level++;I32 n=MC35_ItemsPerLevel(s,r->level),i;for(i=0;i<n;i++)MC35_SpawnItem(s,r);MC35_TrySpawnPigZombies(s,r,3,MC35_EnemiesPerLevel(s,r->level));printf("REACTOR035 level=%d items=%d\n",r->level,n);}
  s->unsaved=TRUE;}
 if(r->progress>920)MC35_Finish(s,r);}
U0 MC35_Reactors(MCApp028 *s){I32 i,j=0;for(i=0;i<g35_reactN;i++){MC35Reactor *r=&g35_react[i];if(Level_getTile(&s->level,r->x,r->y,r->z)!=247){s->unsaved=TRUE;continue;}MC35_ReactorTick(s,r);g35_react[j++]=*r;}if(j!=g35_reactN){g35_reactN=j;g35_nightMode=MC35_NightCheck();}}
// Level::tick with nightMode: time runs 20x and snaps to dusk (12000) once
U0 MC35_NightTime(MCApp028 *s){if(!g35_nightMode)return;I64 u=s->level.data.time-1,d=u%19200;if(d<0)d+=19200;if(d<12000 && (d+20)>=12000)s->level.data.time=u-d+12000;else s->level.data.time=u+20;}

// ---- per-tick entry ----
Bool g35_stacksFixed;
U0 MC35_FixStacks(MCApp028 *s){if(g35_stacksFixed)return;g35_stacksFixed=TRUE;I32 ids[4]={282,332,344,329},max[4]={1,16,16,1},i;for(i=0;i<4;i++){MCItemDef023 *d=s->catalog.registry.items[ids[i]];if(d!=NULL)d->maxStack=max[i];}}
U0 MC35_DemoTick(MCApp028 *s);
U0 MC35_LiquidTick();
U0 MC35_CamTick(MCApp028 *s);
U0 MC35_RenderCams(MCApp028 *s,F32 pt);
U0 MC35_FallTick(MCApp028 *s);
U0 MC35_RenderFalls(MCApp028 *s,F32 pt);
U0 MC035_Tick(MCApp028 *s){g35_app=s;g31_app=s;MC35_FixStacks(s);MC35_BowTick(s);
 I32 i,j=0;for(i=0;i<g35_throwN;i++){MC35Throw *t=&g35_throw[i];if(!t->removed)MC35_ThrowTick(s,t);if(!t->removed)g35_throw[j++]=*t;}g35_throwN=j;
 MC35_BitsTick(s);MC35_FallTick(s);MC35_ArrowPickup(s);MC35_PaintTick(s);MC35_PlayerEnv(s);MC35_MobEnv(s);
 if(s->leftDown && s->hasHit && Level_getTile(&s->level,s->hit.x,s->hit.y,s->hit.z)==73)MC35_RedInteract(s,s->hit.x,s->hit.y,s->hit.z);
 MC35_Reactors(s);MC35_NightTime(s);MC35_LiquidTick();MC35_CamTick(s);if(s->ticks==3)MC035_Probe(s);if(g35_demo)MC35_DemoTick(s);}

// ---- rendering: PaintingRenderer, ItemSpriteRenderer (snowball/egg), break bits, fire overlay ----
U0 MC35_PaintMesh(I32 w,I32 h,I32 uo,I32 vo){F32 x0b=-w*0.5,y0b=-h*0.5,k=0.0039062;I32 cx,cy,cols=w/16,rows=h/16;
 for(cx=0;cx<cols;cx++)for(cy=0;cy<rows;cy++){F32 x0=x0b+16*cx,x1=x0b+16*(cx+1),y0=y0b+16*cy,y1=y0b+16*(cy+1),uA=(uo+w-16*cx-16)*k,uB=(uo+w-16*cx)*k,vA=(vo+h-16*cy-16)*k,vB=(vo+h-16*cy)*k;
  hcgl028_glTexCoord2f(uA,vB);hcgl028_glVertex3f(x1,y0,-0.5);hcgl028_glTexCoord2f(uB,vB);hcgl028_glVertex3f(x0,y0,-0.5);hcgl028_glTexCoord2f(uB,vA);hcgl028_glVertex3f(x0,y1,-0.5);hcgl028_glTexCoord2f(uA,vA);hcgl028_glVertex3f(x1,y1,-0.5);
  hcgl028_glTexCoord2f(0.75,0);hcgl028_glVertex3f(x1,y1,0.5);hcgl028_glTexCoord2f(0.8125,0);hcgl028_glVertex3f(x0,y1,0.5);hcgl028_glTexCoord2f(0.8125,0.0625);hcgl028_glVertex3f(x0,y0,0.5);hcgl028_glTexCoord2f(0.75,0.0625);hcgl028_glVertex3f(x1,y0,0.5);
  hcgl028_glTexCoord2f(0.75,0.0019531);hcgl028_glVertex3f(x1,y1,-0.5);hcgl028_glTexCoord2f(0.8125,0.0019531);hcgl028_glVertex3f(x0,y1,-0.5);hcgl028_glTexCoord2f(0.8125,0.0019531);hcgl028_glVertex3f(x0,y1,0.5);hcgl028_glTexCoord2f(0.75,0.0019531);hcgl028_glVertex3f(x1,y1,0.5);
  hcgl028_glTexCoord2f(0.75,0.0019531);hcgl028_glVertex3f(x1,y0,0.5);hcgl028_glTexCoord2f(0.8125,0.0019531);hcgl028_glVertex3f(x0,y0,0.5);hcgl028_glTexCoord2f(0.8125,0.0019531);hcgl028_glVertex3f(x0,y0,-0.5);hcgl028_glTexCoord2f(0.75,0.0019531);hcgl028_glVertex3f(x1,y0,-0.5);
  hcgl028_glTexCoord2f(0.75195,0);hcgl028_glVertex3f(x1,y1,0.5);hcgl028_glTexCoord2f(0.75195,0.0625);hcgl028_glVertex3f(x1,y0,0.5);hcgl028_glTexCoord2f(0.75195,0.0625);hcgl028_glVertex3f(x1,y0,-0.5);hcgl028_glTexCoord2f(0.75195,0);hcgl028_glVertex3f(x1,y1,-0.5);
  hcgl028_glTexCoord2f(0.75195,0);hcgl028_glVertex3f(x0,y1,-0.5);hcgl028_glTexCoord2f(0.75195,0.0625);hcgl028_glVertex3f(x0,y0,-0.5);hcgl028_glTexCoord2f(0.75195,0.0625);hcgl028_glVertex3f(x0,y0,0.5);hcgl028_glTexCoord2f(0.75195,0);hcgl028_glVertex3f(x0,y1,0.5);}}
U0 MC35_RenderPaintings(MCApp028 *s){if(!g35_paintN)return;if(!g35_texTried){g35_texTried=TRUE;g35_artTex=MC028_Texture("assets/035/art/kz.png",NULL,NULL);}if(!g35_artTex)return;
 hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,g35_artTex);hcgl028_glDisable(0xB44);I32 i;
 for(i=0;i<g35_paintN;i++){MC35Paint *p=&g35_paint[i];if(p->removed)continue;I32 *m=&g35_mot[p->motive*5];F32 l=MC31_Bright(floorf(p->x),floorf(p->y),floorf(p->z));if(g35_paintSel==i)l=l*0.6+0.4;
  hcgl028_glPushMatrix();hcgl028_glTranslatef(p->x,p->y,p->z);hcgl028_glRotatef(p->yaw,0,1,0);hcgl028_glScalef(0.0625,0.0625,0.0625);hcgl028_glColor4f(l,l,l,1);hcgl028_glBegin(7);MC35_PaintMesh(m[0],m[1],m[2],m[3]);hcgl028_glEnd();hcgl028_glPopMatrix();}
 hcgl028_glEnable(0xB44);hcgl028_glColor4f(1,1,1,1);}
U0 MC35_Sprite(F32 x,F32 y,F32 z,F32 sz,F32 u0,F32 v0,F32 u1,F32 v1,F32 l,F32 *mv){F32 rx=mv[0],ry=mv[4],rz=mv[8],ux=mv[1],uy=mv[5],uz=mv[9];hcgl028_glColor4f(l,l,l,1);
 hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(x-rx*sz-ux*sz,y-ry*sz-uy*sz,z-rz*sz-uz*sz);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(x+rx*sz-ux*sz,y+ry*sz-uy*sz,z+rz*sz-uz*sz);
 hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(x+rx*sz+ux*sz,y+ry*sz+uy*sz,z+rz*sz+uz*sz);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(x-rx*sz+ux*sz,y-ry*sz+uy*sz,z-rz*sz+uz*sz);}
U0 MC35_RenderSprites(MCApp028 *s,F32 pt){if(!g35_throwN && !g35_bitN)return;F32 *mv=s->camera.modelViewMat;I32 i;hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,s->itemTex);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.1);hcgl028_glBegin(7);
 for(i=0;i<g35_throwN;i++){MC35Throw *t=&g35_throw[i];TextureUVCoordinateSet uv;MC029_ItemUV(s,t->item,0,&uv);F32 x=t->px+(t->x-t->px)*pt,y=t->py+(t->y-t->py)*pt,z=t->pz+(t->z-t->pz)*pt;MC35_Sprite(x,y,z,0.25,uv.minX,uv.minY,uv.maxX,uv.maxY,MC31_Bright(floorf(x),floorf(y),floorf(z)),mv);}
 for(i=0;i<g35_bitN;i++){MC35Bit *b=&g35_bit[i];F32 x=b->px+(b->x-b->px)*pt,y=b->py+(b->y-b->py)*pt,z=b->pz+(b->z-b->pz)*pt;MC35_Sprite(x,y,z,b->size,b->u0,b->v0,b->u1,b->v1,MC31_Bright(floorf(x),floorf(y),floorf(z)),mv);}
 hcgl028_glEnd();hcgl028_glColor4f(1,1,1,1);}
U0 MC35_LiquidUpload(MCApp028 *s);
// ---- ItemRenderer::render (ItemEntity): blocks = spinning 3D cubes (scale 0.25), items = camera-facing sprites; 1-4 copies by stack size ----
F32 g35_rnd[16];Bool g35_rndOk=FALSE;
U0 MC35_Dropped(MCApp028 *s,F32 pt){I32 i,k;MC035_AnimMode(s,0);if(!g35_rndOk){for(i=0;i<16;i++){F32 f=MC31_Rand();g35_rnd[i]=f+f-1;}g35_rndOk=TRUE;}Player *pl=MC35_P(s);if(pl==NULL)return;MCBody023 *b=&pl->mob.entity.body;
 hcgl028_glEnable(0xDE1);hcgl028_glEnable(0xBC0);
 for(i=0;i<s->level.drops.size;i++){ItemEntity *d=s->level.drops.data[i];if(d->dead)continue;F32 x=d->prevX+(d->x-d->prevX)*pt,y=d->prevY+(d->y-d->prevY)*pt,z=d->prevZ+(d->z-d->prevZ)*pt,dx=x-b->x,dz=z-b->z;if(dx*dx+dz*dz>4096)continue;
  I32 id=ItemInstance_getId(&d->item),aux=d->item.metadata,cnt=d->item.count,n=1;if(id<1 || id>511 || !s->catalog.itemExists[id])continue;if(cnt>20)n=4;else if(cnt>5)n=3;else if(cnt>1)n=2;
  F32 age=d->ticks+pt,l=MC31_Bright(floorf(x),floorf(y+0.125),floorf(z));hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y+0.125+sin(age/10.0+d->hover)*0.1+0.1,z);
  if(MC33_IsBlock(id)){hcgl028_glRotatef((age/20.0+d->hover)*57.29578,0,1,0);hcgl028_glScalef(0.25,0.25,0.25);F32 o=0.2/0.25;
   for(k=0;k<n;k++){hcgl028_glPushMatrix();if(k)hcgl028_glTranslatef(o*g35_rnd[k*3],o*g35_rnd[k*3+1],o*g35_rnd[k*3+2]);MC33_Block(s,id,aux,l);hcgl028_glPopMatrix();}}
  else{TextureUVCoordinateSet uv;I32 col=-1;if(id<256){MC029_TileUV(s,id,aux,2,&uv);col=MC029_TileColor(id,aux);MC029_Bind(&g29_texTerrain);}else{MC029_ItemUV(s,id,aux,&uv);MC029_Bind(&g29_texItems);}
   F32 r=l,g=l,bl=l;if(col!=-1){r=((col>>16)&255)/255.0*l;g=((col>>8)&255)/255.0*l;bl=(col&255)/255.0*l;}
   hcgl028_glScalef(0.5,0.5,0.5);hcgl028_glRotatef(180-b->yaw,0,1,0);hcgl028_glColor4f(r,g,bl,1);hcgl028_glBegin(7);
   for(k=0;k<n;k++){F32 ox=0,oy=0,oz=0;if(k){ox=g35_rnd[k*3]*0.3;oy=g35_rnd[k*3+1]*0.3;oz=g35_rnd[k*3+2]*0.3;}
    hcgl028_glTexCoord2f(uv.minX,uv.maxY);hcgl028_glVertex3f(-0.5+ox,-0.25+oy,oz);hcgl028_glTexCoord2f(uv.maxX,uv.maxY);hcgl028_glVertex3f(0.5+ox,-0.25+oy,oz);hcgl028_glTexCoord2f(uv.maxX,uv.minY);hcgl028_glVertex3f(0.5+ox,0.75+oy,oz);hcgl028_glTexCoord2f(uv.minX,uv.minY);hcgl028_glVertex3f(-0.5+ox,0.75+oy,oz);}
   hcgl028_glEnd();}
  hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);}
U0 MC035_Render(MCApp028 *s,F32 pt){g35_app=s;g31_app=s;MC35_LiquidUpload(s);MC35_RenderPaintings(s);MC35_RenderSprites(s,pt);MC35_RenderFalls(s,pt);MC35_Dropped(s,pt);MC35_RenderCams(s,pt);hcgl028_glEnable(0xDE1);hcgl028_glColor4f(1,1,1,1);}
// ItemInHandRenderer::renderScreenEffect -> renderFire (first person, while burning)
U0 MC035_Overlay(MCApp028 *s,F32 pt){Player *p=MC35_P(s);if(p==NULL || g29_opt.thirdPerson || g29_opt.hideGui)return;if(p->mob.entity.fire<=0 || p->mob.entity.body.health<=0 || s->creative)return;MC34_FireUpload();if(!g34_fireTex)return;
 hcgl028_glMatrixMode(0x1701);hcgl028_glLoadMatrixf(s->camera.projectionMat);hcgl028_glMatrixMode(0x1700);hcgl028_glLoadIdentity();hcgl028_glDisable(0xB71);hcgl028_glDisable(0xB44);hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,g34_fireTex);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glDisable(0xBC0);hcgl028_glColor4f(1,1,1,0.9);
 I32 i;for(i=0;i<2;i++){F32 sg=i*2-1,u0=0,u1=0.5;hcgl028_glPushMatrix();hcgl028_glTranslatef(-sg*0.24,-0.3,0);hcgl028_glRotatef(sg*10,0,1,0);hcgl028_glBegin(7);
  hcgl028_glTexCoord2f(u1,1);hcgl028_glVertex3f(-0.5,-0.5,-0.5);hcgl028_glTexCoord2f(u0,1);hcgl028_glVertex3f(0.5,-0.5,-0.5);hcgl028_glTexCoord2f(u0,0);hcgl028_glVertex3f(0.5,0.5,-0.5);hcgl028_glTexCoord2f(u1,0);hcgl028_glVertex3f(-0.5,0.5,-0.5);hcgl028_glEnd();hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xB71);hcgl028_glEnable(0xB44);hcgl028_glEnable(0xBC0);}

// ---- world035.dat (magic 'M53D', v2; v1 still loads): paintings (tx,ty,tz,dir,motive) + reactors (x,y,z,progress,level,init,finished) + falling tiles (x,y,z,my,id,meta,time) ----
Bool MC035_Save(MCApp028 *s,U8 *stage){I32 np=0,i,k=0;for(i=0;i<g35_paintN;i++)if(!g35_paint[i].removed)np++;I32 nr=g35_reactN,nf=0;for(i=0;i<g35_fallN;i++)if(!g35_fall[i].removed)nf++;I32 size=28+np*MC35_PREC+nr*MC35_RREC+nf*MC35_FREC;U8 *buf=MC_Alloc(size);memset(buf,0,size);I32 *h=buf(I32*);h[0]=0x4435334D;h[1]=2;h[2]=np;h[3]=nr;h[5]=g35_nightMode;h[6]=nf;
 for(i=0;i<g35_paintN;i++){MC35Paint *p=&g35_paint[i];if(p->removed)continue;I32 *w=(buf+28+k*MC35_PREC)(I32*);w[0]=p->tx;w[1]=p->ty;w[2]=p->tz;w[3]=p->dir;w[4]=p->motive;k++;}
 for(i=0;i<nr;i++){MC35Reactor *r=&g35_react[i];I32 *w=(buf+28+np*MC35_PREC+i*MC35_RREC)(I32*);w[0]=r->x;w[1]=r->y;w[2]=r->z;w[3]=r->progress;w[4]=r->level;w[5]=r->init;w[6]=r->finished;}
 k=0;for(i=0;i<g35_fallN;i++){MC35Fall *f=&g35_fall[i];if(f->removed)continue;U8 *r=buf+28+np*MC35_PREC+nr*MC35_RREC+k*MC35_FREC;F32 *fv=r(F32*);I32 *w=r(I32*);fv[0]=f->x;fv[1]=f->y;fv[2]=f->z;fv[3]=f->my;w[4]=f->id;w[5]=f->meta;w[6]=f->time;k++;}
 h[4]=MC028_Hash(buf,size);MCString path;MCString_FromC(&path,stage);MC025_Append(&path,"/world035.dat");U0 *file=fopen(path.data,"wb");Bool ok=FALSE;if(file){ok=fwrite(buf,1,size,file)==size;if(fclose(file))ok=FALSE;}MCString_Destroy(&path);free(buf);return ok;}
U0 MC035_Clear(){MC036_Clear();g35_camN=0;g35_camSel=-1;g35_shotCam=-1;g35_shooting=FALSE;g35_fallN=0;g35_landed=0;g35_paintN=0;g35_paintSel=-1;g35_throwN=0;g35_bitN=0;g35_reactN=0;g35_using=FALSE;g35_useTicks=0;g35_nightMode=FALSE;g35_shots=0;g35_mobHits=0;g35_pickups=0;}
I32 MC35_Load(MCApp028 *s){MCString path;MCString_FromC(&path,s->activePath);MC025_Append(&path,"/world035.dat");U0 *file=fopen(path.data,"rb");MCString_Destroy(&path);if(!file)return 0;
 if(fseek(file,0,2)){fclose(file);return -1;}I64 size=ftell(file);if(size<24 || size>28+MC35_MAXPAINT*MC35_PREC+MC35_MAXREACT*MC35_RREC+MC35_MAXFALL*MC35_FREC){fclose(file);return -1;}rewind(file);U8 *buf=MC_Alloc(size);Bool ok=fread(buf,1,size,file)==size;fclose(file);if(!ok){free(buf);return -1;}
 I32 *h=buf(I32*);if(h[0]!=0x4435334D || h[1]<1 || h[1]>2 || h[2]<0 || h[2]>MC35_MAXPAINT || h[3]<0 || h[3]>MC35_MAXREACT){free(buf);return -1;}I32 hs=24,nf=0;if(h[1]==2){hs=28;if(size<28){free(buf);return -1;}nf=h[6];if(nf<0 || nf>MC35_MAXFALL){free(buf);return -1;}}if(size!=hs+h[2]*MC35_PREC+h[3]*MC35_RREC+nf*MC35_FREC){free(buf);return -1;}U32 expected=h[4];h[4]=0;if(MC028_Hash(buf,size)!=expected){free(buf);return -1;}
 I32 i;for(i=0;i<h[2];i++){I32 *w=(buf+hs+i*MC35_PREC)(I32*);if(!Level_InBounds(w[0],w[1],w[2]) || w[3]<0 || w[3]>3 || w[4]<0 || w[4]>27){free(buf);MC035_Clear();return -1;}MC35Paint *p=&g35_paint[g35_paintN++];memset(p,0,sizeof(MC35Paint));p->tx=w[0];p->ty=w[1];p->tz=w[2];p->motive=w[4];MC35_SetDir(p,w[3]);}
 for(i=0;i<h[3];i++){I32 *w=(buf+hs+h[2]*MC35_PREC+i*MC35_RREC)(I32*);if(!Level_InBounds(w[0],w[1],w[2]) || w[3]<0 || w[3]>2000 || w[4]<0 || w[4]>20){free(buf);MC035_Clear();return -1;}MC35Reactor *r=&g35_react[g35_reactN++];r->x=w[0];r->y=w[1];r->z=w[2];r->progress=w[3];r->level=w[4];r->init=w[5]!=0;r->finished=w[6]!=0;}
 for(i=0;i<nf;i++){U8 *r=buf+hs+h[2]*MC35_PREC+h[3]*MC35_RREC+i*MC35_FREC;F32 *fv=r(F32*);I32 *w=r(I32*);if(!(fv[0]>=0 && fv[0]<=256 && fv[1]>-64 && fv[1]<300 && fv[2]>=0 && fv[2]<=256 && fabs(fv[3])<=10) || (w[4]!=12 && w[4]!=13) || w[5]<0 || w[5]>15){free(buf);MC035_Clear();return -1;}MC35Fall *f=&g35_fall[g35_fallN++];memset(f,0,sizeof(MC35Fall));f->x=fv[0];f->y=fv[1];f->py=fv[1];f->z=fv[2];f->my=fv[3];f->id=w[4];f->meta=w[5];f->time=w[6];}
 g35_nightMode=MC35_NightCheck();free(buf);return 1;}
U0 MC35_Demo(MCApp028 *s);
Bool MC035_Start(MCApp028 *s,I32 active){MC035_Clear();g35_app=s;g035_multi.f=&MC35_MultiHook;g31_app=s;g35_stacksFixed=FALSE;MC35_FixStacks(s);if(active==1){I32 r=MC35_Load(s);if(r<0)return FALSE;if(r==1)printf("WORLD035 loaded paintings=%d reactors=%d night=%d\n",g35_paintN,g35_reactN,g35_nightMode);if(r==0)MC35_ImportNBT(s);}MC35_Demo(s);return TRUE;}

// ---- MCPE_DEMO035=b|p|r|e : scripted scenes on a COPY of a world (testing aid) ----
I32 g35_gx,g35_gy,g35_gz,g35_hp0;
U0 MC35_Demo(MCApp028 *s){U8 *v=C31_getenv("MCPE_DEMO035");g35_demo=0;if(!v)return;g35_demo=v[0];printf("DEMO035 mode=%c\n",g35_demo);}
U0 MC35_DSet(MCApp028 *s,I32 dx,I32 dy,I32 dz,I32 id){Level_setTileAndData(&s->level,g35_gx+dx,g35_gy+dy,g35_gz+dz,id,0,3);}
U0 MC35_DHold(MCApp028 *s,I32 id,I32 count){Player *pl=MC35_P(s);Inventory *inv=&pl->inventory;I32 i;if(MC028_Count(s,id)<1)MC028_Give(s,id,count,0);for(i=9;i<inv->size;i++){ItemInstance *it=inv->items[i];if(it!=NULL && it->count>0 && ItemInstance_getId(it)==id){Inventory_moveToSelectedSlot(inv,i);return;}}}
U0 MC35_DLook(MCApp028 *s,F32 yaw,F32 pitch){Player *pl=MC35_P(s);MCBody023 *b=&pl->mob.entity.body;b->yaw=yaw;b->prevYaw=yaw;b->pitch=pitch;b->prevPitch=pitch;}
U0 MC35_DemoTick(MCApp028 *s){Player *p=MC35_P(s);if(p==NULL)return;MCBody023 *b=&p->mob.entity.body;I32 t=s->ticks,mode=g35_demo,dx,dy,dz;
 if(t==5){g35_gx=floorf(b->x);g35_gz=floorf(b->z);g35_gy=floorf(p->mob.entity.box.minY)-1;if(g35_gy>90)g35_gy=90;
  for(dx=-10;dx<=10;dx++)for(dz=-10;dz<=12;dz++){for(dy=-2;dy<=0;dy++)MC35_DSet(s,dx,dy,dz,1);MC35_DSet(s,dx,0,dz,2);for(dy=1;dy<=8;dy++)MC35_DSet(s,dx,dy,dz,0);}
  Entity_moveTo(&p->mob.entity,g35_gx+0.5,g35_gy+1+1.62,g35_gz+0.5,0,0);b->prevX=b->x;b->prevY=b->y;b->prevZ=b->z;b->motionX=0;b->motionY=0;b->motionZ=0;s->level.data.time=(s->level.data.time/19200)*19200+4800;s->lightsDirty=TRUE;
  if(mode=='b'){MC31Mob *c=MC31_New(11,g35_gx+0.5,g35_gy+1,g35_gz+7.5,180);if(c!=NULL)c->noAction=1000;MC31_New(11,g35_gx+3.5,g35_gy+1,g35_gz+5.5,180);MC028_Give(s,262,8,0);MC35_DHold(s,261,1);printf("DEMO035 bow scene\n");}
  if(mode=='p'){for(dx=-4;dx<=4;dx++)for(dy=1;dy<=5;dy++){I32 wid=5;if(dx==4)wid=17;MC35_DSet(s,dx,dy,3,wid);}I32 n=0;MC028_Give(s,321,6,0);MC35_DHold(s,321,6);ItemInstance *it=Inventory_getSelected(&p->inventory);
   I32 at[6]={-3,2,-1,3,1,3},k;for(k=0;k<3;k++){if(it!=NULL && MC035_UseOn(s,it,g35_gx+at[k*2],g35_gy+at[k*2+1],g35_gz+3,2)==1)n++;}
   printf("TEST035 paintings-placed=%d/3 now=%d\n",g35_paintN,n);for(k=0;k<g35_paintN;k++)printf("TEST035 painting %d motive=%s %dx%d\n",k,g35_motName[g35_paint[k].motive],g35_mot[g35_paint[k].motive*5],g35_mot[g35_paint[k].motive*5+1]);}
  if(mode=='r'){I32 a,j,k;MC35_DSet(s,0,2,4,247);for(a=0;a<3;a++)for(j=0;j<3;j++)for(k=0;k<3;k++)if(MC35_PatternAt(a,j,k)!=247)MC35_DSet(s,j-1,1+a,3+k,MC35_PatternAt(a,j,k));
   MC35_DSet(s,0,2,3,4);Bool bad=MC035_TileUse(s,g35_gx,g35_gy+2,g35_gz+4);MC35_DSet(s,0,2,3,0);printf("TEST035 reactor-wrong-pattern-refused=%d\n",!bad);MC35_DLook(s,0,10);}
  if(mode=='d'){I32 ids[10]={1,2,50,37,264,276,6,18,54,53},cn[10]={1,10,1,3,30,1,1,64,1,6},k;for(k=0;k<10;k++)MC31_Drop(ids[k],0,cn[k],g35_gx+0.5+(k%5)-2,g35_gy+1.1,g35_gz+2.5+(k/5)*1.2,0,0,0,FALSE);MC35_DLook(s,0,30);printf("DEMO035 drops scene n=%d\n",s->level.drops.size);}
  if(mode=='w'){for(dx=-12;dx<=12;dx++)for(dz=-12;dz<=14;dz++)for(dy=1;dy<=30;dy++)MC35_DSet(s,dx,dy,dz,0);MC35_DSet(s,-2,1,5,9);MC35_DSet(s,0,1,7,4);MC35_DSet(s,0,2,7,4);MC35_DSet(s,0,3,7,9);MC35_DSet(s,4,1,5,11);MC35_DLook(s,0,25);printf("DEMO035 liquids scene\n");}
  if(mode=='c'){MC028_Give(s,347,1,0);MC028_Give(s,456,1,0);MC35_DHold(s,345,1);MC35_DLook(s,0,10);printf("DEMO035 camera scene compass-frame=%d clock-frame=%d\n",MC035_CompassFrame(s),MC035_ClockFrame(s));}
  if(mode=='h'){MC35_DHold(s,261,1);MC028_Give(s,262,8,0);MC35_DLook(s,0,0);}
  if(mode=='e'){g35_hp0=b->health;MC35_DSet(s,0,1,0,51);printf("DEMO035 env scene hp=%d\n",b->health);}}
 if(mode=='s')MC35_StairDemo(s,t);
 if(mode=='k'){if(t==6){MC35_DSet(s,0,1,2,3);MC35_DSet(s,1,1,2,1);MC35_DSet(s,-1,1,2,18);MC35_DLook(s,0,30);}if(t>8 && t<200)s->leftDown=TRUE;if(t==40)printf("TEST036 particles=%d progress=%d\n",g36_n,(s->minecraft.survival.progress*100)(I32));}
 if(mode=='b'){if(t==10){MC35_DLook(s,0,0);MC35_StartBow(s);}if(t==35){printf("TEST035 bow-frame-at-full=%d\n",MC035_BowFrame());MC35_Release(s);}
  if(t==60){printf("TEST035 bow-hits=%d arrows-left=%d\n",g35_mobHits,MC028_Count(s,262));MC35_DLook(s,0,89);MC35_StartBow(s);}if(t==66)MC35_Release(s);
  if(t==120){printf("TEST035 arrow-pickup=%d arrows=%d\n",g35_pickups,MC028_Count(s,262));MC028_Give(s,332,4,0);MC35_DHold(s,332,4);MC35_DLook(s,30,5);MC035_UseHeld(s,Inventory_getSelected(&p->inventory));MC028_Give(s,344,16,0);MC35_DHold(s,344,16);}
  if(t>=125 && t<141){MC35_DLook(s,0,3);s->placeCooldown=0;MC035_UseHeld(s,Inventory_getSelected(&p->inventory));}
  if(t==200){I32 k,chicks=0;for(k=0;k<g31_mobN;k++)if(MC31_Alive(g31_mobs[k]) && g31_mobs[k]->kind==10)chicks++;printf("TEST035 throws=%d chickens=%d snowballs-left=%d\n",g35_shots,chicks,MC028_Count(s,332));MC35_DLook(s,0,0);MC35_DHold(s,261,1);MC35_StartBow(s);}}
 if(mode=='p'){if(t==30){MC35_DLook(s,0,0);}if(t==60){MC35_DSet(s,1,3,3,0);printf("DEMO035 broke wall behind painting\n");}
  if(t==200){I32 k,alive=0;for(k=0;k<g35_paintN;k++)if(!g35_paint[k].removed)alive++;printf("TEST035 paintings-after-wall-break=%d\n",alive);}}
 if(mode=='r'){if(t==8){Bool ok=MC035_TileUse(s,g35_gx,g35_gy+2,g35_gz+4);printf("TEST035 reactor-activated=%d night=%d\n",ok,g35_nightMode);}
  if(t>8 && t<600 && g35_reactN>0){I32 k;for(k=0;k<3;k++)MC35_Reactors(s);}
  if(t==120)printf("TEST035 reactor-glowing=%d progress=%d\n",Level_getTile(&s->level,g35_gx-1,g35_gy+1,g35_gz+3)==246,g35_react[0].progress);
  if(t==400){I32 a,j,k,obs=0;for(a=0;a<3;a++)for(j=0;j<3;j++)for(k=0;k<3;k++)if(Level_getTile(&s->level,g35_gx-1+j,g35_gy+1+a,g35_gz+3+k)==49)obs++;I32 pz=0;for(k=0;k<g31_mobN;k++)if(MC31_Alive(g31_mobs[k]) && g31_mobs[k]->kind==36)pz++;
   printf("TEST035 reactor-finished=%d obsidian-shell=%d/26 phase=%d night=%d pigzombies=%d\n",g35_reactN>0 && g35_react[0].finished,obs,Level_getData(&s->level,g35_gx,g35_gy+2,g35_gz+4),g35_nightMode,pz);}}
 if(mode=='h' && t==10)MC35_StartBow(s);
 if(mode=='c'){if(t==10){MC35_CamAdd(s);MC35_DLook(s,0,10);Entity_moveTo(&p->mob.entity,g35_gx+0.5,g35_gy+1+1.62,g35_gz-2.5,0,0);b->prevX=b->x;b->prevY=b->y;b->prevZ=b->z;printf("TEST035 cameras=%d\n",g35_camN);}
  if(t==12 && g35_camN>0){g35_cam[0].armed=TRUE;MC35_DSet(s,0,1,6,57);MC35_DSet(s,-2,1,6,41);}
  if(t==40)printf("TEST035 compass-frame=%d clock-frame=%d spawn=%d,%d\n",MC035_CompassFrame(s),MC035_ClockFrame(s),s->level.data.xSpawn,s->level.data.zSpawn);
  if(t==300 && C31_getenv("MCPE_DEMO035INV"))g29_invRequest=TRUE;
  if(t==100){printf("TEST035 photos=%d camera-removed=%d\n",g35_photos,g35_camN>0 && g35_cam[0].removed);}}
 if(mode=='w' && t==200){I32 lv=0,wt=0;for(dx=-10;dx<=10;dx++)for(dz=-10;dz<=12;dz++){I32 q=Level_getTile(&s->level,g35_gx+dx,g35_gy+1,g35_gz+dz);if(q==10 || q==11)lv++;if(q==8 || q==9)wt++;}printf("TEST035 lava-cells=%d water-cells=%d\n",lv,wt);}
 if(mode=='e'){if(t==60){printf("TEST035 fire-damage=%d burning=%d\n",g35_hp0-b->health,p->mob.entity.fire);MC35_DSet(s,0,1,0,0);MC35_DSet(s,0,0,0,9);}
  if(t==62)printf("TEST035 water-extinguish fire=%d\n",p->mob.entity.fire);
  if(t==70){MC35_DSet(s,0,0,0,2);Entity_moveTo(&p->mob.entity,g35_gx+0.5,g35_gy+1+1.62,g35_gz+0.5,0,0);b->motionY=0;b->health=20;g35_hp0=20;for(dx=-1;dx<=1;dx++)for(dz=-1;dz<=1;dz++)MC35_DSet(s,dx,2,dz,1);}
  if(t==110){printf("TEST035 suffocation-damage=%d\n",g35_hp0-b->health);Entity_moveTo(&p->mob.entity,g35_gx+0.5,g35_gy+1+1.62,g35_gz+0.5,0,0);b->motionY=0;for(dx=-1;dx<=1;dx++)for(dz=-1;dz<=1;dz++)MC35_DSet(s,dx,2,dz,0);b->health=20;MC35_DSet(s,1,0,0,12);MC35_DSet(s,1,1,0,81);Entity_moveTo(&p->mob.entity,g35_gx+0.69,g35_gy+1+1.62,g35_gz+0.5,0,0);b->motionX=0.2;}
  if(t==112)printf("TEST035 cactus-placed=%d\n",Level_getTile(&s->level,g35_gx+1,g35_gy+1,g35_gz)==81);
  if(t>112 && t<130)b->motionX=0.1;
  if(t==150){printf("TEST035 cactus-damage=%d\n",20-b->health);b->health=20;MC35_DSet(s,1,1,1,4);printf("TEST035 cactus-pops-next-to-block=%d\n",Level_getTile(&s->level,g35_gx+1,g35_gy+1,g35_gz)==0);
   MC35_DSet(s,-2,1,2,79);MC35_DSet(s,-2,1,3,50);
   MC35_DSet(s,2,1,2,73);MC35_RedInteract(s,g35_gx+2,g35_gy+1,g35_gz+2);printf("TEST035 redstone-lit=%d\n",Level_getTile(&s->level,g35_gx+2,g35_gy+1,g35_gz+2)==74);MC035_RandomTick(s,g35_gx+2,g35_gy+1,g35_gz+2);printf("TEST035 redstone-unlit=%d\n",Level_getTile(&s->level,g35_gx+2,g35_gy+1,g35_gz+2)==73);
   MC35_DSet(s,-3,1,-2,4);MC35_DSet(s,-3,2,-2,39);MC35_DSet(s,-3,1,-2,0);printf("TEST035 mushroom-pops=%d\n",Level_getTile(&s->level,g35_gx-3,g35_gy+2,g35_gz-2)==0);
   MC35_DSet(s,0,1,0,51);MC35_DSet(s,4,1,-3,50);MC35_DSet(s,3,6,-3,12);MC35_DSet(s,4,6,-3,13);}
  if(t==160)printf("TEST035 falling-entities=%d\n",g35_fallN);
  if(t==230)printf("TEST035 sand-landed=%d gravel-on-torch-dropped=%d torch=%d falls=%d\n",Level_getTile(&s->level,g35_gx+3,g35_gy+1,g35_gz-3)==12,Level_getTile(&s->level,g35_gx+4,g35_gy+2,g35_gz-3)!=13,Level_getTile(&s->level,g35_gx+4,g35_gy+1,g35_gz-3),g35_fallN);
  if(t==175){MC035_RandomTick(s,g35_gx-2,g35_gy+1,g35_gz+2);{I32 w=Level_getTile(&s->level,g35_gx-2,g35_gy+1,g35_gz+2);printf("TEST035 ice-melts-by-torch=%d light=%d\n",w==8 || w==9,MC35_BlockLight(s,g35_gx-2,g35_gy+1,g35_gz+2));}}}}

// ---- WaterTexture / LavaTexture (DynamicTexture, Textures::tick -> glTexSubImage2D into the terrain atlas) ----
F32 g35_wCur[256],g35_wNext[256],g35_wHeat[256],g35_wHeatA[256],g35_lCur[256],g35_lNext[256],g35_lHeat[256],g35_lHeatA[256];U8 g35_wPix[1024],g35_lPix[1024];Bool g35_liqDirty;
U32 g35_fast=0x2545F491;
Bool MC35_Chance(U32 limit){g35_fast=g35_fast*1664525+1013904223;return g35_fast<=limit;}
U0 MC35_WaterTick(){I32 i,j,k;for(i=0;i<256;i+=16)for(j=0;j<16;j++){F32 v=0;for(k=j-1;k<=j+1;k++)v+=g35_wCur[(k&15)+i];g35_wNext[j+i]=v/3.3+g35_wHeat[j+i]*0.8;}
 for(i=0;i<256;i++){g35_wHeat[i]+=g35_wHeatA[i]*0.05;if(g35_wHeat[i]<0)g35_wHeat[i]=0;g35_wHeatA[i]-=0.1;if(MC35_Chance(0xCCCCCCC))g35_wHeatA[i]=0.5;}
 for(i=0;i<256;i++){F32 t=g35_wNext[i];g35_wNext[i]=g35_wCur[i];g35_wCur[i]=t;F32 v=t;if(v>1)v=1;if(v<0)v=0;v=v*v;g35_wPix[i*4]=32+v*32;g35_wPix[i*4+1]=50+v*64;g35_wPix[i*4+2]=255;g35_wPix[i*4+3]=146+v*50;}}
U0 MC35_LavaTick(){I32 x,y,a,b;for(y=0;y<16;y++){I32 row=16*y,up=16*((y+1)&15);F32 sy=sin(y*MC31_PI*2/16)*1.2;
  for(x=0;x<16;x++){F32 sx=sin(x*MC31_PI*2/16)*1.2;I32 ox=sy,oy=sx;F32 v=0;for(b=y-1;b<=y+1;b++)for(a=x-1;a<=x+1;a++)v+=g35_lCur[16*((b+oy)&15)+((a+ox)&15)];I32 i=row+x,xn=(x+1)&15;
   g35_lNext[i]=v/10+(g35_lHeat[i]+g35_lHeat[xn+row]+g35_lHeat[xn+up]+g35_lHeat[x+up])*0.25*0.8;g35_lHeat[i]+=g35_lHeatA[i]*0.01;if(g35_lHeat[i]<0)g35_lHeat[i]=0;g35_lHeatA[i]-=0.06;if(MC35_Chance(0x147AE14))g35_lHeatA[i]=1.5;}}
 I32 i;for(i=0;i<256;i++){F32 t=g35_lNext[i];g35_lNext[i]=g35_lCur[i];g35_lCur[i]=t;F32 v=t*2;if(v>1)v=1;if(v<0)v=0;g35_lPix[i*4]=155+v*100;g35_lPix[i*4+1]=v*v*255;g35_lPix[i*4+2]=v*v*v*v*128;g35_lPix[i*4+3]=255;}}
// WaterSideTexture / LavaSideTexture (flowing_water / flowing_lava, replicate 2 -> 32x32 upload)
F32 g35_sCur[256],g35_sNext[256],g35_sHeat[256],g35_sHeatA[256],g35_mCur[256],g35_mNext[256],g35_mHeat[256],g35_mHeatA[256];U8 g35_sPix[1024],g35_mPix[1024],g35_rep[4096];I32 g35_sideT=0;
U0 MC35_WaterSideTick(){I32 i,j,k;for(i=0;i<16;i++)for(j=0;j<16;j++){F32 v=0;for(k=i-2;k<=i;k++)v+=g35_sCur[16*(k&15)+j];g35_sNext[j+16*i]=v/3.2+g35_sHeat[j+16*i]*0.8;}
 for(i=0;i<256;i++){g35_sHeat[i]+=g35_sHeatA[i]*0.05;if(g35_sHeat[i]<0)g35_sHeat[i]=0;g35_sHeatA[i]-=0.3;if(MC35_Chance(0x33333332))g35_sHeatA[i]=0.5;}
 for(i=0;i<256;i++){F32 t=g35_sNext[i];g35_sNext[i]=g35_sCur[i];g35_sCur[i]=t;}
 for(i=0;i<256;i++){F32 v=g35_sCur[(i-16*g35_sideT)&255];if(v>1)v=1;if(v<0)v=0;v=v*v;g35_sPix[i*4]=32+v*32;g35_sPix[i*4+1]=50+v*64;g35_sPix[i*4+2]=255;g35_sPix[i*4+3]=146+v*50;}}
U0 MC35_LavaSideTick(){I32 x,y,a,b;for(y=0;y<16;y++){I32 row=16*y,up=16*((y+1)&15);F32 sy=sin(y*MC31_PI*2/16)*1.2;
  for(x=0;x<16;x++){F32 sx=sin(x*MC31_PI*2/16)*1.2;I32 ox=sy,oy=sx;F32 v=0;for(b=y-1;b<=y+1;b++)for(a=x-1;a<=x+1;a++)v+=g35_mCur[16*((b+oy)&15)+((a+ox)&15)];I32 i=row+x,xn=(x+1)&15;
   g35_mNext[i]=v/10+(g35_mHeat[i]+g35_mHeat[xn+row]+g35_mHeat[xn+up]+g35_mHeat[x+up])*0.25*0.8;g35_mHeat[i]+=g35_mHeatA[i]*0.01;if(g35_mHeat[i]<0)g35_mHeat[i]=0;g35_mHeatA[i]-=0.06;if(MC35_Chance(0x147AE14))g35_mHeatA[i]=1.5;}}
 I32 i,off=16*(g35_sideT/3);for(i=0;i<256;i++){F32 t=g35_mNext[i];g35_mNext[i]=g35_mCur[i];g35_mCur[i]=t;}
 for(i=0;i<256;i++){F32 v=g35_mCur[(i-off)&255]*2;if(v>1)v=1;if(v<0)v=0;g35_mPix[i*4]=155+v*100;g35_mPix[i*4+1]=v*v*255;g35_mPix[i*4+2]=v*v*v*v*128;g35_mPix[i*4+3]=255;}}
U0 MC35_Rep2(U8 *pix){I32 r;for(r=0;r<32;r++){MemCpy(g35_rep+r*128,pix+(r&15)*64,64);MemCpy(g35_rep+r*128+64,pix+(r&15)*64,64);}}
U0 MC35_LiquidTick(){MC35_WaterTick();MC35_LavaTick();g35_sideT++;MC35_WaterSideTick();MC35_LavaSideTick();MC35_FireTexTick();g35_liqDirty=TRUE;}
U0 MC35_LiquidUpload(MCApp028 *s){if(!g35_liqDirty || !s->terrainTex)return;g35_liqDirty=FALSE;TextureUVCoordinateSet uv;hcgl028_glBindTexture(0xDE1,s->terrainTex);
 MC028_UV(&uv,s->catalog.texIndex[9],0);G35_TexSubImage2D(0xDE1,0,uv.minX*uv.width+0.5,uv.minY*uv.height+0.5,16,16,0x1908,0x1401,g35_wPix);
 MC028_UV(&uv,s->catalog.texIndex[11],0);G35_TexSubImage2D(0xDE1,0,uv.minX*uv.width+0.5,uv.minY*uv.height+0.5,16,16,0x1908,0x1401,g35_lPix);
 MC35_Rep2(g35_sPix);MC028_UV(&uv,143,0);G35_TexSubImage2D(0xDE1,0,uv.minX*uv.width+0.5,uv.minY*uv.height+0.5,32,32,0x1908,0x1401,g35_rep);
 MC35_Rep2(g35_mPix);MC028_UV(&uv,144,0);G35_TexSubImage2D(0xDE1,0,uv.minX*uv.width+0.5,uv.minY*uv.height+0.5,32,32,0x1908,0x1401,g35_rep);MC35_FireTexUpload(s);}

// ---- TileRenderer::tesselateWaterInWorld + getWaterHeight + LiquidTile::getFlow/getSlopeAngle ----
I32 MC35_LMat(I32 id){if(id==8 || id==9)return 1;if(id==10 || id==11)return 2;return 0;}
F32 MC35_WaterHeight(MCApp028 *s,I32 x,I32 y,I32 z,I32 mat){F32 h=0;I32 n=0,i;for(i=0;i<4;i++){I32 xx=x-(i&1),zz=z-(i>>1);if(MC35_LMat(Level_getTile(&s->level,xx,y+1,zz))==mat)return 1;I32 t=Level_getTile(&s->level,xx,y,zz);
  if(MC35_LMat(t)==mat){I32 d=Level_getData(&s->level,xx,y,zz);if(d>7 || d==0){h+=1.1111;n+=10;if(d>7)d=0;}h+=(d+1)/9.0;n++;}else if(!MC35_MatSolid(s,t)){h+=1;n++;}}
 return 1-h/n;}
I32 MC35_LDepth(MCApp028 *s,I32 x,I32 y,I32 z,I32 mat){if(MC35_LMat(Level_getTile(&s->level,x,y,z))!=mat)return -1;I32 d=Level_getData(&s->level,x,y,z);if(d>=8)d=0;return d;}
F32 MC35_SlopeAngle(MCApp028 *s,I32 x,I32 y,I32 z,I32 mat){F32 fx=0,fz=0;I32 mid=MC35_LDepth(s,x,y,z,mat),d;I32 ddx[4]={-1,0,1,0},ddz[4]={0,-1,0,1};
 for(d=0;d<4;d++){I32 xt=x+ddx[d],zt=z+ddz[d],t=MC35_LDepth(s,xt,y,zt,mat);
  if(t<0){if(!MC35_MatBlocks(s,Level_getTile(&s->level,xt,y,zt))){t=MC35_LDepth(s,xt,y-1,zt,mat);if(t>=0){I32 dir=t-(mid-8);fx+=ddx[d]*dir;fz+=ddz[d]*dir;}}}
  else{I32 dir=t-mid;fx+=ddx[d]*dir;fz+=ddz[d]*dir;}}
 if(fx==0 && fz==0)return -1000;return atan2(fz,fx)-MC31_PI/2;}
F32 MC35_LBright(MCApp028 *s,I32 id,I32 x,I32 y,I32 z){if(id==10 || id==11)return 1;F32 a=MC028_Brightness(s,x,y,z),b=MC028_Brightness(s,x,y+1,z);if(b>a)return b;return a;}
Bool MC35_LFace(MCApp028 *s,MCRenderTile027 *v,I32 mat,I32 x,I32 y,I32 z,I32 face){I32 o=Level_getTile(&s->level,x,y,z);if(MC35_LMat(o)==mat)return FALSE;if(face==1)return TRUE;return MC028_FaceVisible(s,v,x,y,z,face);}
U0 MC035_TessLiquid(MCApp028 *s,MCRenderTile027 *v,I32 id,I32 meta,I32 x,I32 y,I32 z){I32 mat=MC35_LMat(id),i;TileRenderer *r=&s->tiler;
 Bool up=MC35_LFace(s,v,mat,x,y+1,z,1),dn=MC35_LFace(s,v,mat,x,y-1,z,0),sd[4];sd[0]=MC35_LFace(s,v,mat,x,y,z-1,2);sd[1]=MC35_LFace(s,v,mat,x,y,z+1,3);sd[2]=MC35_LFace(s,v,mat,x-1,y,z,4);sd[3]=MC35_LFace(s,v,mat,x+1,y,z,5);
 if(!up && !dn && !sd[0] && !sd[1] && !sd[2] && !sd[3])return;
 TextureUVCoordinateSet still,flow;MC028_UV(&still,s->catalog.texIndex[id],0);I32 ft=143;if(mat==2)ft=144;MC028_UV(&flow,ft,0);
 F32 h00,h01,h11,h10;h00=MC35_WaterHeight(s,x,y,z,mat);h01=MC35_WaterHeight(s,x,y,z+1,mat);h11=MC35_WaterHeight(s,x+1,y,z+1,mat);h10=MC35_WaterHeight(s,x+1,y,z,mat);
 if(up){F32 u0=still.minX,v0=still.minY,u1=still.maxX,v1=still.maxY,ang=MC35_SlopeAngle(s,x,y,z,mat);if(ang>-999){u0=flow.minX;v0=flow.minY;u1=flow.maxX;v1=flow.maxY;}
  h00-=0.001;h01-=0.001;h11-=0.001;h10-=0.001;F32 au,av,bu,bv,cu,cv,du,dv;
  if(ang<-999){au=u0;av=v0;bu=u0;bv=v1;cu=u1;cv=v1;du=u1;dv=v0;}
  else{F32 w=u1-u0,hh=v1-v0,sn=sin(ang)*0.5,cs=cos(ang)*0.5,k39=(1-cs)-sn,k41=(1-cs)+sn,k44=(1+cs)+sn,k45=(1+cs)-sn;
   au=u0+k39*w;av=v0+k41*hh;bu=u0+k41*w;bv=v0+k44*hh;cu=u0+k44*w;cv=v0+k45*hh;du=u0+k45*w;dv=v0+k39*hh;}
  F32 l=MC35_LBright(s,id,x,y,z);MC027_Color(r,l,l,l);
  MC027_Vertex(r,x,y+h00,z,au,av);MC027_Vertex(r,x,y+h01,z+1,bu,bv);MC027_Vertex(r,x+1,y+h11,z+1,cu,cv);MC027_Vertex(r,x+1,y+h10,z,du,dv);}
 if(dn){F32 l=MC35_LBright(s,id,x,y-1,z)*0.5;MC027_Color(r,l,l,l);F32 sv=v->maxY;v->maxY=1;TileRenderer_renderFaceDown(r,v,x,y,z,&still);v->maxY=sv;}
 for(i=0;i<4;i++){if(!sd[i])continue;I32 nx=x,nz=z;F32 ax,az,bx,bz,ha,hb;
  if(i==0){nz=z-1;az=z+0.001;bz=az;ax=x;bx=x+1;hb=h10;ha=h00;}
  else if(i==1){nz=z+1;az=z+1-0.001;bz=az;ax=x+1;bx=x;hb=h01;ha=h11;}
  else if(i==2){nx=x-1;ax=x+0.001;bx=ax;az=z+1;bz=z;hb=h00;ha=h01;}
  else{nx=x+1;ax=x+1-0.001;bx=ax;az=z;bz=z+1;hb=h11;ha=h10;}
  F32 H=flow.maxY-flow.minY,va=flow.minY+(1-ha)*H,vb=flow.minY+(1-hb)*H,l=MC35_LBright(s,id,nx,y,nz);if(i>1)l*=0.6;else l*=0.8;MC027_Color(r,l,l,l);
  MC027_Vertex(r,ax,y+ha,az,flow.minX,va);MC027_Vertex(r,bx,y+hb,bz,flow.maxX,vb);MC027_Vertex(r,bx,y,bz,flow.maxX,flow.maxY);MC027_Vertex(r,ax,y,az,flow.minX,flow.maxY);}}


// ---- FallingTile: sand / gravel fall as entities (tick, land or drop, render as a block) ----
Bool MC035_Fall(MCApp028 *s,I32 x,I32 y,I32 z,I32 id){if(g35_fallN>=MC35_MAXFALL || !s->worldReady)return FALSE;I32 i;for(i=0;i<g35_fallN;i++){MC35Fall *o=&g35_fall[i];if(!o->removed && floorf(o->x)==x && floorf(o->z)==z && fabs(o->y-(y+0.5))<1)return TRUE;}
 MC35Fall *f=&g35_fall[g35_fallN++];memset(f,0,sizeof(MC35Fall));f->x=x+0.5;f->y=y+0.5;f->z=z+0.5;f->py=f->y;f->id=id;f->meta=Level_getData(&s->level,x,y,z);Level_setTileAndData(&s->level,x,y,z,0,0,3);f->time=1;s->unsaved=TRUE;return TRUE;}
Bool MC35_FallBlocks(I32 id){if(!id || MC35_FallFree(id))return FALSE;if(id==31 || id==32 || id==37 || id==38 || id==39 || id==40 || id==50 || id==6 || id==59 || id==83 || id==78 || id==55 || id==66 || id==27 || id==28 || id==141 || id==142 || id==244 || id==104 || id==105 || id==63 || id==68 || id==65 || id==106)return FALSE;return TRUE;}
Bool MC35_Replaceable(I32 id){return MC35_FallFree(id) || id==31 || id==32 || id==78;}
U0 MC35_FallTick(MCApp028 *s){I32 i,j=0;for(i=0;i<g35_fallN;i++){MC35Fall *f=&g35_fall[i];if(f->removed)continue;f->py=f->y;f->time++;f->my-=0.04;F32 bottom=f->y-0.49,nb=bottom+f->my;I32 bx=floorf(f->x),bz=floorf(f->z);Bool ground=FALSE;
  I32 c=floorf(nb);if(nb<0){ground=TRUE;nb=0;}else if(c<floorf(bottom+0.0001) && MC35_FallBlocks(Level_getTile(&s->level,bx,c,bz))){nb=c+1;ground=TRUE;}
  f->y=nb+0.49;f->my*=0.98;
  if(ground){I32 cy=floorf(f->y);f->removed=TRUE;I32 here=Level_getTile(&s->level,bx,cy,bz);if(Level_InBounds(bx,cy,bz) && MC35_Replaceable(here)){Level_setTileAndData(&s->level,bx,cy,bz,f->id,f->meta,3);g35_landed++;}else MC31_Drop(f->id,0,1,f->x,f->y,f->z,0,0,0,TRUE);s->unsaved=TRUE;s->lightsDirty=TRUE;continue;}
  if(f->time>600 || f->y<-64){f->removed=TRUE;continue;}
  g35_fall[j++]=*f;}g35_fallN=j;}
U0 MC35_RenderFalls(MCApp028 *s,F32 pt){if(!g35_fallN)return;hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,s->terrainTex);I32 i,k;F32 sh[6]={0.5,1,0.8,0.8,0.6,0.6};hcgl028_glBegin(7);
 for(i=0;i<g35_fallN;i++){MC35Fall *f=&g35_fall[i];if(f->removed)continue;F32 y=f->py+(f->y-f->py)*pt,x0=f->x-0.5,x1=f->x+0.5,y0=y-0.5,y1=y+0.5,z0=f->z-0.5,z1=f->z+0.5,l=MC31_Bright(floorf(f->x),floorf(y),floorf(f->z));MCRenderTile027 *v=&s->catalog.views[f->id];
  for(k=0;k<6;k++){TextureUVCoordinateSet *u=&v->uv[k];F32 c=l*sh[k];hcgl028_glColor4f(c,c,c,1);
   if(k==0){hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x0,y0,z1);hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x0,y0,z0);hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x1,y0,z0);hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x1,y0,z1);}
   if(k==1){hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x1,y1,z1);hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x1,y1,z0);hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x0,y1,z0);hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x0,y1,z1);}
   if(k==2){hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x0,y1,z0);hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x1,y1,z0);hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x1,y0,z0);hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x0,y0,z0);}
   if(k==3){hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x0,y1,z1);hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x0,y0,z1);hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x1,y0,z1);hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x1,y1,z1);}
   if(k==4){hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x0,y1,z1);hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x0,y1,z0);hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x0,y0,z0);hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x0,y0,z1);}
   if(k==5){hcgl028_glTexCoord2f(u->minX,u->maxY);hcgl028_glVertex3f(x1,y0,z1);hcgl028_glTexCoord2f(u->maxX,u->maxY);hcgl028_glVertex3f(x1,y0,z0);hcgl028_glTexCoord2f(u->maxX,u->minY);hcgl028_glVertex3f(x1,y1,z0);hcgl028_glTexCoord2f(u->minX,u->minY);hcgl028_glVertex3f(x1,y1,z1);}}}
 hcgl028_glEnd();hcgl028_glColor4f(1,1,1,1);}

// ---- ItemInHandRenderer::render, UseAnim BOW (4) pose while drawing ----
U0 MC035_BowPose(F32 pt){hcgl028_glRotatef(-18,0,0,1);hcgl028_glRotatef(-12,0,1,0);hcgl028_glRotatef(-8,1,0,0);hcgl028_glTranslatef(-0.9,0.2,0);
 F32 t=g35_useTicks+pt-1;if(t<0)t=0;F32 f=t/20.0;f=(f*f+f*2)/3;if(f>1)f=1;if(f>0.1)hcgl028_glTranslatef(0,sin((t-0.1)*1.3)*0.01*(f-0.1),0);
 hcgl028_glTranslatef(0,0,f*0.1);hcgl028_glRotatef(-335,0,0,1);hcgl028_glRotatef(-50,0,1,0);hcgl028_glTranslatef(0,0.5,0);hcgl028_glScalef(1,1,1+f*0.2);hcgl028_glTranslatef(0,-0.5,0);hcgl028_glRotatef(50,0,1,0);hcgl028_glRotatef(335,0,0,1);}

// ---- CompassItem / ClockItem animation frames (compass.png 16x512, watch-atlas.png 8x8) -> items atlas icon cells ----
U8 *g35_compassPix,*g35_watchPix;I32 g35_compassW,g35_compassH,g35_watchW,g35_watchH,g35_compassF=-1,g35_watchF=-1;Bool g35_animTried;U8 g35_cell[1024];
I32 MC035_CompassFrame(MCApp028 *s){Player *p=MC35_P(s);if(p==NULL)return 0;MCBody023 *b=&p->mob.entity.body;F32 dx=s->level.data.xSpawn-b->x,dz=s->level.data.zSpawn-b->z,l=sqrt(dx*dx+dz*dz);if(l>1.0e-4){dx/=l;dz/=l;}else{dx=0;dz=0;}
 F32 i=atan2(dz,dx)*57.29578-b->yaw+90;while(i<0)i+=360;while(i>=360)i-=360;I32 f=i/360.0*32;if(f>31)f=31;if(f<0)f=0;return f;}
I32 MC035_ClockFrame(MCApp028 *s){I32 f=MC033_Tod(s,1.0)*64;if(f>63)f=63;if(f<0)f=0;return f;}
U0 MC35_CellUpload(MCApp028 *s,I32 id,U8 *src,I32 sw,I32 sx,I32 sy,I32 cw){TextureUVCoordinateSet uv=s->catalog.itemUV[id];I32 y,x,dx=uv.minX*256+0.5,dy=uv.minY*256+0.5;
 for(y=0;y<16;y++)for(x=0;x<16;x++){I32 fx=sx+x*cw/16,fy=sy+y*cw/16;U8 *q=src+(fy*sw+fx)*4,*d=g35_cell+(y*16+x)*4;d[0]=q[0];d[1]=q[1];d[2]=q[2];d[3]=q[3];}
 hcgl028_glBindTexture(0xDE1,s->itemTex);G35_TexSubImage2D(0xDE1,0,dx,dy,16,16,0x1908,0x1401,g35_cell);hcgl028_glBindTexture(0xDE1,s->terrainTex);}
// Compass/clock icons as in PE: hotbar (Gui::renderSlot) and hand use the animation frame, dropped items use frame 0
// (getIcon(0,0)), inventory screens use the static atlas icon (getIcon(0,1) -> iconUV). mode: 0 frame0, 1 animated, 2 static.
U8 *g35_itemsPix;I32 g35_itemsW,g35_itemsH,g35_cFrame,g35_wFrame,g35_animMode=-1;
U0 MC35_CompassCell(MCApp028 *s,I32 f){I32 c=g35_compassW;MC35_CellUpload(s,345,g35_compassPix,g35_compassW,0,f*c,c);}
U0 MC35_WatchCell(MCApp028 *s,I32 f){I32 c=g35_watchW/8;MC35_CellUpload(s,347,g35_watchPix,g35_watchW,(f/8)*c,(f%8)*c,c);}
U0 MC35_StaticCell(MCApp028 *s,I32 id){if(!g35_itemsPix || g35_itemsW<256 || g35_itemsH<256)return;TextureUVCoordinateSet uv=s->catalog.itemUV[id];I32 dx=uv.minX*256+0.5,dy=uv.minY*256+0.5;I32 sc=g35_itemsW/256;MC35_CellUpload(s,id,g35_itemsPix,g35_itemsW,dx*sc,dy*sc,16*sc);}
I32 MC035_GetAnimMode(){return g35_animMode;}
U0 MC035_AnimMode(MCApp028 *s,I32 mode){if(!s->itemTex)return;Bool okC=g35_compassPix && g35_compassW>=16 && g35_compassH>=g35_compassW*32,okW=g35_watchPix && g35_watchW>=128 && g35_watchH>=128;
 I32 cf=0,wf=0;if(mode==1){cf=g35_cFrame;wf=g35_wFrame;}if(mode==2){cf=-2;wf=-2;}
 if(cf!=g35_compassF){g35_compassF=cf;if(mode==2)MC35_StaticCell(s,345);else if(okC)MC35_CompassCell(s,cf);}
 if(wf!=g35_watchF){g35_watchF=wf;if(mode==2)MC35_StaticCell(s,347);else if(okW)MC35_WatchCell(s,wf);}g35_animMode=mode;}
U0 MC035_ItemAnim(MCApp028 *s){if(!s->worldReady || !s->itemTex || s->minecraft.player==NULL)return;
 if(!g35_animTried){g35_animTried=TRUE;I32 n;g35_compassPix=stbi_load("assets/035/compass.png",&g35_compassW,&g35_compassH,&n,4);g35_watchPix=stbi_load("assets/035/watch-atlas.png",&g35_watchW,&g35_watchH,&n,4);g35_itemsPix=stbi_load("assets/items.png",&g35_itemsW,&g35_itemsH,&n,4);if(!g35_compassPix || !g35_watchPix)printf("Texture load failed: assets/035/compass.png / watch-atlas.png\n");}
 g35_cFrame=MC035_CompassFrame(s);g35_wFrame=MC035_ClockFrame(s);MC035_AnimMode(s,1);}

// ---- CameraItem::use -> TripodCamera (interact: 80-tick countdown, smoke, picture at 8, removed at 0) ----
U0 MC35_CamAdd(MCApp028 *s){if(s->placeCooldown>0)return;Player *p=MC35_P(s);MCBody023 *b=&p->mob.entity.body;I32 i,j=0;for(i=0;i<g35_camN;i++)if(!g35_cam[i].removed)g35_cam[j++]=g35_cam[i];g35_camN=j;if(g35_camN>=MC35_MAXCAM)return;
 MC35Cam *c=&g35_cam[g35_camN++];memset(c,0,sizeof(MC35Cam));c->x=b->x;c->y=b->y;c->z=b->z;c->px=c->x;c->py=c->y;c->pz=c->z;c->yaw=b->yaw;c->pitch=b->pitch;c->timer=80;c->hp=10;printf("CAMERA035 placed\n");}
U0 MC35_CamTick(MCApp028 *s){I32 i;for(i=0;i<g35_camN;i++){MC35Cam *c=&g35_cam[i];if(c->removed)continue;c->px=c->x;c->py=c->y;c->pz=c->z;if(!c->armed)continue;c->timer--;
  if(c->timer==8)g35_shotCam=i;
  else if(c->timer>8)MC31_Particle(5,c->x,c->y+1.0,c->z,0,0,0);else if(c->timer<=0)c->removed=TRUE;}}
U0 MC35_CamBox(MC35Cam *c,AABB *a){a->minX=c->x-0.5;a->maxX=c->x+0.5;a->minY=c->y-0.5;a->maxY=c->y+1.0;a->minZ=c->z-0.5;a->maxZ=c->z+0.5;}
U0 MC35_CamPick(MCApp028 *s){g35_camSel=-1;if(!g35_camN || !s->worldReady || s->minecraft.player==NULL || g29_dirMode==2 || s->paused || s->inventory)return;if(g31_sel!=NULL || g34_cartSel>=0)return;
 Vec3 eye,end;MC028_Direction(s,&eye,&end,1);F32 dx=end.x-eye.x,dy=end.y-eye.y,dz=end.z-eye.z,limit=3;if(s->creative)limit=5;
 if(s->hasHit){I32 id=Level_getTile(&s->level,s->hit.x,s->hit.y,s->hit.z);AABB box;Tile_getAABB(&s->catalog.tiles[id],s->hit.x,s->hit.y,s->hit.z,&box);F32 t=MC31_Slab(&eye,dx,dy,dz,box.minX,box.minY,box.minZ,box.maxX,box.maxY,box.maxZ);if(t>=0 && t<limit)limit=t;}
 I32 i;for(i=0;i<g35_camN;i++){MC35Cam *c=&g35_cam[i];if(c->removed)continue;AABB a;MC35_CamBox(c,&a);F32 t=MC31_Slab(&eye,dx,dy,dz,a.minX,a.minY,a.minZ,a.maxX,a.maxY,a.maxZ);if(t>=0 && t<=limit){limit=t;g35_camSel=i;}}
 if(g35_camSel<0)return;s->hasHit=FALSE;MC35Cam *c=&g35_cam[g35_camSel];Bool use=s->rightPressed,attack=s->leftPressed;if(g29_touchOn && s->rightPressed){use=TRUE;attack=FALSE;}
 if(use && !s->placeCooldown){c->armed=TRUE;s->rightPressed=FALSE;s->rightDown=FALSE;s->placeCooldown=5;printf("CAMERA035 armed\n");}
 else if(attack && !s->mineCooldown){MC033_Swing();{Player *pp=MC35_P(s);ItemInstance *h=Inventory_getSelected(&pp->inventory);I32 hid=0;if(h!=NULL && h->count>0)hid=ItemInstance_getId(h);c->hp-=MC31_AttackDamage(hid);}s->leftPressed=FALSE;s->mineCooldown=10;if(c->hp<=0){c->removed=TRUE;g35_camSel=-1;}}}
U0 MC035_ShotView(MCApp028 *s,Vec3 *eye,Vec3 *target){if(g35_shotCam<0)return;MC35Cam *c=&g35_cam[g35_shotCam];eye->x=c->x;eye->y=c->y-0.5+1.62;eye->z=c->z;F32 yaw=c->yaw*MC31_PI/180,pitch=c->pitch*MC31_PI/180;
 target->x=eye->x-sin(yaw)*cos(pitch);target->y=eye->y-sin(pitch);target->z=eye->z+cos(yaw)*cos(pitch);}
// LevelRenderer::takePicture: render the level from the tripod (no GUI, first person), save the frame
U0 MC035_CameraShot(MCApp028 *s){if(g35_shotCam<0 || !s->worldReady)return;Bool hg=g29_opt.hideGui,tp=g29_opt.thirdPerson;g29_opt.hideGui=TRUE;g29_opt.thirdPerson=FALSE;g35_shooting=TRUE;
 F32 fog[4];MC033_FogColor(s,0,fog);hcgl028_glClearColor(fog[0],fog[1],fog[2],1);hcgl028_glClear(0x4100);MC028_RenderWorld(s,0);g35_shooting=FALSE;g29_opt.hideGui=hg;g29_opt.thirdPerson=tp;MC35Cam *c=&g35_cam[g35_shotCam];g35_shotCam=-1;
 U8 path[256],num[24];C31_MkDirs("screenshots");C31_Dec(num,(hc028_clock_ns()/1000000)%10000);C31_Cat(path,256,"screenshots/img_",num,".ppm");
 if(hc028_capture(path,g29_W,g29_H)){g35_photos++;printf("CAMERA035 picture %s\n",path);U8 m[300];C31_Cat(m,300,"Picture saved: ",path,"");MC029_Status(m);}else printf("CAMERA035 picture failed\n");
 MC31_Particle(1,c->x,c->y+0.6,c->z,0,0,0);MC31_Particle(1,c->x,c->y+0.8,c->z,0,0,0);MC31_Particle(1,c->x,c->y+1.0,c->z,0,0,0);}
U0 MC35_RenderCams(MCApp028 *s,F32 pt){if(!g35_camN)return;I32 i;static U32 camTex=0;static Bool tried=FALSE;if(!tried){tried=TRUE;camTex=MC028_Texture("assets/035/camera.png",NULL,NULL);}
 TextureUVCoordinateSet leg;MC028_UV(&leg,s->catalog.texIndex[3],0);
 for(i=0;i<g35_camN;i++){MC35Cam *c=&g35_cam[i];if(c->removed || (g35_shooting && i==g35_shotCam))continue;F32 x=c->px+(c->x-c->px)*pt,y=c->py+(c->y-c->py)*pt,z=c->pz+(c->z-c->pz)*pt,l=MC31_Bright(floorf(x),floorf(y),floorf(z));if(g35_camSel==i)l=l*0.6+0.4;
  hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,z);hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,s->itemTex);hcgl028_glColor4f(l,l,l,1);hcgl028_glDisable(0xB44);
  hcgl028_glBegin(7);F32 a=0.45,y0=-0.5,y1=0.5;
  hcgl028_glTexCoord2f(leg.minX,leg.minY);hcgl028_glVertex3f(-a,y1,-a);hcgl028_glTexCoord2f(leg.minX,leg.maxY);hcgl028_glVertex3f(-a,y0,-a);hcgl028_glTexCoord2f(leg.maxX,leg.maxY);hcgl028_glVertex3f(a,y0,a);hcgl028_glTexCoord2f(leg.maxX,leg.minY);hcgl028_glVertex3f(a,y1,a);
  hcgl028_glTexCoord2f(leg.minX,leg.minY);hcgl028_glVertex3f(-a,y1,a);hcgl028_glTexCoord2f(leg.minX,leg.maxY);hcgl028_glVertex3f(-a,y0,a);hcgl028_glTexCoord2f(leg.maxX,leg.maxY);hcgl028_glVertex3f(a,y0,-a);hcgl028_glTexCoord2f(leg.maxX,leg.minY);hcgl028_glVertex3f(a,y1,-a);
  hcgl028_glEnd();hcgl028_glEnable(0xB44);
  if(camTex){hcgl028_glBindTexture(0xDE1,camTex);g31_tw=64;g31_th=32;MC31_Part(0,11,0,(c->pitch*0.5+180)*MC31_PI/180,-c->yaw*MC31_PI/180,0);MC31_Box(0,0,-4,-4,-6,8,8,10,0);MC31_End();}
  hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);hcgl028_glBindTexture(0xDE1,s->terrainTex);}
