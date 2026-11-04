// Batch 009: minecraftpe/headers/crafting/CraftingFilters.hpp
// Host supplies the item-to-tile/material projection, including registry identities.
class MCFilterItem009 { Bool hasTile; I32 tileID,aux;Material *material; };
class MCFilterTiles009 { I32 lapisBlock,furnace,stonecutterBench,stoneSlabHalf; Material *stone,*sand; };
Bool CraftingFilters_isStonecutterItem(MCFilterItem009 *item,MCFilterTiles009 *tiles);
