// Batch026 partial source API; not original C++ ABI.
class ManageMCOServerScreen {MCMenu026 menu;MCOServerListItem server;MCVector invites;Bool pending,failed;MCString error;};
Bool ManageMCOServerScreen_hasInvite(ManageMCOServerScreen *s,MCString *name);
Bool ManageMCOServerScreen_addInvite(ManageMCOServerScreen *s,MCString *name,Bool serverConfirmed);
Bool ManageMCOServerScreen_removeInvite(ManageMCOServerScreen *s,MCString *name,Bool serverConfirmed);
Bool ManageMCOServerScreen_update(ManageMCOServerScreen *s,MCString *name,Bool open);
U0 ManageMCOServerScreen_action(MCMenu026 *m,I32 id);
U0 ManageMCOServerScreen_Init(ManageMCOServerScreen *s,MCUIHost026 *h,MCUI025 *ui,MCOServerListItem *server);
U0 ManageMCOServerScreen_Destroy(ManageMCOServerScreen *s);
