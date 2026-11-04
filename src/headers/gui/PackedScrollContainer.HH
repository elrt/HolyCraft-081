// Batch022: gui/PackedScrollContainer; explicit host ABI, see docs/BATCH022.md.
class PackedScrollContainer {MC022Box bounds;MCVector children;I32 padX,padY,contentHeight,flags,contentHalfHeight;F32 offset;Bool adaptive,hasPane;MC022DrawHost *host;};
U0 PackedScrollContainer_Init(PackedScrollContainer*,Bool,I32,I32,MC022DrawHost*);U0 PackedScrollContainer_Destroy(PackedScrollContainer*);
U0 PackedScrollContainer_setupPositions(PackedScrollContainer*);U0 PackedScrollContainer_render(PackedScrollContainer*,F32,I32);
Bool PackedScrollContainer_childVisible(PackedScrollContainer*,MC022Box*);U0 PackedScrollContainer_mouseClicked(PackedScrollContainer*,I32,I32,I32);
