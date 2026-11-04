// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class ServerPlayer {MCPlayer023 *player;I32 lastSentHealth,counter,container,useDuration;Bool riding,jumping,sneaking;F32 strafe,forward;U0 *ctx;U0 (*send)(U0*,Packet*);U0 (*menu)(U0*,I32,I32,U0*);};

U0 ServerPlayer_Init(ServerPlayer *s,MCPlayer023 *player);
U0 ServerPlayer_nextContainerCounter(ServerPlayer *s);
U0 ServerPlayer_setPlayerInput(ServerPlayer *s,F32 strafe,F32 forward,Bool jump,Bool sneak);
U0 ServerPlayer_tick(ServerPlayer *s);
U0 ServerPlayer_open(ServerPlayer *s,I32 type,I32 slots,I32 x,I32 y,I32 z,U0 *object);
U0 ServerPlayer_openContainer(ServerPlayer *s,ChestTileEntity *chest);
U0 ServerPlayer_openFurnace(ServerPlayer *s,FurnaceTileEntity *f);
U0 ServerPlayer_closeContainer(ServerPlayer *s);
U0 ServerPlayer_slotChanged(ServerPlayer *s,I32 slot,ItemInstance *item,Bool suppress);
Bool ServerPlayer_hasResource(I32 unused);
