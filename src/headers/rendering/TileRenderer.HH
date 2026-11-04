// Partial source renderer: six original face algorithms, cross/ladder/torch and flat-lit blocks.
class MCRenderTile027 {Tile *base;I32 id,kind,field_5C;U32 color;Bool grass,liquid;F32 minX,minY,minZ,maxX,maxY,maxZ;TextureUVCoordinateSet uv[6];};
class TileRenderer {Level *level;Tesselator *tess;MCRenderTile027 *views[256];Bool field_0,field_21,hasUVCoords,disableCulling,enableAO,overflow;TextureUVCoordinateSet field_8;I32 randomizeFace[6];F32 redXeYs,redXsYs,redXsYe,redXeYe,greenXeYs,greenXsYs,greenXsYe,greenXeYe,blueXeYs,blueXsYs,blueXsYe,blueXeYe;};
U0 TileRenderer_Init(TileRenderer *s,Level *level,Tesselator *tess);U0 MC027_RenderView(MCRenderTile027 *v,Tile *tile,I32 kind,TextureUVCoordinateSet *uv);Bool TileRenderer_canRender(I32 kind);U0 TileRenderer_randomize(TileRenderer *s,MCRenderTile027 *tile,I32 face,F32 x,F32 y,F32 z);F32 TileRenderer_getWaterHeight(TileRenderer *s,I32 x,I32 y,I32 z,I32 material);
Bool TileRenderer_tesselateBlock(TileRenderer *s,MCRenderTile027 *tile,I32 x,I32 y,I32 z,F32 r,F32 g,F32 b);Bool TileRenderer_tesselateInWorld(TileRenderer *s,I32 x,I32 y,I32 z);

U0 TileRenderer_renderEast(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6);
U0 TileRenderer_renderFaceDown(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6);
U0 TileRenderer_renderFaceUp(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6);
U0 TileRenderer_renderNorth(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6);
U0 TileRenderer_renderSouth(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *a6);
U0 TileRenderer_renderWest(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6);
U0 TileRenderer_tesselateCrossTexture(TileRenderer *s,MCRenderTile027 *tile,I32 d,F32 a4,F32 a5,F32 a6);
Bool TileRenderer_tesselateLadderInWorld(TileRenderer *s,MCRenderTile027 *tile,I32 x,I32 y,I32 z);
U0 TileRenderer_tesselateTorch(TileRenderer *s,MCRenderTile027 *tile,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
Bool TileRenderer_tesselateTorchInWorld(TileRenderer *s,MCRenderTile027 *tile,I32 x,I32 y,I32 z);
