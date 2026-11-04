#ifndef MCPE_BATCH007_CRAFT_SUPPORT
#define MCPE_BATCH007_CRAFT_SUPPORT
// Projection, NOT the original ItemInstance ABI. Host maps stable item ID to identity.
class MCRecipeItem { I32 id,count,aux; Bool damageable; };
Bool MCRecipeItem_isNull(MCRecipeItem *it) { return !it || it->id==0; }
Bool MCRecipeItem_sameItem(MCRecipeItem *a,MCRecipeItem *b) { if(!a || !b)return FALSE;return a->id!=0 && a->id==b->id; }
Bool MCRecipeItem_equals(MCRecipeItem *a,MCRecipeItem *b) { return a->id==b->id && a->count==b->count && a->aux==b->aux; }
class MCRecipeTiles { I32 cloth,stoneSlabHalf,sandStone,treeTrunk,wood; };
MCRecipeTiles MC_recipeTiles;
#endif
