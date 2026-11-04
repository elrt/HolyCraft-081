// Batch 007: minecraftpe/headers/crafting/CraftingContainer.hpp
// Borrowed slots. A NULL pointer differs from a pointer to a null item.
class CraftingContainer { U0 *context; I32 width; MCRecipeItem *(*getSlot)(U0 *context,I32 index); };
MCRecipeItem *CraftingContainer_getItem(CraftingContainer *self,I32 x,I32 y);
