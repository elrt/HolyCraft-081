// Batch026 partial source API; not original C++ ABI.
class LocalServerListItemElement {MCString name,address;LevelSummary summary;Bool local,edit,pressed,deletePressed;I32 type,port,ticks;F32 pressX,pressY;MCUIHost026 *host;};
U0 LocalServerListItemElement_Init(LocalServerListItemElement *s,MCUIHost026 *h);
U0 LocalServerListItemElement_setLevel(LocalServerListItemElement *s,LevelSummary *level);
U0 LocalServerListItemElement_setExternal(LocalServerListItemElement *s,ExternalServer *server);
U0 LocalServerListItemElement_getLastPlayedString(LocalServerListItemElement *s,I32 epoch,MCString *out);
U0 LocalServerListItemElement_mouseClicked(LocalServerListItemElement *s,F32 x,F32 y,Bool deleteButton);
U0 LocalServerListItemElement_tick(LocalServerListItemElement *s,F32 x,F32 y);
Bool LocalServerListItemElement_mouseReleased(LocalServerListItemElement *s,Bool inside);
U0 LocalServerListItemElement_Destroy(LocalServerListItemElement *s);
