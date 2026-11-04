// Batch026 partial source API; not original C++ ABI.
class TouchStartMenuScreen {MCMenu026 menu;I32 license,currentSplash;Bool realms,invalid;MCString splash;};
U0 TouchStartMenuScreen_updateLicense(TouchStartMenuScreen *s,I32 license);
U0 TouchStartMenuScreen_setupPlayButtons(TouchStartMenuScreen *s,Bool realms);
U0 TouchStartMenuScreen_chooseRandomSplash(TouchStartMenuScreen *s,Random *rng);
U0 TouchStartMenuScreen_action(MCMenu026 *m,I32 id);
U0 TouchStartMenuScreen_draw(MCMenu026 *m);
U0 TouchStartMenuScreen_Init(TouchStartMenuScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 TouchStartMenuScreen_Destroy(TouchStartMenuScreen *s);
