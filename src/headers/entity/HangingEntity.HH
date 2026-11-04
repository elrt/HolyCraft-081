// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class HangingEntity {MCBody023 body;I32 tileX,tileY,tileZ,direction,ticker,widthPx,heightPx;MC023Shape bounds;U0 *ctx;Bool (*survives)(U0*,HangingEntity*);U0 (*drop)(U0*,HangingEntity*);};

F32 HangingEntity_offs(I32 n);
U0 HangingEntity_setDir(HangingEntity *s,I32 dir);
U0 HangingEntity_Init(HangingEntity *s,MCWorld023 *world,I32 x,I32 y,I32 z,I32 width,I32 height,I32 direction);
U0 HangingEntity_move(HangingEntity *s,F32 x,F32 y,F32 z);
U0 HangingEntity_tick(HangingEntity *s);
Bool HangingEntity_hurt(HangingEntity *s,Bool player,Bool creative);
U0 HangingEntity_save(HangingEntity *s,CompoundTag *t);
U0 HangingEntity_load(HangingEntity *s,CompoundTag *t);
