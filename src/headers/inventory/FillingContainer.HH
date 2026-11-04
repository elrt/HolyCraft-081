// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class FillingContainer {MCRegistry023 *registry;I32 size,linkedCount,maxStack;I32 *links;ItemInstance **items;Bool creative;U0 *dropContext;U0 (*drop)(U0*,ItemInstance*,Bool);};

U0 FillingContainer_Init(FillingContainer *s,MCRegistry023 *r,I32 size,I32 links,I32 maxStack,Bool creative);
U0 FillingContainer_Destroy(FillingContainer *s);
I32 FillingContainer_physical(FillingContainer *s,I32 index);
ItemInstance *FillingContainer_getItem(FillingContainer *s,I32 index);
U0 FillingContainer_setItem(FillingContainer *s,I32 slot,ItemInstance *item);
Bool FillingContainer_linkSlot(FillingContainer *s,I32 slot,I32 index);
Bool FillingContainer_linkEmptySlot(FillingContainer *s,I32 index);
U0 FillingContainer_compressLinkedSlotList(FillingContainer *s,I32 start);
U0 FillingContainer_clearSlot(FillingContainer *s,I32 index);
U0 FillingContainer_clearInventory(FillingContainer *s);
I32 FillingContainer_getFreeSlot(FillingContainer *s);
I32 FillingContainer_getEmptySlotsCount(FillingContainer *s);
I32 FillingContainer_getSlot(FillingContainer *s,I32 id,I32 aux,Bool requireCount,Bool exactAux);
I32 FillingContainer_getSlotWithRemainingSpace(FillingContainer *s,ItemInstance *item);
I32 FillingContainer_addResource(FillingContainer *s,ItemInstance *item);
Bool FillingContainer_add(FillingContainer *s,ItemInstance *item);
I32 FillingContainer_removeResource(FillingContainer *s,ItemInstance *item,Bool exactAux);
U0 FillingContainer_removeItem(FillingContainer *s,I32 slot,I32 amount,ItemInstance *out);
Bool FillingContainer_contains(FillingContainer *s,ItemInstance *item);
U0 FillingContainer_dropSlot(FillingContainer *s,I32 slot,Bool discard,Bool random);
ListTag *FillingContainer_save(FillingContainer *s);
U0 FillingContainer_load(FillingContainer *s,ListTag *list);
