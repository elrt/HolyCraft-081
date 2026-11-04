// Batch026 partial source API; not original C++ ABI.
class WorldSelectionList {RolledSelectionListH list;MCVector items;I32 selected,ticks,activation;LevelSummary chosen;F32 time,duration,from,to;Bool tween,activated;};
U0 WorldSelectionList_Init(WorldSelectionList *s,I32 width,I32 height);
U0 WorldSelectionList_Destroy(WorldSelectionList *s);
U0 WorldSelectionList_add(WorldSelectionList *s,LevelSummary *item);
U0 WorldSelectionList_commit(WorldSelectionList *s);
U0 WorldSelectionList_tweenInited(WorldSelectionList *s);
U0 WorldSelectionList_step(WorldSelectionList *s,I32 step);
Bool WorldSelectionList_capXPosition(WorldSelectionList *s);
U0 WorldSelectionList_selectItem(WorldSelectionList *s,I32 index,Bool ignored);
F32 WorldSelectionList_getPos(WorldSelectionList *s,F32 partial);
U0 WorldSelectionList_tick(WorldSelectionList *s,Bool down);
