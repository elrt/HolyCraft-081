// Batch026 partial source API; not original C++ ABI.
class SelectWorldScreen {MCMenu026 menu;WorldSelectionList selection;Bool loading,failed;};
U0 SelectWorldScreen_getUniqueLevelName(SelectWorldScreen *s,MCString *name,MCString *out);
Bool SelectWorldScreen_isIndexValid(SelectWorldScreen *s,I32 index);
Bool SelectWorldScreen_select(SelectWorldScreen *s,I32 index);
U0 SelectWorldScreen_action(MCMenu026 *m,I32 id);
U0 SelectWorldScreen_tickMenu(MCMenu026 *m);
U0 SelectWorldScreen_draw(MCMenu026 *m);
U0 SelectWorldScreen_Init(SelectWorldScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 SelectWorldScreen_Destroy(SelectWorldScreen *s);
