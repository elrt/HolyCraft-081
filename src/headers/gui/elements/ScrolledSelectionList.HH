// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class ScrolledSelectionList {I32 width,height,slotHeight,count,header,pressed,startY,startTime,lastY;F32 top,bottom,scroll,velocity,previousY;Bool renderSelection;};

U0 ScrolledSelectionList_Init(ScrolledSelectionList *s,I32 width,I32 height,I32 top,I32 bottom,I32 slot,I32 count);
U0 ScrolledSelectionList_setRenderHeader(ScrolledSelectionList *s,Bool render,I32 height);
I32 ScrolledSelectionList_getMaxPosition(ScrolledSelectionList *s);
I32 ScrolledSelectionList_getItemAtPosition(ScrolledSelectionList *s,I32 x,I32 y);
F32 ScrolledSelectionList_capYPosition(ScrolledSelectionList *s);
I32 ScrolledSelectionList_updateInput(ScrolledSelectionList *s,I32 x,I32 y,Bool down,I32 now);
