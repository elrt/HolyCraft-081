// Batch022: gui/pane/ItemPane; explicit host ABI, see docs/BATCH022.md.
class MC022ItemRow {I32 itemId,aux,count;MCString label;Bool craftable;};
class MC022GridItem {I32 index;F32 x,y;Bool selected;};
class MC022ItemDraw {MC022ItemRow *item;F32 x,y,scale;I32 phase;};
class ItemPane {MC022Box bounds;I32 cellW,cellH,physicalHeight,flags,rows,columns;F32 scale;Bool vertical;MC022DrawHost *host;};
U0 ItemPane_Init(ItemPane*,MC022Box*,I32,I32,I32,Bool,F32,MC022DrawHost*);
U0 ItemPane_renderBatch(ItemPane*,MCVector*,MCVector*);Bool ItemPane_onSelect(ItemPane*,I32,Bool);U0 ItemPane_drawScrollBar(ItemPane*,F32,F32,F32,F32,F32);
