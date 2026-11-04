#ifndef MC020_GRASSTILE
#define MC020_GRASSTILE
class GrassTile {MCTileHost020 *h;I32 blockID,field_5C;U0 *top,*side,*snow,*carried,*dirt;};
U0 GrassTile_Init(GrassTile *s,MCTileHost020 *h,I32 id);
Bool GrassTile_randomWalk(GrassTile *s,I32 *x,I32 *y,I32 *z,I32 n);
Bool GrassTile_onFertilized(GrassTile *s,I32 x,I32 y,I32 z);
U0 * GrassTile_getTexture(GrassTile *s,I32 face,I32 meta);
U0 * GrassTile_getWorldTexture(GrassTile *s,I32 x,I32 y,I32 z,I32 face);
U0 * GrassTile_getCarriedTexture(GrassTile *s,I32 face,I32 meta);
U0 GrassTile_tick(GrassTile *s,I32 x,I32 y,I32 z,Random *rng);
I32 GrassTile_getResource(GrassTile *s,I32 meta,Random *rng);
I32 GrassTile_getColor(GrassTile *s,I32 meta);
I32 GrassTile_getWorldColor(GrassTile *s,I32 x,I32 y,I32 z);
U0 GrassTile_Destroy(GrassTile *s);
#endif
