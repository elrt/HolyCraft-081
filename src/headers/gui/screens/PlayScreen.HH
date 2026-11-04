// Batch026 partial source API; not original C++ ABI.
class PlayScreen {MCMenu026 menu;PlayScreenStateSetting settings[13];I32 state,previous,panel;Bool editing,pending,failed;};
Bool PlayScreen_setPlayScreenStateSetting(PlayScreen *s,I32 state,Bool a,Bool b,Bool c,Bool d,Bool e,Bool f,I32 panel,MCString *text);
Bool PlayScreen_setPlayScreenSate(PlayScreen *s,I32 state,Bool force);
Bool PlayScreen_joinMCOServer(PlayScreen *s,MCOServerListItem *server);
U0 PlayScreen_action(MCMenu026 *m,I32 id);
U0 PlayScreen_Init(PlayScreen *s,MCUIHost026 *h,MCUI025 *ui,Bool local);
U0 PlayScreen_Destroy(PlayScreen *s);
