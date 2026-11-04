// Batch 009: minecraftpe/impl/crafting/CItem.cpp includes the header only.
U0 CItem_ReqItem_Init(CItem_ReqItem *self,MCRecipeItem *item,I32 count) { self->item=*item;self->field_14=count; }
U0 CItem_ReqItem_Copy(CItem_ReqItem *self,CItem_ReqItem *other) { *self=*other; }
U0 CItem_Init(CItem *self,MCRecipeItem *item,Recipe *recipe,U8 *name) { memset(self,0,sizeof(CItem));self->field_0=*item;self->recipe=recipe;MCString_FromC(&self->field_18,name);MCString_FromC(&self->field_1C,name);MCVector_Init(&self->field_28,sizeof(CItem_ReqItem)); }
U0 CItem_Destroy(CItem *self) { MCString_Destroy(&self->field_18);MCString_Destroy(&self->field_1C);MCVector_Destroy(&self->field_28); }
