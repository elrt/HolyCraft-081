// Batch 009: minecraftpe/headers/item/TilePlanterItem.hpp
class TilePlanterItem { MCItem009 base;I32 blockID;MCPlaceContext009 *place; };
U0 TilePlanterItem_Init(TilePlanterItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id,I32 tile);Bool TilePlanterItem_useOn(TilePlanterItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz);Bool TilePlanterItem_isEmissive(TilePlanterItem *s,I32 unused);
