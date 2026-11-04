// Batch026 partial source API; not original C++ ABI.
class MCCreativeItem026 {ItemInstance item;I32 category;};
class CreativeInventoryScreen {MCMenu026 menu;MCVector items;MCVector filtered[4];I32 selectedCategory,missing;};
Bool CreativeInventoryScreen_populateItem(CreativeInventoryScreen *s,Bool tile,U8 *name,I32 count,I32 aux);
U0 CreativeInventoryScreen_populateFilteredItems(CreativeInventoryScreen *s);
Bool CreativeInventoryScreen_addItem(CreativeInventoryScreen *s,I32 index);
U0 CreativeInventoryScreen_action(MCMenu026 *m,I32 id);
U0 CreativeInventoryScreen_Init(CreativeInventoryScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 CreativeInventoryScreen_Destroy(CreativeInventoryScreen *s);
U0 CreativeInventoryScreen_populateItems(CreativeInventoryScreen *s);
