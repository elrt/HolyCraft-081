// Batch026 partial source API; not original C++ ABI.
class TouchInputHolder {IInputHolder base;TouchscreenInput move;UnifiedTurnBuild turn;Minecraft *minecraft;Gui *gui;};
Bool TouchInputHolder_allowPicking(IInputHolder *base);
U0 TouchInputHolder_onConfigChanged(TouchInputHolder *s,I32 w,I32 h,F32 pixels,F32 scale);
U0 TouchInputHolder_Init(TouchInputHolder *s,Minecraft *mc,Gui *gui,MCUI025 *ui,I32 w,I32 h,F32 pixels,F32 scale);
U0 TouchInputHolder_feed(TouchInputHolder *s,MCTouch026 *p,I32 n,MCTouchEvent026 *e,I32 count,F64 now);
U0 TouchInputHolder_Destroy(TouchInputHolder *s);
