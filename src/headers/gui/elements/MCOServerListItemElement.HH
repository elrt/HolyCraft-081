// Batch022: gui/elements/MCOServerListItemElement; explicit host ABI, see docs/BATCH022.md.
class MCOServerListItemElement {MC022Box bounds,join,manage;MCOServerListItem item;I32 pressed;F32 downX,downY;Bool hasManage,joining;MC022DrawHost *host;};
U0 MCOServerListItemElement_Init(MCOServerListItemElement*,MCOServerListItem*,Bool,MC022DrawHost*);U0 MCOServerListItemElement_Destroy(MCOServerListItemElement*);
U0 MCOServerListItemElement_layout(MCOServerListItemElement*);U0 MCOServerListItemElement_tick(MCOServerListItemElement*,F32,F32);
U0 MCOServerListItemElement_mouseClicked(MCOServerListItemElement*,I32,I32,F32,F32);U0 MCOServerListItemElement_mouseReleased(MCOServerListItemElement*,I32,I32,Bool);U0 MCOServerListItemElement_render(MCOServerListItemElement*);
