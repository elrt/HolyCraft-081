// Batch026 partial source API; not original C++ ABI.
class IngameBlockSelectionScreen {MCMenu026 menu;I32 columns,rows,count,selected;};
I32 IngameBlockSelectionScreen_getSlotHeight(IngameBlockSelectionScreen *s);
I32 IngameBlockSelectionScreen_getSlotPosX(IngameBlockSelectionScreen *s,I32 column);
I32 IngameBlockSelectionScreen_getSlotPosY(IngameBlockSelectionScreen *s,I32 row);
I32 IngameBlockSelectionScreen_getSelectedSlot(IngameBlockSelectionScreen *s,I32 x,I32 y);
Bool IngameBlockSelectionScreen_isAllowed(IngameBlockSelectionScreen *s,I32 index);
Bool IngameBlockSelectionScreen_selectSlotAndClose(IngameBlockSelectionScreen *s);
U0 IngameBlockSelectionScreen_keyPressed(IngameBlockSelectionScreen *s,I32 key);
U0 IngameBlockSelectionScreen_action(MCMenu026 *m,I32 id);
U0 IngameBlockSelectionScreen_Init(IngameBlockSelectionScreen *s,MCUIHost026 *h,MCUI025 *ui,I32 columns);
U0 IngameBlockSelectionScreen_Destroy(IngameBlockSelectionScreen *s);
