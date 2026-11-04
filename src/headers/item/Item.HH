// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Item {MCRegistry023 *registry;MCItemDef023 def;I32 creativeCategory,categoryOrder;Bool handEquipped;MCString description;TextureUVCoordinateSet icon;};

Bool Item_Init(Item *s,MCRegistry023 *r,I32 relativeId);
U0 Item_Destroy(Item *s);
U0 Item_setMaxDamage(Item *s,I32 n);
U0 Item_setMaxStackSize(Item *s,I32 n);
U0 Item_setStackedByData(Item *s,Bool n);
Bool Item_canBeDepleted(Item *s);
U0 Item_setCategory(Item *s,I32 cat,I32 order);
U0 Item_setDescriptionId(Item *s,U8 *name);
