// Batch026 partial source API; not original C++ ABI.
class TorchTile {Tile base;I32 fence,glass,wall,smokeParticle,flameParticle;};
Bool TorchTile_Init(TorchTile *s,MCRegistry023 *r,I32 id,I32 fence,I32 glass,I32 wall);
Bool TorchTile__canBePlacedOn(TorchTile *s,MCWorld023 *w,I32 x,I32 y,I32 z);
Bool TorchTile_mayPlace(TorchTile *s,MCWorld023 *w,I32 x,I32 y,I32 z);
Bool TorchTile_checkCanSurvive(TorchTile *s,Level *l,I32 x,I32 y,I32 z);
I32 TorchTile_getPlacementDataValue(TorchTile *s,MCWorld023 *w,I32 x,I32 y,I32 z,I32 face,I32 old);
U0 TorchTile_onPlace(TorchTile *s,Level *l,I32 x,I32 y,I32 z);
U0 TorchTile_neighborChanged(TorchTile *s,Level *l,I32 x,I32 y,I32 z);
U0 TorchTile_tick(TorchTile *s,Level *l,I32 x,I32 y,I32 z);
U0 TorchTile_animateTick(TorchTile *s,Level *l,I32 x,I32 y,I32 z);
U0 TorchTile_clipShape(TorchTile *s,I32 meta);
