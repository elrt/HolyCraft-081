// Batch 007: original inline methods from ShapelessRecipe.hpp; .cpp only includes header.
U0 ShapelessRecipe_Init(ShapelessRecipe *self,MCRecipeItem *results,I32 resultCount,MCRecipeItem *ingredients,I32 ingredientCount) {
 if(resultCount<0 || ingredientCount<0 || (resultCount && !results) || (ingredientCount && !ingredients)) { printf("Invalid shapeless recipe\n");exit(90); }
 ItemPack_Init(&self->base.items);MCVector_Init(&self->results,sizeof(MCRecipeItem));MCVector_Init(&self->ingredients,sizeof(MCRecipeItem));I32 i;
 for(i=0;i<resultCount;i++)MCVector_Push(&self->results,&results[i]);
 for(i=0;i<ingredientCount;i++) { MCVector_Push(&self->ingredients,&ingredients[i]);if(!MCRecipeItem_isNull(&ingredients[i]))ItemPack_add(&self->base.items,ItemPack_getIdForItemInstance(&ingredients[i]),1); }
}
U0 ShapelessRecipe_Destroy(ShapelessRecipe *self) { ItemPack_Destroy(&self->base.items);MCVector_Destroy(&self->results);MCVector_Destroy(&self->ingredients); }
Bool ShapelessRecipe_matches(ShapelessRecipe *self,CraftingContainer *grid) {
 MCVector remaining;MCVector_Init(&remaining,sizeof(MCRecipeItem));I64 k;for(k=0;k<self->ingredients.size;k++)MCVector_Push(&remaining,MCVector_At(&self->ingredients,k));
 I32 x,y;MCRecipeItem *it,*candidate,*entry;for(y=0;y<3;y++)for(x=0;x<3;x++) { it=CraftingContainer_getItem(grid,x,y);if(it) { candidate=NULL;for(k=0;k<self->ingredients.size;k++) { entry=MCVector_At(&self->ingredients,k);if(MCRecipeItem_sameItem(entry,it))if(entry->aux== -1 || entry->aux==it->aux) { candidate=entry;break; } }
 if(!candidate) { MCVector_Destroy(&remaining);return FALSE; }
 for(k=0;k<remaining.size;k++) { entry=MCVector_At(&remaining,k);if(MCRecipeItem_equals(entry,candidate)) { MCVector_Erase(&remaining,k);break; } }
 } }
 Bool matched=(remaining.size==0);MCVector_Destroy(&remaining);return matched;
}
I32 ShapelessRecipe_getMaxCraftCount(ShapelessRecipe *self,ItemPack *available) { return ItemPack_getMaxMultipliesOf(available,&self->base.items); }
I32 ShapelessRecipe_size(ShapelessRecipe *self) { return self->ingredients.size; }
I32 ShapelessRecipe_getCraftingSize(ShapelessRecipe *self) { if(self->ingredients.size)return Recipe_SIZE_2X2;return Recipe_SIZE_3X3; }
MCVector *ShapelessRecipe_getResultItem(ShapelessRecipe *self) { return &self->results; }
MCVector *ShapelessRecipe_assemble(ShapelessRecipe *self,CraftingContainer *grid) { return &self->results; }
