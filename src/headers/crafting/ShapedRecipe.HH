// Batch 007: minecraftpe/headers/crafting/ShapedRecipe.hpp
class ShapedRecipe { Recipe base; I32 width,height; MCVector pattern,results; };
U0 ShapedRecipe_Init(ShapedRecipe *self,I32 width,I32 height,MCRecipeItem *pattern,MCRecipeItem *results,I32 resultCount);
U0 ShapedRecipe_Destroy(ShapedRecipe *self);Bool ShapedRecipe_matchesAt(ShapedRecipe *self,CraftingContainer *grid,I32 ox,I32 oy,Bool mirror);Bool ShapedRecipe_matches(ShapedRecipe *self,CraftingContainer *grid);
I32 ShapedRecipe_getMaxCraftCount(ShapedRecipe *self,ItemPack *available);I32 ShapedRecipe_size(ShapedRecipe *self);I32 ShapedRecipe_getCraftingSize(ShapedRecipe *self);MCVector *ShapedRecipe_getResultItem(ShapedRecipe *self);MCVector *ShapedRecipe_assemble(ShapedRecipe *self,CraftingContainer *grid);U0 ShapedRecipe_getItems(ShapedRecipe *self,MCVector *out);
