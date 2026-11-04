#ifndef MCPE_BATCH020_SUPPORT
#define MCPE_BATCH020_SUPPORT
// Explicit simulation interfaces: caller synchronizes snapshots before/after calls.
// Every callback used by a module is REQUIRED, unless an explicit null test exists.
// The world/graphics backend is not supplied here. Never silently substitute no-op callbacks.
class MCItem020 { I32 id,count,aux,attackDamage,renderShape;Bool isSeed,hasClass,isBucket,isBow,handEquipped,hasTile,tileCanRender; };
class MCActor020 { I32 id,type,age,inLove;F32 x,y,z,prevX,prevY,prevZ,minX,minY,minZ,maxX,maxY,maxZ,width,height,headHeight,yaw,pitch,prevYaw,prevPitch;Bool alive,isMob,isPlayer,invulnerable,instabuild;MCItem020 *selected; };
class MCMobHost020;
class MCMob020 { MCMobHost020 *h;MCActor020 a;Random rng;F32 motionX,motionY,motionZ,brightness;Bool onGround,collidedH,fire,baby;I32 attackTarget,panicTicks,noActionTime,attackTime;MCActor020 *rider,*ridingAt;Bool holdGround;I8 data16;MCString skin;I32 renderId; };
class MCMobHost020 {
 U0 *ctx;Bool isClient,isDay;I32 difficulty;I32 grass,wheat,potato,carrot,beetroot,seeds,bucket,leather,beefRaw,beefCooked,porkRaw,porkCooked,chickenRaw,chickenCooked,feather,egg,stringId,bow,arrow,bone;
 Bool (*isFood)(U0 *,MCMob020 *,MCItem020 *);U0 (*baseInit)(U0 *,MCMob020 *,I32);U0 (*baseTick)(U0 *,MCMob020 *);U0 (*baseAi)(U0 *,MCMob020 *);Bool (*baseHurt)(U0 *,MCMob020 *,MCActor020 *,I32);Bool (*baseInteract)(U0 *,MCMob020 *,MCActor020 *);Bool (*baseSpawn)(U0 *,MCMob020 *);U0 (*baseDie)(U0 *,MCMob020 *,MCActor020 *);I32 (*baseArmor)(U0 *,MCMob020 *);
 U0 (*setSize)(U0 *,MCMob020 *,F32,F32);U0 (*defineByte)(U0 *,MCMob020 *,I32,I8);I8 (*getByte)(U0 *,MCMob020 *,I32);U0 (*setByte)(U0 *,MCMob020 *,I32,I8);U0 (*navOption)(U0 *,MCMob020 *,I32,Bool);U0 (*addGoal)(U0 *,MCMob020 *,I32,I32,I32,F32,I32 *,I32,Bool);
 U0 (*setAge)(U0 *,MCMob020 *,I32);U0 (*readAge)(U0 *,MCMob020 *,U0 *);U0 (*writeAge)(U0 *,MCMob020 *,U0 *);I32 (*getInt)(U0 *,U0 *,U8 *);U0 (*putInt)(U0 *,U0 *,U8 *,I32);I32 (*getTile)(U0 *,I32,I32,I32);I32 (*rawLight)(U0 *,I32,I32,I32);I32 (*skyLight)(U0 *,I32,I32,I32);F32 (*light)(U0 *,I32,I32,I32);Bool (*sky)(U0 *,I32,I32,I32);
 U0 (*heart)(U0 *,F32,F32,F32,F32,F32,F32);U0 (*drop)(U0 *,MCMob020 *,I32,I32);U0 (*sound)(U0 *,MCMob020 *,U8 *,F32,F32);U0 (*remove)(U0 *,MCMob020 *);U0 (*swing)(U0 *,MCMob020 *);U0 (*attackAnim)(U0 *,MCMob020 *);Bool (*hurtTarget)(U0 *,MCMob020 *,MCActor020 *,I32);MCActor020 *(*nearest)(U0 *,MCMob020 *,F32);Bool (*canSee)(U0 *,MCMob020 *,MCActor020 *);U0 (*setFire)(U0 *,MCMob020 *,I32);MCMob020 *(*newMob)(U0 *,I32);U0 (*inventoryAdd)(U0 *,MCActor020 *,MCItem020 *);MCItem020 *(*carried)(U0 *,MCMob020 *);
 U0 *(*newArrow)(U0 *,MCMob020 *,F32);F32 (*arrowY)(U0 *,U0 *);U0 (*addEntity)(U0 *,U0 *);U0 (*shoot)(U0 *,U0 *,F32,F32,F32,F32,F32);
};
U0 MCMob020_Init(MCMob020 *s,MCMobHost020 *h,I32 baseType) { memset(s,0,sizeof(MCMob020));s->h=h;MCString_Init(&s->skin);Random_Init(&s->rng);h->baseInit(h->ctx,s,baseType); }
U0 MCMob020_Destroy(MCMob020 *s) { MCString_Destroy(&s->skin); }
U0 MCMob020_Size(MCMob020 *s,F32 w,F32 h) {s->a.width=w;s->a.height=h;s->h->setSize(s->h->ctx,s,(w)(F32),(h)(F32));}
U0 MCMob020_Skin(MCMob020 *s,U8 *skin) {MCString_Destroy(&s->skin);MCString_FromC(&s->skin,skin);}
U0 MCMob020_Heart(MCMob020 *s) {F32 a=Random_nextGaussian(&s->rng),b=Random_nextGaussian(&s->rng),c=Random_nextGaussian(&s->rng);F32 x=s->a.x+(Random_nextFloat(&s->rng)*s->a.width)*2-s->a.width;F32 y=(s->a.y+0.5)+(Random_nextFloat(&s->rng)*s->a.height);F32 z=s->a.z+(Random_nextFloat(&s->rng)*s->a.width)*2-s->a.width;s->h->heart(s->h->ctx,(x)(F32),(y)(F32),(z)(F32),(a*0.02)(F32),(b*0.02)(F32),(c*0.02)(F32));}
I32 MCMob020_Beef(MCMob020 *s) {if(s->fire)return s->h->beefCooked;return s->h->beefRaw;}
I32 MCMob020_ChickenMeat(MCMob020 *s) {if(s->fire)return s->h->chickenCooked;return s->h->chickenRaw;}
U0 MCString_AppendBytes(MCString *s,U8 *bytes,I64 n) {if(n<=0)return;U8 *data=MC_Alloc(s->size+n+1);if(s->size)memcpy(data,s->data,s->size);memcpy(data+s->size,bytes,n);data[s->size+n]=0;free(s->data);s->data=data;s->size+=n;}
// Goal descriptor IDs: 0 Float,1 Panic,2 Breed,3 Tempt,4 FollowParent,5 RandomStroll,
// 6 LookAtPlayer,7 RandomLookAround,8 BreakDoor,9 Melee,10 HurtBy,11 NearestTarget,
// 12 RestrictSun,13 FleeSun,14 ArrowAttack. option 0 avoidWater, 1 openDoors.
U0 MCMob020_AnimalGoals(MCMob020 *s,F32 stroll,I32 *foods,I32 count,Bool avoid) {MCMobHost020 *h=s->h;if(avoid)h->navOption(h->ctx,s,0,TRUE);h->addGoal(h->ctx,s,0,0,0,(0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,1,1,(1.5)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,2,2,(1.0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,3,3,(1.0)(F32),foods,count,FALSE);h->addGoal(h->ctx,s,0,4,4,(1.1)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,5,5,(stroll)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,6,6,(6.0)(F32),NULL,0,FALSE);h->addGoal(h->ctx,s,0,7,7,(0)(F32),NULL,0,FALSE);}
class MCGoalHost020 {U0 *ctx,*level;MCActor020 *actor;Random *random,*worldRandom;Bool navDone,avoidWater;F32 maxHeadXRot;MCActor020 *(*target)(U0 *);MCActor020 *(*nearest)(U0 *,F32);MCActor020 *(*lock)(U0 *,I32);U0 (*retain)(U0 *,MCActor020 *);U0 (*release)(U0 *,I32);Bool (*canSee)(U0 *,MCActor020 *);F32 (*distanceSqr)(U0 *,MCActor020 *,Bool);U0 (*look)(U0 *,MCActor020 *,F32,F32);U0 (*move)(U0 *,MCActor020 *,F32);U0 (*stop)(U0 *);U0 *(*createPath)(U0 *,MCActor020 *);U0 (*deletePath)(U0 *,U0 *);U0 (*movePath)(U0 *,U0 *,F32);U0 (*hurt)(U0 *,MCActor020 *);U0 (*avoid)(U0 *,Bool);U32 (*fastRandom)(U0 *);U0 (*animals)(U0 *,I32,F32,F32,F32,F32,F32,F32,MCPtrVector *);Bool (*canMate)(U0 *,MCActor020 *);MCActor020 *(*offspring)(U0 *,MCActor020 *);U0 (*setAge)(U0 *,MCActor020 *,I32);U0 (*resetLove)(U0 *,MCActor020 *);U0 (*moveBaby)(U0 *,MCActor020 *,F32,F32,F32);U0 (*addBaby)(U0 *,MCActor020 *);U0 (*heart)(U0 *,F32,F32,F32,F32,F32,F32);U0 *(*projectile)(U0 *,U0 *,MCActor020 *,I32,F32,F32);F32 (*projectileY)(U0 *,U0 *);U0 (*shoot)(U0 *,U0 *,F32,F32,F32,F32,F32);U0 (*bowSound)(U0 *,F32);U0 (*addProjectile)(U0 *,U0 *,U0 *);};
U0 MCGoal020_Target(MCGoalHost020 *h,I32 *id,Bool *has,MCActor020 *t) {if(t && *has && *id==t->id)return;if(*has)h->release(h->ctx,*id);*has=t!=NULL;if(t){*id=t->id;h->retain(h->ctx,t);}}
MCActor020 *MCGoal020_Lock(MCGoalHost020 *h,I32 id,Bool has) {if(!has)return NULL;return h->lock(h->ctx,id);}
#endif

#ifndef MCPE_BATCH020_RENDER_SUPPORT
#define MCPE_BATCH020_RENDER_SUPPORT
class MCG020 {U0 *ctx;U0 (*command)(U0 *,I32,F32,F32,F32,F32,F32);U0 (*bind)(U0 *,MCString *);U0 *(*meshEnd)(U0 *);U0 (*meshDraw)(U0 *,U0 *);U0 (*meshDelete)(U0 *,U0 *);U0 (*listener)(U0 *,U0 *,Bool);U0 (*lighting)(U0 *,U0 *,Bool,F32);U0 *(*modelNew)(U0 *,I32);U0 (*modelDelete)(U0 *,U0 *);U0 (*modelOp)(U0 *,U0 *,I32,F32,F32,F32,F32,F32,F32);U0 (*modelDraw)(U0 *,U0 *,F32,Bool);I32 (*fontWidth)(U0 *,MCString *);U0 (*fontDraw)(U0 *,MCString *,F32,F32,I32);U0 (*fontReset)(U0 *);U0 *(*getFont)(U0 *);U0 (*mobRender)(U0 *,U0 *,F32,F32,F32,F32,F32);U0 (*heldRender)(U0 *,U0 *,MCItem020 *);U0 (*crossTexture)(U0 *,F32,F32,F32);U0 (*icon)(U0 *,MCItem020 *,F32 *,MCString *);U0 (*randomPoint)(U0 *,U0 *,Vec3 *);U0 *(*particle)(U0 *,I32,F32,F32,F32,F32,F32,F32,I32);U0 (*halfLife)(U0 *,U0 *);U0 (*particleEntity)(U0 *,U0 *,U0 *);};
// command: 1 push,2 pop,3 translate,4 scale,5 rotate,6 color,
// 7 enable,8 disable,9 enableClient,10 disableClient,11 depthMask,
// 12 blendFunc,13 lightModel,14 begin,15 normal,16 vertexUV,
// 17 offset,18 draw,19 vertex,20 tesselatorColor. Integer GL enums occupy exactly representable F32s.
U0 MCG020_C(MCG020 *g,I32 op,F32 a=0,F32 b=0,F32 c=0,F32 d=0,F32 e=0) {g->command(g->ctx,op,(a)(F32),(b)(F32),(c)(F32),(d)(F32),(e)(F32));}
U0 MCG020_Bind(MCG020 *g,U8 *name) {MCString s;MCString_FromC(&s,name);g->bind(g->ctx,&s);MCString_Destroy(&s);}
class MCRenderEntity020 {MCActor020 a;U0 *identity;F32 motionX,motionZ,shake;I32 flash,renderId,queryRenderId;Bool onFire,sleeping,sneaking,selected,fancy;MCItem020 *carried;U0 *motive;I32 motiveW,motiveH,motiveU,motiveV;};
class MCRenderTile020 {U0 *identity;I32 renderId,x,y,z,data;Bool hasLevel,hasTile,isUnpaired,paired,isSign;F32 lid,prevLid,modelOffsetX;I32 selectedLine;MCString lines[4];};
class MCMesh020 {U0 *handle;};
class MCRenderer020 {MCG020 *g;U0 *object;U0 (*initFn)(U0 *,U0 *);U0 (*destroy)(U0 *);U0 (*newLevel)(U0 *,U0 *);U0 (*render)(U0 *,U0 *,F32,F32,F32,F32,F32);U0 (*post)(U0 *,U0 *,F32,F32,F32,F32,F32);};
class MCDispatchHost020 {U0 *ctx;MCG020 *graphics;MCRenderer020 *(*newRenderer)(U0 *,I32,Bool);I32 (*tile)(U0 *,U0 *,I32,I32,I32);I32 (*data)(U0 *,U0 *,I32,I32,I32);F32 (*light)(U0 *,U0 *,I32,I32,I32);F32 (*tileDistance)(U0 *,MCRenderTile020 *,F32,F32,F32);I32 bed;};
#endif

#ifndef MCPE_BATCH020_TILE_SUPPORT
#define MCPE_BATCH020_TILE_SUPPORT
class MCTileHost020 {U0 *ctx;Bool isClient;Random *random;I32 grass,dirt,farmland,flower,rose,tallgrass,seeds,wheat;
 U0 (*baseInit)(U0 *,U0 *,I32,I32,MCString *);U0 (*shape)(U0 *,U0 *,F32,F32,F32,F32,F32,F32);U0 (*ticking)(U0 *,U0 *,Bool);U0 *(*texture)(U0 *,U8 *,I32);I32 (*tile)(U0 *,I32,I32,I32);I32 (*data)(U0 *,I32,I32,I32);I32 (*rawLight)(U0 *,I32,I32,I32);Bool (*blocksLight)(U0 *,I32,I32,I32);Bool (*snowMaterial)(U0 *,I32,I32,I32);Bool (*solid)(U0 *,I32,I32,I32);Bool (*survives)(U0 *,I32,I32,I32,I32);U0 (*setTile)(U0 *,I32,I32,I32,I32,I32);U0 (*setTileData)(U0 *,I32,I32,I32,I32,I32,I32);U0 (*setData)(U0 *,I32,I32,I32,I32,I32);I32 (*dirtResource)(U0 *,Random *);U0 (*checkAlive)(U0 *,U0 *,I32,I32,I32);U0 (*baseResources)(U0 *,U0 *,I32,I32,I32,I32,F32);U0 (*drop)(U0 *,I32,I32,I32,F32,F32,F32,F32,F32,F32,I32);U0 *(*tileEntity)(U0 *,I32,I32,I32);I32 (*entityType)(U0 *,U0 *);U0 (*unpair)(U0 *,U0 *);I32 (*containerSize)(U0 *,U0 *);MCItem020 *(*item)(U0 *,U0 *,I32);U0 (*baseRemove)(U0 *,U0 *,I32,I32,I32);Bool (*canOpen)(U0 *,U0 *);U0 (*open)(U0 *,U0 *,U0 *);};
#endif
