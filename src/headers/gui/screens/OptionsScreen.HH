// Batch026 partial source API; not original C++ ABI.
class OptionsScreen {MCMenu026 menu;Options *options;I32 category;Bool highlight[4],inGame;TextBox name;};
U0 OptionsScreen_selectCategory(OptionsScreen *s,I32 index);
Bool OptionsScreen_toggle(OptionsScreen *s,I32 id,I32 delta);
Bool OptionsScreen_setProgress(OptionsScreen *s,I32 id,F32 value);
U0 OptionsScreen_action(MCMenu026 *m,I32 id);
U0 OptionsScreen_Init(OptionsScreen *s,MCUIHost026 *h,MCUI025 *ui,Bool inGame);
U0 OptionsScreen_Destroy(OptionsScreen *s);
