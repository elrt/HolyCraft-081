// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class RolledSelectionListH {I32 width,height,slotWidth,count,header,pressed,initialX,initialTime,initialItem;F32 left,right,top,bottom,scroll,previous,velocity,delta,prior,mouse;};

U0 RolledSelectionListH_Init(RolledSelectionListH *s,I32 width,I32 height,I32 left,I32 right,I32 top,I32 bottom,I32 slot,I32 count);
I32 RolledSelectionListH_getItemAtXPositionRaw(RolledSelectionListH *s,I32 raw);
I32 RolledSelectionListH_getItemAtPosition(RolledSelectionListH *s,I32 x,I32 y);
Bool RolledSelectionListH_capXPosition(RolledSelectionListH *s);
U0 RolledSelectionListH_tick(RolledSelectionListH *s);
F32 RolledSelectionListH_getPos(RolledSelectionListH *s,F32 partial);
I32 RolledSelectionListH_updateInput(RolledSelectionListH *s,I32 x,I32 y,Bool down,I32 now,F32 partial);
