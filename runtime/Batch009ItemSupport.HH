#ifndef MCPE_BATCH009_ITEM_SUPPORT
#define MCPE_BATCH009_ITEM_SUPPORT
// Host owns actual Item, Player, Level and entity objects; this is a projection.
class MCItem009 { I32 itemID,maxStackSize,maxDamage;Bool stackedByData; };
class MCItemContext009 { U0 *host;Random *worldRandom,*itemRandom;Bool invulnerable,hurt,instabuild,isClient;I32 bowlID;F32 playerX,playerY,playerZ;
 I32 fireID;Bool (*isRail)(U0 *host,I32 tile);U0 (*spawnMinecart)(U0 *host,F32 x,F32 y,F32 z,I32 type);
 U0 (*soundAt)(U0 *host,F32 x,F32 y,F32 z,U8 *name,F32 volume,F32 pitch);
 U0 (*hurtAndBreak)(U0 *host,MCPacketItem009 *item,I32 amount);
 U0 (*registerItem)(U0 *host,I32 id);U0 (*startUsing)(U0 *host,MCPacketItem009 *item,I32 ticks);U0 (*heal)(U0 *host,I32 amount);U0 (*playSound)(U0 *host,U8 *name,F32 volume,F32 pitch);
 I32 (*getTile)(U0 *host,I32 x,I32 y,I32 z);Bool (*isEmptyTile)(U0 *host,I32 x,I32 y,I32 z);U0 (*setTile)(U0 *host,I32 x,I32 y,I32 z,I32 id,I32 flags);
 U0 (*spawn)(U0 *host,I32 kind,F32 x,F32 y,F32 z);U0 (*interactEnemy)(U0 *host,MCPacketItem009 *item);
};
#define MCITEM_SPAWN_CAMERA 1
#define MCITEM_SPAWN_EGG 2
#define MCITEM_SPAWN_SNOWBALL 3
U0 MCItem009_Init(MCItem009 *s,MCItemContext009 *ctx,I32 id) { s->itemID=id+256;s->maxStackSize=64;s->maxDamage=0;s->stackedByData=FALSE;ctx->registerItem(ctx->host,s->itemID); }
#endif
