extern "c" F32 ceilf(F32);
I32 MC023_Abs(I32 n){if(n<0)return -n;return n;}
// Data/transport boundary, not a Level/Entity binary ABI. No game backend is silently fabricated.
class ItemInstance;class MCBody023;class Inventory;class MCPlayer023;class MCInteraction023;
class MCItemDef023 {I32 id,maxStack,maxDamage,attackDamage,armorMaterial;Bool stackedByData,armor,wood,liquidClip;F32 destroySpeed;U8 *description;};
class MCTileDef023 {I32 material,opacity,emission,renderShape;Bool registered,solid,cube,signal,plant;F32 resistance,slipperiness,breakProgress,soundVolume,soundPitch;U8 *stepSound,*breakSound;};
class MCRegistry023 {MCItemDef023 *items[512];MCTileDef023 tiles[256];I32 rock,stoneBrick,wood,torch,brickStairs,cobbleWall,leaves,lightGem,stoneSlab,woodSlab,invisibleBedrock;I32 water,lava,calmLava,fire,farmland,dirt,grass,bed,trapdoor,doorWood,doorIron,furnace,litFurnace,stemFruit;I32 bucket,stick,coal,sapling,coalBlock,bow,bowl,woodShovel,woodHoe,woodPick,woodSword,bedItem,arrow,shears,flint,wool,sulphur,goldSword,goldIngot;};
class MCWorldEvent023 {I32 op,x,y,z,id,meta,count,flags;F32 a,b,c,d,e,f;U8 *name;U0 *object,*other;};
class MCWorld023 {U0 *ctx;MCRegistry023 *registry;MCInteraction023 *actions;Random random;Bool isClient,creative,allowInteract,enablePVP,enablePVE,online,destroyVibration,mayRespawn;I32 difficulty;I32 (*get)(U0*,I32,I32,I32,I32);Bool (*set)(U0*,I32,I32,I32,I32,I32,I32,I32);F32 (*value)(U0*,I32,I32,I32,I32);U0 (*event)(U0*,MCWorldEvent023*);U0 (*move)(U0*,MCBody023*,F32,F32,F32);Bool (*hurt)(U0*,MCBody023*,MCBody023*,I32);U0 (*entities)(U0*,MCBody023*,F32,F32,F32,F32,F32,F32,MCPtrVector*);U0 *(*blockEntity)(U0*,I32,I32,I32);Bool (*raycast)(U0*,Vec3*,Vec3*,I32*,I32*,I32*,Vec3*);};
#define MC023_TILE 0
#define MC023_DATA 1
#define MC023_LIGHT 2
#define MC023_SKY 3
#define MC023_READY 4
#define MC023_SIGNAL 5
#define MC023_MAYPLACE 6
#define MC023_SET_TILE 0
#define MC023_SET_DATA 1
#define MC023_SET_LIGHT 2
#define MC023_SOUND 1
#define MC023_PARTICLE 2
#define MC023_DROP 3
#define MC023_DIRTY 4
#define MC023_NEIGHBOR 5
#define MC023_LEVEL_EVENT 6
#define MC023_BASE_TICK 7
#define MC023_TILE_ATTACK 8
#define MC023_WILL_DESTROY 9
#define MC023_TILE_DESTROY 10
#define MC023_PLAYER_DESTROY 11
#define MC023_EXPLODE 12
#define MC023_CHANGED 13
#define MC023_OPEN_FURNACE 14
#define MC023_PACKET_REMOVE 15
#define MC023_PACKET_USE 16
#define MC023_RELEASE 17
#define MC023_INTERACT 18
#define MC023_ATTACK 19
#define MC023_CHECK_ALIVE 20
#define MC023_SLEEP 21
#define MC023_MESSAGE 22
#define MC023_BASE_AI 23
#define MC023_HIT 24
#define MC023_TAKE 25
#define MC023_VIBRATE 26
#define MC023_TILE_USE 27
I32 MC023_Get(MCWorld023 *w,I32 op,I32 x,I32 y,I32 z) {if(w->get==NULL)return 0;return w->get(w->ctx,op,x,y,z);}
Bool MC023_Set(MCWorld023 *w,I32 op,I32 x,I32 y,I32 z,I32 id,I32 meta,I32 flags) {if(w->set==NULL)return FALSE;return w->set(w->ctx,op,x,y,z,id,meta,flags);}
U0 MC023_Event(MCWorld023 *w,I32 op,I32 x,I32 y,I32 z,I32 id,I32 meta,I32 count,U0 *object=NULL,U0 *other=NULL) {MCWorldEvent023 e;memset(&e,0,sizeof(e));e.op=op;e.x=x;e.y=y;e.z=z;e.id=id;e.meta=meta;e.count=count;e.object=object;e.other=other;if(w->event!=NULL)w->event(w->ctx,&e);}
U0 MC023_Sound(MCWorld023 *w,U8 *name,F32 x,F32 y,F32 z,F32 volume,F32 pitch) {MCWorldEvent023 e;memset(&e,0,sizeof(e));e.op=MC023_SOUND;e.name=name;e.a=x;e.b=y;e.c=z;e.d=volume;e.e=pitch;if(w->event!=NULL)w->event(w->ctx,&e);}
U0 MC023_Particle(MCWorld023 *w,I32 type,F32 x,F32 y,F32 z,F32 mx,F32 my,F32 mz) {MCWorldEvent023 e;memset(&e,0,sizeof(e));e.op=MC023_PARTICLE;e.id=type;e.a=x;e.b=y;e.c=z;e.d=mx;e.e=my;e.f=mz;if(w->event!=NULL)w->event(w->ctx,&e);}
I32 MC023_Tile(MCWorld023 *w,I32 x,I32 y,I32 z) {return MC023_Get(w,MC023_TILE,x,y,z);}
I32 MC023_Data(MCWorld023 *w,I32 x,I32 y,I32 z) {return MC023_Get(w,MC023_DATA,x,y,z);}
MCTileDef023 *MC023_Def(MCWorld023 *w,I32 id) {if(id<0 || id>255)return NULL;return &w->registry->tiles[id];}
Bool MC023_Solid(MCWorld023 *w,I32 x,I32 y,I32 z) {MCTileDef023 *t=MC023_Def(w,MC023_Tile(w,x,y,z));if(t==NULL)return FALSE;return t->solid && t->cube;}
I32 MC023_Material(MCWorld023 *w,I32 x,I32 y,I32 z) {MCTileDef023 *t=MC023_Def(w,MC023_Tile(w,x,y,z));if(t)return t->material;return 0;}
// Material snapshot categories: 0 air,1 stone/solid,2 wood,3 water,4 lava,5 metal,6 plant.
class MCBody023: MCActor020 {MCWorld023 *w;Random rng;F32 motionX,motionY,motionZ,minYBound;Bool onGround,dead,inWater,inLava,pickable;I32 health;};
U0 MC023_BodyInit(MCBody023 *s,MCWorld023 *w,I32 type,F32 width,F32 height) {memset(s,0,sizeof(MCBody023));s->w=w;s->type=type;s->width=width;s->height=height;s->alive=TRUE;s->pickable=TRUE;Random_setSeed(&s->rng,1);}
U0 MC023_Remove(MCBody023 *s) {s->dead=TRUE;s->alive=FALSE;}
U0 MC023_Move(MCBody023 *s) {if(s->w->move!=NULL)s->w->move(s->w->ctx,s,s->motionX(F32),s->motionY(F32),s->motionZ(F32));else{s->x+=s->motionX;s->y+=s->motionY;s->z+=s->motionZ;}s->minYBound=s->y;}
U0 MC023_BaseTick(MCBody023 *s) {MC023_Event(s->w,MC023_BASE_TICK,0,0,0,0,0,0,s);}
Bool MC023_Hurt(MCBody023 *target,MCBody023 *from,I32 damage) {if(target->w->hurt!=NULL)return target->w->hurt(target->w->ctx,target,from,damage);return FALSE;}
F32 MC023_Distance(MCBody023 *a,MCBody023 *b) {F32 x=a->x-b->x,y=a->y-b->y,z=a->z-b->z;return sqrtf(x*x+y*y+z*z);}
U0 MC023_Entities(MCWorld023 *w,MCBody023 *except,F32 x,F32 y,F32 z,F32 xx,F32 yy,F32 zz,MCPtrVector *out) {MCPtrVector_Init(out);if(w->entities!=NULL)w->entities(w->ctx,except,x(F32),y(F32),z(F32),xx(F32),yy(F32),zz(F32),out);}
I32 MC023_NBTGet(CompoundTag *tag,U8 *key,Bool byte) {MCString k;MCString_FromC(&k,key);I32 v;if(byte)v=CompoundTag_getByte(tag,&k)(U8);else v=CompoundTag_getShort(tag,&k);MCString_Destroy(&k);return v;}
U0 MC023_NBTPut(CompoundTag *tag,U8 *key,I32 value,Bool byte) {MCString k;MCString_FromC(&k,key);if(byte)CompoundTag_putByte(tag,&k,value);else CompoundTag_putShort(tag,&k,value);MCString_Destroy(&k);}
Tag *MC023_TagGet(CompoundTag *tag,U8 *key) {MCString k;MCString_FromC(&k,key);Tag *v=CompoundTag_get(tag,&k);MCString_Destroy(&k);return v;}
U0 MC023_TagPut(CompoundTag *tag,U8 *key,Tag *value) {MCString k;MCString_FromC(&k,key);CompoundTag_put(tag,&k,value);MCString_Destroy(&k);}

class MCPlayer023: MCBody023 {Inventory *inventory;Bool instabuildMode,sleeping;I32 bedX,bedY,bedZ;};
class MCInteraction023 {U0 *ctx;Bool (*tileUse)(U0*,I32,I32,I32,MCPlayer023*);ItemInstance *(*use)(U0*,ItemInstance*,MCPlayer023*);Bool (*useOn)(U0*,ItemInstance*,MCPlayer023*,I32,I32,I32,I32,Vec3*);Bool (*canDestroy)(U0*,MCPlayer023*,I32);U0 (*mine)(U0*,ItemInstance*,I32,I32,I32,I32,MCPlayer023*);I32 (*sleep)(U0*,MCPlayer023*,I32,I32,I32);};
class MC023Shape {F32 x1,y1,z1,x2,y2,z2;};
U0 MC023_Shape(MC023Shape *s,F32 a,F32 b,F32 c,F32 d,F32 e,F32 f) {s->x1=a;s->y1=b;s->z1=c;s->x2=d;s->y2=e;s->z2=f;}
