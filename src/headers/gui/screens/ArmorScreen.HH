// Batch026 partial source API; not original C++ ABI.
class ArmorScreen {MCMenu026 menu;Player *player;MCVector slots;Bool performUpdate;};
I32 ArmorScreen_slot(ArmorScreen *s,ItemInstance *item);
Bool ArmorScreen_canMoveToSlot(ArmorScreen *s,I32 slot,ItemInstance *item);
U0 ArmorScreen_updateItems(ArmorScreen *s);
Bool ArmorScreen_takeAndClearSlot(ArmorScreen *s,I32 slot);
Bool ArmorScreen_addItem(ArmorScreen *s,I32 index);
U0 ArmorScreen_action(MCMenu026 *m,I32 id);
U0 ArmorScreen_Init(ArmorScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 ArmorScreen_Destroy(ArmorScreen *s);
