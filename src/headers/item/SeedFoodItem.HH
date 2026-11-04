// Batch 009: minecraftpe/headers/item/SeedFoodItem.hpp
class SeedFoodItem { FoodItem base;I32 plantId,placeId; };
U0 SeedFoodItem_Init(SeedFoodItem *s,MCItemContext009 *c,I32 id,I32 heal,F32 f48,I8 f4c,I32 plant,I32 place);Bool SeedFoodItem_useOn(SeedFoodItem *s,MCItemContext009 *c,MCPacketItem009 *it,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz);
