// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class MCGridItem025 {I32 index,column,row;F32 x,y;};
class ScrollingPane {IntRectangle viewport,cell;I32 flags,count,columns,rows,contentWidth,contentHeight,selected,startItem,startTime,lastMoveTime;Bool *selections,tracking,dragging,decelerating,paging,dirty;F32 scale,offsetX,offsetY,minX,minY,velocityX,velocityY,beginX,beginY,anchorX,anchorY,initialOffsetX,initialOffsetY,lowerX,lowerY,upperX,upperY,spring,brake;U0 *context;Bool (*select)(U0*,I32,Bool);};

U0 ScrollingPane_adjustContentSize(ScrollingPane *s);
Bool ScrollingPane_Init(ScrollingPane *s,I32 flags,IntRectangle *viewport,IntRectangle *cell,I32 columns,I32 count,F32 scale);
U0 ScrollingPane_Destroy(ScrollingPane *s);
U0 ScrollingPane_setContentOffset(ScrollingPane *s,F32 x,F32 y);
U0 ScrollingPane_getItemForPos(ScrollingPane *s,F32 x,F32 y,Bool screen,MCGridItem025 *out);
U0 ScrollingPane_getGridItem(ScrollingPane *s,I32 index,MCGridItem025 *out);
U0 ScrollingPane_setSelected(ScrollingPane *s,I32 index,Bool selected);
U0 ScrollingPane_onSelect(ScrollingPane *s,I32 index);
F32 MC025_PaneClamp(F32 v,F32 min);
U0 ScrollingPane_snapContentOffsetToBounds(ScrollingPane *s);
U0 ScrollingPane_startDecelerationAnimation(ScrollingPane *s,I32 now,Bool force);
U0 ScrollingPane_stepThroughDecelerationAnimation(ScrollingPane *s);
U0 ScrollingPane_touchesBegan(ScrollingPane *s,F32 x,F32 y,I32 now);
F32 MC025_PaneRubber(F32 v,F32 min);
U0 ScrollingPane_touchesMoved(ScrollingPane *s,F32 x,F32 y,I32 now);
U0 ScrollingPane_touchesEnded(ScrollingPane *s,F32 x,F32 y,I32 now);
U0 ScrollingPane_translate(ScrollingPane *s,F32 x,F32 y);
