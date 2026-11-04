// Batch 007: minecraftpe/headers/crafting/ShapelessRecipe.hpp
class ShapelessRecipe { Recipe base; MCVector results,ingredients; };
U0 ShapelessRecipe_Init(ShapelessRecipe *self,MCRecipeItem *results,I32 resultCount,MCRecipeItem *ingredients,I32 ingredientCount);
U0 ShapelessRecipe_Destroy(ShapelessRecipe *self);Bool ShapelessRecipe_matches(ShapelessRecipe *self,CraftingContainer *grid);
I32 ShapelessRecipe_getMaxCraftCount(ShapelessRecipe *self,ItemPack *available);I32 ShapelessRecipe_size(ShapelessRecipe *self);I32 ShapelessRecipe_getCraftingSize(ShapelessRecipe *self);MCVector *ShapelessRecipe_getResultItem(ShapelessRecipe *self);MCVector *ShapelessRecipe_assemble(ShapelessRecipe *self,CraftingContainer *grid);
