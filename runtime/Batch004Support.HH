#ifndef MCPE_BATCH004_SUPPORT
#define MCPE_BATCH004_SUPPORT
// Explicit host boundary: these are world operations, not a substitute Level implementation.
I32 MCAbs004(I32 value) { if(value<0)return -value;return value; }
class MCFeatureWorld {
 U0 *context;
 I32 seed;
 Bool instantTick;
 I32 (*getTile)(U0 *context,I32 x,I32 y,I32 z);
 U0 (*setBlock)(U0 *context,I32 x,I32 y,I32 z,I32 id,I32 data,I32 flags);
 I32 (*getMaterial)(U0 *context,I32 x,I32 y,I32 z);
 Bool (*canSurvive)(U0 *context,I32 id,I32 x,I32 y,I32 z);
 U0 (*tick)(U0 *context,I32 id,I32 x,I32 y,I32 z,Random *random);
};
class MCFeatureRegistry { I32 leaves,grass,dirt,treeTrunk,cactus,reeds,sand,clay,rock; I32 waterMaterial; Bool solid[4096]; };
MCFeatureRegistry MC_featureTiles;
U0 MCFeatureWorld_Require(MCFeatureWorld *w) { if(!w || !w->getTile || !w->setBlock || !w->getMaterial || !w->canSurvive || !w->tick) { printf("Missing feature world backend\n"); exit(84); } }
I32 MCWorld_getTile(MCFeatureWorld *w,I32 x,I32 y,I32 z) { return w->getTile(w->context,x,y,z); }
Bool MCWorld_isEmptyTile(MCFeatureWorld *w,I32 x,I32 y,I32 z) { return MCWorld_getTile(w,x,y,z)==0; }
I32 MCWorld_getMaterial(MCFeatureWorld *w,I32 x,I32 y,I32 z) { return w->getMaterial(w->context,x,y,z); }
U0 MCWorld_setTileNoUpdate(MCFeatureWorld *w,I32 x,I32 y,I32 z,I32 id) { w->setBlock(w->context,x,y,z,id,0,0); }
U0 MCWorld_setTileAndDataNoUpdate(MCFeatureWorld *w,I32 x,I32 y,I32 z,I32 id,I32 data) { w->setBlock(w->context,x,y,z,id,data,0); }
U0 MCWorld_setTileAndData(MCFeatureWorld *w,I32 x,I32 y,I32 z,I32 id,I32 data,I32 flags) { w->setBlock(w->context,x,y,z,id,data,flags); }
U0 MCWorld_setTile(MCFeatureWorld *w,I32 x,I32 y,I32 z,I32 id,I32 flags) { w->setBlock(w->context,x,y,z,id,0,flags); }
Bool MCWorld_canSurvive(MCFeatureWorld *w,I32 id,I32 x,I32 y,I32 z) { return w->canSurvive(w->context,id,x,y,z); }
U0 MCWorld_tick(MCFeatureWorld *w,I32 id,I32 x,I32 y,I32 z,Random *random) { w->tick(w->context,id,x,y,z,random); }
I32 MCWorld_getSeed(MCFeatureWorld *w) { return w->seed; }
#endif
