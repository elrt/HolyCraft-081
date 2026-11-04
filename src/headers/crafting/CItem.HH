// Batch 009: minecraftpe/headers/crafting/CItem.hpp
class CItem_ReqItem { MCRecipeItem item; I32 field_14; };
class CItem { MCRecipeItem field_0; Recipe *recipe; MCString field_18,field_1C; I32 field_20,field_24; MCVector field_28; I8 field_34,field_35,field_36,field_37; };
U0 CItem_ReqItem_Init(CItem_ReqItem *self,MCRecipeItem *item,I32 count);U0 CItem_ReqItem_Copy(CItem_ReqItem *self,CItem_ReqItem *other);U0 CItem_Init(CItem *self,MCRecipeItem *item,Recipe *recipe,U8 *name);U0 CItem_Destroy(CItem *self);
