// Batch 009: minecraftpe/headers/item/FoodItem.hpp
class FoodItem { MCItem009 base; I32 healAmount;F32 field_48;I8 field_4C; };
U0 FoodItem_Init(FoodItem *s,MCItemContext009 *c,I32 id,I32 heal,F32 f48,I8 f4c);MCPacketItem009 *FoodItem_use(FoodItem *s,MCItemContext009 *c,MCPacketItem009 *it);I32 FoodItem_getMaxUseDuration(FoodItem *s);U0 FoodItem_useTimeDepleted(FoodItem *s,MCItemContext009 *c,MCPacketItem009 *it,MCPacketItem009 *out);I32 FoodItem_getUseAnimation(FoodItem *s);Bool FoodItem_isFood(FoodItem *s);
