// Batch026 partial source API; not original C++ ABI.
class MCCraftRow026 {MCRecipeEntry009 *entry;MCVector required;MCVector *results;I32 owned,category;Bool craftable;MCString name;};
class PaneCraftingScreen {MCMenu026 menu;Player *player;Recipes *recipes;MCVector rows,order;I32 selected,craftSize;};
U0 PaneCraftingScreen_recheckRecipes(PaneCraftingScreen *s);
U0 PaneCraftingScreen_loadRecipes(PaneCraftingScreen *s);
Bool PaneCraftingScreen_craftSelectedItem(PaneCraftingScreen *s);
U0 PaneCraftingScreen_action(MCMenu026 *m,I32 id);
U0 PaneCraftingScreen_Init(PaneCraftingScreen *s,MCUIHost026 *h,MCUI025 *ui,Recipes *recipes,I32 size);
U0 PaneCraftingScreen_Destroy(PaneCraftingScreen *s);
