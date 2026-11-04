// Batch026 partial source API; not original C++ ABI.
class TouchIngameBlockSelectionScreen {MCMenu026 menu;I32 count;};
Bool TouchIngameBlockSelectionScreen_isAllowed(TouchIngameBlockSelectionScreen *s,I32 index);
Bool TouchIngameBlockSelectionScreen_addItem(TouchIngameBlockSelectionScreen *s,I32 index);
U0 TouchIngameBlockSelectionScreen_action(MCMenu026 *m,I32 id);
U0 TouchIngameBlockSelectionScreen_Init(TouchIngameBlockSelectionScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 TouchIngameBlockSelectionScreen_Destroy(TouchIngameBlockSelectionScreen *s);
