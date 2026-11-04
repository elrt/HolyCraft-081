// Batch026 partial source API; not original C++ ABI.
class ChestScreen {MCMenu026 menu;FillingContainer *left,*right;I32 percent,heldTicks,transfers;Bool needsSetup,ownsCache;Player *player;FillingContainer cache;};
Bool ChestScreen_handleAddItem(ChestScreen *s,FillingContainer *from,FillingContainer *to,I32 index);
U0 ChestScreen_action(MCMenu026 *m,I32 id);
U0 ChestScreen_Init(ChestScreen *s,MCUIHost026 *h,MCUI025 *ui,FillingContainer *player,FillingContainer *chest);
U0 ChestScreen_tick(ChestScreen *s);
U0 ChestScreen_onInternetUpdate(ChestScreen *s);
U0 ChestScreen_Destroy(ChestScreen *s);

U0 ChestScreen_InitPlayer(ChestScreen *s,MCUIHost026 *h,MCUI025 *ui,FillingContainer *chest);
