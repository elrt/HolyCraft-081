// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Tile {MCRegistry023 *registry;Material *material;I32 id;F32 hardness,resistance;Bool ticking,replaceable;MC023Shape shape;MCString description;};

Bool Tile_Init(Tile *s,MCRegistry023 *r,I32 id,I32 material,Bool solid,Bool cube);
U0 Tile_Destroy(Tile *s);
U0 Tile_setLightBlock(Tile *s,I32 n);
U0 Tile_setLightEmission(Tile *s,F32 n);
U0 Tile_setExplodeable(Tile *s,F32 n);
U0 Tile_setDestroyTime(Tile *s,F32 n);
F32 Tile_getDestroyProgress(Tile *s,Bool canDestroy,F32 speed);
U0 Tile_setShape(Tile *s,F32 x,F32 y,F32 z,F32 xx,F32 yy,F32 zz);
U0 Tile_getAABB(Tile *s,I32 x,I32 y,I32 z,AABB *out);
Bool Tile_shouldRenderFace(Tile *s,MCWorld023 *w,I32 x,I32 y,I32 z,I32 face);

U0 Tile_bindMaterial(Tile *s,Material *material);
U0 Tile_spawnResources(Tile *s,Level *level,I32 x,I32 y,I32 z,I32 metadata,F32 chance);
