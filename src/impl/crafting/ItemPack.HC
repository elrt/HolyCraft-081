// Batch 007: minecraftpe/impl/crafting/ItemPack.cpp
U0 ItemPack_Init(ItemPack *self) { MCVector_Init(&self->items,sizeof(MCItemPackEntry)); }
U0 ItemPack_Destroy(ItemPack *self) { MCVector_Destroy(&self->items); }
U0 ItemPack_add(ItemPack *self,I32 id,I32 count) { I64 i;MCItemPackEntry *e;for(i=0;i<self->items.size;i++) { e=MCVector_At(&self->items,i);if(e->id==id) { e->count+=count;return; }if(e->id>id)break; } MCItemPackEntry next;next.id=id;next.count=count;MCVector_Insert(&self->items,i,&next); }
I32 ItemPack_getCount(ItemPack *self,I32 id) { I64 i;MCItemPackEntry *e;for(i=0;i<self->items.size;i++){ e=MCVector_At(&self->items,i);if(e->id==id)return e->count; }return 0; }
I32 ItemPack_getIdForItemInstance(MCRecipeItem *it) { I32 aux=it->aux;if(Recipe_isAnyAuxValue(it->id) || it->damageable)aux= -1;return it->id*512+aux; }
I32 ItemPack_getIdForItemInstanceAnyAux(MCRecipeItem *it) { return it->id*512-1; }
U0 ItemPack_getItemInstanceForId(MCRecipeItem *out,I32 id) { I32 v=id+256;if(v<0)v=id+767;out->id=v>>9;out->count=1;out->aux=(((id+256)&511)-256);out->damageable=FALSE; }
U0 ItemPack_getItemInstances(ItemPack *self,MCVector *out) { MCVector_Init(out,sizeof(MCRecipeItem));I64 i;MCItemPackEntry *e;MCRecipeItem item;for(i=0;i<self->items.size;i++) { e=MCVector_At(&self->items,i);ItemPack_getItemInstanceForId(&item,e->id);item.count=e->count;MCVector_Push(out,&item); } }
I32 ItemPack_getMaxMultipliesOf(ItemPack *self,ItemPack *required) { I32 result=99;I64 i,j;MCItemPackEntry *need,*have;for(i=0;i<required->items.size;i++) { need=MCVector_At(&required->items,i);have=NULL;for(j=0;j<self->items.size;j++) { MCItemPackEntry *e=MCVector_At(&self->items,j);if(e->id==need->id){have=e;break;} }if(!have || !need->count)return 0;I32 n=have->count/need->count;if(!n)return 0;if(result>=n)result=n; }return result; }
U0 ItemPack_print(ItemPack *self) { }
