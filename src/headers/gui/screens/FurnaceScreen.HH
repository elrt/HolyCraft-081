// Batch026 partial source API; not original C++ ABI.
class FurnaceScreen {MCMenu026 menu;Player *player;FurnaceTileEntity *furnace;MCVector fuels,ingredients;I32 selectedSlot,percent,heldTicks;Bool dirty;};
Bool FurnaceScreen_isAllowedItem(FurnaceScreen *s,ItemInstance *item);
Bool FurnaceScreen_canMoveToFurnace(FurnaceScreen *s,ItemInstance *item);
U0 FurnaceScreen_recheckRecipes(FurnaceScreen *s);
Bool FurnaceScreen_moveOver(FurnaceScreen *s,ItemInstance *item,I32 limit,ItemInstance *out);
Bool FurnaceScreen_handleAddItem(FurnaceScreen *s,ItemInstance *item);
Bool FurnaceScreen_takeAndClearSlot(FurnaceScreen *s,I32 slot);
U0 FurnaceScreen_action(MCMenu026 *m,I32 id);
U0 FurnaceScreen_Init(FurnaceScreen *s,MCUIHost026 *h,MCUI025 *ui,FurnaceTileEntity *furnace);
U0 FurnaceScreen_Destroy(FurnaceScreen *s);
