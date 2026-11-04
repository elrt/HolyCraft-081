// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class TouchInventoryPane {ScrollingPane pane;Inventory *inventory;ItemRenderer *renderer;I32 selectedItem,invTicker,margin,heldItem;Bool renderDecorations;U0 *context;Bool (*allowed)(U0*,I32);Bool (*addItem)(U0*,I32);};

Bool TouchInventoryPane_onSelect(U0 *object,I32 index,Bool selected);
Bool TouchInventoryPane_Init(TouchInventoryPane *s,IntRectangle *viewport,I32 count,I32 cellSize,F32 scale,I32 margin,Inventory *inventory,ItemRenderer *renderer);
U0 TouchInventoryPane_tick(TouchInventoryPane *s);
F32 TouchInventoryPane_selectedBrightness(TouchInventoryPane *s,I32 index);
U0 TouchInventoryPane_itemPosition(TouchInventoryPane *s,I32 index,F32 *x,F32 *y);
U0 TouchInventoryPane_Destroy(TouchInventoryPane *s);
