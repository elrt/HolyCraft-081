// Batch 007: original inline methods from ShapedRecipe.hpp; .cpp only includes header.
U0 ShapedRecipe_Init(ShapedRecipe *self,I32 w,I32 h,MCRecipeItem *pattern,MCRecipeItem *results,I32 resultCount) {
 if(w<1 || h<1 || w>3 || h>3 || !pattern || resultCount<0 || (resultCount && !results)) { printf("Invalid shaped recipe\n");exit(90); }
 self->width=w;self->height=h;ItemPack_Init(&self->base.items);MCVector_Init(&self->pattern,sizeof(MCRecipeItem));MCVector_Init(&self->results,sizeof(MCRecipeItem));I32 i;
 for(i=0;i<w*h;i++) { MCVector_Push(&self->pattern,&pattern[i]);if(!MCRecipeItem_isNull(&pattern[i]))ItemPack_add(&self->base.items,ItemPack_getIdForItemInstance(&pattern[i]),1); }
 for(i=0;i<resultCount;i++)MCVector_Push(&self->results,&results[i]);
}
U0 ShapedRecipe_Destroy(ShapedRecipe *self) { ItemPack_Destroy(&self->base.items);MCVector_Destroy(&self->pattern);MCVector_Destroy(&self->results); }
Bool ShapedRecipe_matchesAt(ShapedRecipe *self,CraftingContainer *grid,I32 ox,I32 oy,Bool mirror) {
 I32 x,y,px,py,index;MCRecipeItem empty;memset(&empty,0,sizeof(empty));MCRecipeItem *expected,*item;
 for(x=0;x<3;x++)for(y=0;y<3;y++) { px=x-ox;py=y-oy;expected=&empty;
 if(px>=0 && py>=0 && px<self->width && py<self->height) { index=px+py*self->width;if(mirror)index=self->width-px+py*self->width-1;expected=MCVector_At(&self->pattern,index); }
 item=CraftingContainer_getItem(grid,x,y);
 if(item || !MCRecipeItem_isNull(expected)) { if((!item)!=MCRecipeItem_isNull(expected))return FALSE;if(!MCRecipeItem_sameItem(expected,item))return FALSE;if(expected->aux!= -1 && expected->aux!=item->aux)return FALSE; }
 }return TRUE;
}
Bool ShapedRecipe_matches(ShapedRecipe *self,CraftingContainer *grid) { I32 x,y;for(x=0;x<=3-self->width;x++)for(y=0;y<=3-self->height;y++)if(ShapedRecipe_matchesAt(self,grid,x,y,TRUE) || ShapedRecipe_matchesAt(self,grid,x,y,FALSE))return TRUE;return FALSE; }
I32 ShapedRecipe_getMaxCraftCount(ShapedRecipe *self,ItemPack *available) { return ItemPack_getMaxMultipliesOf(available,&self->base.items); }
I32 ShapedRecipe_size(ShapedRecipe *self) { return self->width*self->height; }
I32 ShapedRecipe_getCraftingSize(ShapedRecipe *self) { if(self->width>2 || self->height>2)return Recipe_SIZE_3X3;return Recipe_SIZE_2X2; }
MCVector *ShapedRecipe_getResultItem(ShapedRecipe *self) { return &self->results; }
MCVector *ShapedRecipe_assemble(ShapedRecipe *self,CraftingContainer *grid) { return &self->results; }
U0 ShapedRecipe_getItems(ShapedRecipe *self,MCVector *out) { MCVector_Init(out,sizeof(MCRecipeItem)); }
