// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class RolledSelectionListV {I32 width,height,slotHeight,count,header,pressed,initialY,initialItem;F32 left,right,top,bottom,scroll,previous,velocity,delta,prior,mouse,dragBudget;Bool cancelled;};

U0 RolledSelectionListV_Init(RolledSelectionListV *s,I32 width,I32 height,I32 left,I32 right,I32 top,I32 bottom,I32 slot,I32 count);
I32 RolledSelectionListV_getItemAtYPositionRaw(RolledSelectionListV *s,I32 raw);
I32 RolledSelectionListV_getItemAtPosition(RolledSelectionListV *s,I32 x,I32 y);
I32 RolledSelectionListV_getMaxPosition(RolledSelectionListV *s);
I32 RolledSelectionListV_capYPosition(RolledSelectionListV *s);
U0 RolledSelectionListV_tick(RolledSelectionListV *s,Bool down);
F32 RolledSelectionListV_getPos(RolledSelectionListV *s,F32 partial);
U0 RolledSelectionListV_evaluate(RolledSelectionListV *s,I32 y);
I32 RolledSelectionListV_updateInput(RolledSelectionListV *s,I32 x,I32 y,Bool down,F32 partial);
