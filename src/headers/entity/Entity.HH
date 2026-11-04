// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Entity {MCBody023 body;Level *level;AABB box;F32 ridingHeight,ySize,stepHeight,fallDistance;I32 fire,air;Bool noclip,inWeb,sneaking,horizontalCollision,verticalCollision,collided;Entity *ridingAt,*rider;};

U0 Entity_setPos(Entity *s,F32 x,F32 y,F32 z);
U0 Entity_Init(Entity *s,Level *level,I32 type,F32 width,F32 height);
U0 Entity_setSize(Entity *s,F32 width,F32 height);
U0 Entity_setRot(Entity *s,F32 yaw,F32 pitch);
U0 Entity_moveTo(Entity *s,F32 x,F32 y,F32 z,F32 yaw,F32 pitch);
U0 Entity_turn(Entity *s,F32 dx,F32 dy);
U0 Entity_interpolateTurn(Entity *s,F32 dx,F32 dy);
U0 Entity_moveRelative(Entity *s,F32 strafe,F32 forward,F32 speed);
Bool Entity_isFree(Entity *s,F32 dx,F32 dy,F32 dz);
F32 MC025_SneakReduce(F32 v);
U0 Entity_move(Entity *s,F32 dx,F32 dy,F32 dz);
U0 Entity_remove(Entity *s);
U0 MC025_PutFloat(CompoundTag *t,U8 *name,F32 value);
F32 MC025_GetFloat(CompoundTag *t,U8 *name);
U0 MC025_PutShort(CompoundTag *t,U8 *name,I32 value);
I32 MC025_GetShort(CompoundTag *t,U8 *name);
U0 MC025_PutByte(CompoundTag *t,U8 *name,I32 value);
I32 MC025_GetByte(CompoundTag *t,U8 *name);
U0 MC025_FloatList(CompoundTag *t,U8 *name,F32 *values,I32 n);
ListTag *MC025_List(CompoundTag *t,U8 *name,I32 minSize);
U0 Entity_saveWithoutId(Entity *s,CompoundTag *t);
Bool Entity_save(Entity *s,CompoundTag *t);
Bool Entity_load(Entity *s,CompoundTag *t);

U0 Entity_resetPos(Entity *s,Bool resetHealth);
