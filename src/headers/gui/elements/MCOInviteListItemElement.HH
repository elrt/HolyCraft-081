// Batch022: gui/elements/MCOInviteListItemElement; explicit host ABI, see docs/BATCH022.md.
class MCOInviteListItemElement {MC022Box bounds,remove;MCString name;Bool completed,pressed;MC022DrawHost *host;};
U0 MCOInviteListItemElement_Init(MCOInviteListItemElement*,MCString*,MC022DrawHost*);U0 MCOInviteListItemElement_Destroy(MCOInviteListItemElement*);
U0 MCOInviteListItemElement_onFriendSearchCompleted(MCOInviteListItemElement*,MCString*);U0 MCOInviteListItemElement_setupPositions(MCOInviteListItemElement*);
U0 MCOInviteListItemElement_mouseClicked(MCOInviteListItemElement*,I32,I32,I32);U0 MCOInviteListItemElement_mouseReleased(MCOInviteListItemElement*,I32,I32,I32);U0 MCOInviteListItemElement_render(MCOInviteListItemElement*);
