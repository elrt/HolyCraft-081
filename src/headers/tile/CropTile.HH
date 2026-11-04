#ifndef MC020_CROPTILE
#define MC020_CROPTILE
class CropTile {MCTileHost020 *h;I32 blockID;MCString name;};
U0 CropTile_Init(CropTile *s,MCTileHost020 *h,I32 id,MCString *name);
F32 CropTile_getGrowthSpeed(CropTile *s,I32 x,I32 y,I32 z);
I32 CropTile_getRenderShape(CropTile *s);
U0 * CropTile_getTexture(CropTile *s,I32 face,I32 meta);
U0 * CropTile_getWorldTexture(CropTile *s,I32 x,I32 y,I32 z,I32 face);
U0 CropTile_tick(CropTile *s,I32 x,I32 y,I32 z,Random *rng);
I32 CropTile_getResource(CropTile *s,I32 meta,Random *rng);
I32 CropTile_getResourceCount(CropTile *s,Random *rng);
U0 CropTile_spawnResources(CropTile *s,I32 x,I32 y,I32 z,I32 meta,F32 chance);
Bool CropTile_mayPlaceOn(CropTile *s,I32 id);
I32 CropTile_getBaseSeed(CropTile *s);
I32 CropTile_getBasePlantId(CropTile *s);
U0 CropTile_Destroy(CropTile *s);
#endif
