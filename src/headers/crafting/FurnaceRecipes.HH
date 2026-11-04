// Batch 007: minecraftpe/headers/crafting/FurnaceRecipes.hpp
class MCFurnaceRegistry {
 I32 ironOre,ironIngot,goldOre,goldIngot,emeraldOre,emerald,sand,glass;
 I32 porkRaw,porkCooked,beefRaw,beefCooked,chickenRaw,chickenCooked;
 I32 stoneBrick,rock,clay,brick,cactus,dyePowder,mushroom2,treeTrunk,coal,netherrack,netherbrick,potato,potatoBaked;
};
class MCFurnaceEntry { I32 input; MCRecipeItem output; };
class FurnaceRecipes { MCVector recipes; };
MCFurnaceRegistry MC_furnaceRegistry;Bool MC_furnaceRegistryReady;FurnaceRecipes *FurnaceRecipes_instance;
U0 FurnaceRecipes_Init(FurnaceRecipes *self,MCFurnaceRegistry *registry);U0 FurnaceRecipes_Destroy(FurnaceRecipes *self);
U0 FurnaceRecipes_addFurnaceRecipe(FurnaceRecipes *self,I32 input,MCRecipeItem *output);
FurnaceRecipes *FurnaceRecipes_getInstance();U0 FurnaceRecipes_teardownFurnaceRecipes();
U0 FurnaceRecipes_getResult(FurnaceRecipes *self,I32 input,MCRecipeItem *out);Bool FurnaceRecipes_isFurnaceItem(FurnaceRecipes *self,I32 input);U0 FurnaceRecipes_getRecipes(FurnaceRecipes *self);
