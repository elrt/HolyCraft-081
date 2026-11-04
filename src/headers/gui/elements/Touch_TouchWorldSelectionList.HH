// Batch026 partial source API; not original C++ ABI.
class TouchWorldSelectionList {WorldSelectionList base;Bool createPressed;};
U0 TouchWorldSelectionList_Init(TouchWorldSelectionList *s,I32 width,I32 height);
U0 TouchWorldSelectionList_commit(TouchWorldSelectionList *s);
I32 TouchWorldSelectionList_getNumberOfItems(TouchWorldSelectionList *s);
U0 TouchWorldSelectionList_step(TouchWorldSelectionList *s,I32 dir);
U0 TouchWorldSelectionList_selectStart(TouchWorldSelectionList *s,I32 index);
U0 TouchWorldSelectionList_selectCancel(TouchWorldSelectionList *s);
U0 TouchWorldSelectionList_selectItem(TouchWorldSelectionList *s,I32 index,Bool ignored);
U0 TouchWorldSelectionList_tick(TouchWorldSelectionList *s,Bool down);
U0 TouchWorldSelectionList_Destroy(TouchWorldSelectionList *s);
