#ifndef MCPE_BATCH005_BLOCK_SUPPORT
#define MCPE_BATCH005_BLOCK_SUPPORT
class MCBlockState;
class MCBlockWorld { U0 *context;Bool isClient;
I32 (*getTile)(U0 *c,I32 x,I32 y,I32 z);I32 (*getData)(U0 *c,I32 x,I32 y,I32 z);I32 (*brightness)(U0 *c,I32 x,I32 y,I32 z);I32 (*rawBrightness)(U0 *c,I32 x,I32 y,I32 z);Bool (*canSeeSky)(U0 *c,I32 x,I32 y,I32 z);Bool (*setTile)(U0 *c,I32 x,I32 y,I32 z,I32 id,I32 flags);Material *(*getMaterial)(U0 *c,I32 x,I32 y,I32 z);Bool (*hasChunksAt)(U0 *c,I32 x,I32 y,I32 z,I32 x2,I32 y2,I32 z2);U0 (*addTick)(U0 *c,I32 x,I32 y,I32 z,I32 id,I32 delay);U0 *(*createFalling)(U0 *c,F32 x,F32 y,F32 z,I32 id,I32 data);U0 (*addEntity)(U0 *c,U0 *entity);
};
class MCBlockActor { U0 *context;U0 (*craft)(U0 *c,I32 x,I32 y,I32 z,I32 type);U0 (*stonecut)(U0 *c,I32 x,I32 y,I32 z);U0 (*web)(U0 *c); };
class MCBlockState { I32 blockID,field_5C;Material *material;TextureUVCoordinateSet textureUV;F32 slipperiness;Bool ticking;F32 shape[6];TextureUVCoordinateSet *(*dirTexture)(MCBlockState *self,I32 side,I32 data);Bool (*survive)(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z);Bool (*soil)(MCBlockState *self,I32 id);I32 (*tickDelay)(MCBlockState *self);U0 (*fall)(MCBlockState *self,U0 *entity); };
class MCBlockHost { U0 (*init)(MCBlockState *self,MCString *name);U0 (*destroy)(MCBlockState *self);TextureAtlasTextureItem *(*texture)(MCString *name);Bool (*face)(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side);U0 (*spawn)(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 data,F32 chance);U0 (*neighbor)(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d); };
MCBlockHost MC_blockHost;
class MCBlockRegistry { I32 stoneBrick,fire,coalOre,emeraldOre,lapisOre,calmWater,water,grass,dirt,farmland;I32 flint,clay,book,yellowDust,string,snowBall,coal,emerald,dye_powder,melon;I32 lightBlock[4096];Material *materials[4096];MCString woodNames[4]; };
MCBlockRegistry MC_blocks;
U0 MCBlockMissing() { printf("Missing Tile/Level/actor host dependency\n");exit(87); }
U0 MCBlock_Init(MCBlockState *self,I32 id,MCString *name,Material *mat) { memset(self,0,sizeof(MCBlockState));self->blockID=id;self->material=mat;if(!MC_blockHost.init)MCBlockMissing();MC_blockHost.init(self,name); }
U0 MCBlock_Destroy(MCBlockState *self) { if(!MC_blockHost.destroy)MCBlockMissing();MC_blockHost.destroy(self); }
TextureAtlasTextureItem *MCBlock_Texture(MCString *name) { if(!MC_blockHost.texture)MCBlockMissing();TextureAtlasTextureItem *p=MC_blockHost.texture(name);if(!p)MCBlockMissing();return p; }
TextureAtlasTextureItem *MCBlock_TextureC(U8 *name) { MCString str;MCString_FromC(&str,name);TextureAtlasTextureItem *p=MCBlock_Texture(&str);MCString_Destroy(&str);return p; }
TextureUVCoordinateSet MCBlock_UV(U8 *name,I32 i) { return *TextureAtlasTextureItem_getUV(MCBlock_TextureC(name),i); }
U0 MCBlock_Spawn(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 data,F32 chance=1.0) { if(!MC_blockHost.spawn)MCBlockMissing();MC_blockHost.spawn(self,w,x,y,z,data,chance); }
Bool MCBlock_Face(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side) { if(!MC_blockHost.face)MCBlockMissing();return MC_blockHost.face(self,w,x,y,z,side); }
U0 MCBlock_Neighbor(MCBlockState *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d) { if(!MC_blockHost.neighbor)MCBlockMissing();MC_blockHost.neighbor(self,w,x,y,z,a,b,c,d); }
I32 MCLeafWorld_getTile(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->getTile) { printf("Missing world callback: getTile\n");MCBlockMissing(); }return w->getTile(w->context,x,y,z); }
I32 MCLeafWorld_getData(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->getData) { printf("Missing world callback: getData\n");MCBlockMissing(); }return w->getData(w->context,x,y,z); }
I32 MCLeafWorld_brightness(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->brightness) { printf("Missing world callback: brightness\n");MCBlockMissing(); }return w->brightness(w->context,x,y,z); }
I32 MCLeafWorld_rawBrightness(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->rawBrightness) { printf("Missing world callback: rawBrightness\n");MCBlockMissing(); }return w->rawBrightness(w->context,x,y,z); }
Bool MCLeafWorld_canSeeSky(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->canSeeSky) { printf("Missing world callback: canSeeSky\n");MCBlockMissing(); }return w->canSeeSky(w->context,x,y,z); }
Bool MCLeafWorld_setTile(MCBlockWorld *w,I32 x,I32 y,I32 z,I32 id,I32 flags) { if(!w || !w->setTile) { printf("Missing world callback: setTile\n");MCBlockMissing(); }return w->setTile(w->context,x,y,z,id,flags); }
Material * MCLeafWorld_getMaterial(MCBlockWorld *w,I32 x,I32 y,I32 z) { if(!w || !w->getMaterial) { printf("Missing world callback: getMaterial\n");MCBlockMissing(); }return w->getMaterial(w->context,x,y,z); }
Bool MCLeafWorld_hasChunksAt(MCBlockWorld *w,I32 x,I32 y,I32 z,I32 x2,I32 y2,I32 z2) { if(!w || !w->hasChunksAt) { printf("Missing world callback: hasChunksAt\n");MCBlockMissing(); }return w->hasChunksAt(w->context,x,y,z,x2,y2,z2); }
U0 MCLeafWorld_addTick(MCBlockWorld *w,I32 x,I32 y,I32 z,I32 id,I32 delay) { if(!w || !w->addTick) { printf("Missing world callback: addTick\n");MCBlockMissing(); }w->addTick(w->context,x,y,z,id,delay); }
U0 * MCLeafWorld_createFalling(MCBlockWorld *w,F32 x,F32 y,F32 z,I32 id,I32 data) { if(!w || !w->createFalling) { printf("Missing world callback: createFalling\n");MCBlockMissing(); }return w->createFalling(w->context,x,y,z,id,data); }
U0 MCLeafWorld_addEntity(MCBlockWorld *w,U0 *entity) { if(!w || !w->addEntity) { printf("Missing world callback: addEntity\n");MCBlockMissing(); }w->addEntity(w->context,entity); }
#endif
