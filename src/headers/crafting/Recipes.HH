// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MCRecipesType024 {U8 key;MCRecipeItem item;Bool tile;};
class Recipes {MCRecipeBook009 book;};

U0 Recipes_Init(Recipes *s,MCRecipeIDs009 *ids,Bool families);
U0 Recipes_Destroy(Recipes *s);
Bool Recipes_addShapedRecipe(Recipes *s,MCRecipeItem *results,I32 resultCount,U8 **rows,I32 height,MCRecipesType024 *defs,I32 count);
Bool Recipes_addShapelessRecipe(Recipes *s,MCRecipeItem *result,MCRecipesType024 *defs,I32 count);
MCRecipeEntry009 *Recipes_getRecipeFor(Recipes *s,MCRecipeItem *item);
