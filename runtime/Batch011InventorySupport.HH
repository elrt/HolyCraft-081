class MCInventoryItem011 {I32 count,metadata;U0 *itemClass,*tileClass;Bool valid;};
class MCInventoryHost011 {U0 *host;I32 (*size)(U0 *);MCInventoryItem011 *(*get)(U0 *,I32);U0 (*set)(U0 *,I32,MCInventoryItem011 *);U0 (*open)(U0 *);U0 (*close)(U0 *);};
class MCMenuListener011 {U0 *host;U0 (*refresh)(U0 *,U0 *,MCVector *);U0 (*slotChanged)(U0 *,U0 *,I32,MCInventoryItem011 *,Bool);U0 (*setData)(U0 *,U0 *,I32,I32);};
