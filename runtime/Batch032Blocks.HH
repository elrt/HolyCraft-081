// Batch032: functional blocks (ChestTileEntity / FurnaceTileEntity + ChestScreen / FurnaceScreen touch UI,
// doors, trapdoors, fence gates, beds, cake, TNT + Explosion, hoe/seeds/crops/bonemeal, random ticks).
#define G32S_CHEST 13
#define G32S_FURNACE 14
#define MC32_MAXTE 1024
#define MC32_SLOTS 27
class MC32TE {I32 kind,x,y,z,burn,burnDur,cook,pad;ItemInstance *it[MC32_SLOTS];};
MC32TE *g32_te[MC32_MAXTE];
I32 g32_teN;
MC32TE *g32_open;MC32TE *g32_pair;
Bool g32_openReq;
I32 g32_explosions,g32_primed,g32_smelted;
U0 MC032_Clear();
Bool MC032_Start(MCApp028 *s,I32 active);
Bool MC032_SaveTiles(MCApp028 *s,U8 *stage);
U0 MC032_Tick(MCApp028 *s);
I32 MC032_UseOn(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face);
Bool MC032_TileUse(MCApp028 *s,I32 x,I32 y,I32 z);
Bool MC032_UseHeld(MCApp028 *s,ItemInstance *held,I32 tile,I32 x,I32 y,I32 z);
U0 MC032_WillDestroy(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
Bool MC032_Drops(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
Bool MC032_Tess(MCApp028 *s,MCRenderTile027 *v,I32 id,I32 meta,I32 x,I32 y,I32 z);
Bool MC032_Box(MCApp028 *s,I32 id,I32 x,I32 y,I32 z,Bool collision,AABB *out);
U0 MC032_Render(MCApp028 *s,F32 partial);
I32 MC032_Placed(MCApp028 *s,I32 id,I32 meta,I32 face);
