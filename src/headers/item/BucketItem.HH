// Batch023: item/BucketItem; explicit simulation ABI, see docs/BATCH023.md.
class BucketItem {MCWorld023 *w;};
U0 BucketItem_Init(BucketItem*,MCWorld023*);Bool BucketItem_emptyBucket(BucketItem*,I32,I32,I32,I32);Bool BucketItem_useOn(BucketItem*,ItemInstance*,MCPlayer023*,I32,I32,I32,I32);I32 BucketItem_getMaxStackSize(ItemInstance*);I32 BucketItem_getIcon(BucketItem*,I32);U8 *BucketItem_getDescriptionId(BucketItem*,ItemInstance*);Bool BucketItem_isLiquidClipItem(I32);Bool BucketItem_isEmissive(BucketItem*,I32);
