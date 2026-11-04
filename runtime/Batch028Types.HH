// Application integration contract v1; does not replace old source-port files.
class MCCatalog028 {
 MCRegistry023 registry;Tile tiles[256];Item items[512];MCRenderTile027 views[256];
 U8 *labels[512];Bool itemExists[512],placeable[256];I32 texIndex[256];
 F32 baseSpeed[512];TextureUVCoordinateSet itemUV[512],bucketUV[4];I32 palette[128],paletteMeta[128],paletteN;
};
class MCSection028 {Tesselator solid,liquid;U32 solidList,liquidList;Bool dirty,uploaded;I32 x,y,z;F32 distance;Bool visible;};
class MCChunk028 {MCSection028 section[8];};
class MCApp028 {
 MCCatalog028 catalog;Level level;Minecraft minecraft;IMoveInput input;
 BiomeSource biome;RandomLevelSource generator;MCFeatureWorld features;
 LiquidTileDynamic water,lava;LeafTile leaf;FireTile fire;
 TileRenderer tiler;GameRenderer camera;HitResult hit;MCChunk028 *meshes[256];
 RegionFile previous;Bool previousOpen,worldReady,generatorReady,initialized,graphics,locked;
 Bool creative,running,paused,inventory,debug,hideHUD,mouseGrabbed,mining,hasHit,unsaved,failed,lightsDirty;
 Bool keys[512],heldKeys[512],leftDown,rightDown,leftPressed,rightPressed,jumpPressed;I32 mineX,mineY,mineZ,mineFace,mineCooldown,placeCooldown;
 I32 width,height,guiWidth,guiHeight,mouseX,mouseY,page,ticks,frames,fps,draws,triangles,meshBuilds,generated,loaded;
 I32 seed,noticeTicks,selectedMenu;F32 previousFall,sunlight,skyR,skyG,skyB;
 U32 terrainTex,fontTex,itemTex,titleTex;I32 titleWidth,titleHeight;
 U8 worldPath[4096],activePath[4096],notice[256],error[512];
 MCVector restored;I32 savedLinks[9],savedSelected;Bool savedRuntime;U0 (*progress)(U0*,I32,I32);
};
U0 MC028_Dirty(MCApp028*,I32,I32,I32);
U0 MC028_Schedule(MCApp028*,I32,I32,I32,I32,I32);
U0 MC028_TileTick(U0*,I32,I32,I32,I32);
U0 MC028_LevelEvent(U0*,MCWorldEvent023*);
U0 MC028_WorldEvent(U0*,MCWorldEvent023*);
Bool MC028_Ensure(MCApp028*,I32,I32);
U0 MC028_Relight(MCApp028*);
U0 MC028_Notice(MCApp028*,U8*);
U0 MC028_Release(MCApp028*);
U0 MC028_SetPause(MCApp028*,Bool);
Bool MC028_Save(MCApp028*);
Bool MC028_BuildSection(MCApp028*,MCSection028*);
U0 MC028_Render(MCApp028*,F32);
U0 MC028_MeshDestroy(MCApp028*,MCSection028*);
