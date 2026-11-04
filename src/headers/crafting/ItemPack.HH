// Batch 007: minecraftpe/headers/crafting/ItemPack.hpp
class MCItemPackEntry { I32 id,count; };
class ItemPack { MCVector items; };
U0 ItemPack_Init(ItemPack *self);U0 ItemPack_Destroy(ItemPack *self);
U0 ItemPack_add(ItemPack *self,I32 id,I32 count);I32 ItemPack_getCount(ItemPack *self,I32 id);
I32 ItemPack_getIdForItemInstance(MCRecipeItem *it);I32 ItemPack_getIdForItemInstanceAnyAux(MCRecipeItem *it);
U0 ItemPack_getItemInstanceForId(MCRecipeItem *out,I32 id);U0 ItemPack_getItemInstances(ItemPack *self,MCVector *out);
I32 ItemPack_getMaxMultipliesOf(ItemPack *self,ItemPack *required);U0 ItemPack_print(ItemPack *self);
