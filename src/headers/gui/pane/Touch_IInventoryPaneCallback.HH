// Abstract callback interface; host owns item references returned in the vector.
class Touch_IInventoryPaneCallback {U0 *host;Bool (*addItem)(U0 *,U0 *,I32);Bool (*isAllowed)(U0 *,I32);U0 (*getItems)(U0 *,U0 *,MCPtrVector *);};
