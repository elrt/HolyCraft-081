#ifndef MCPE_BATCH009_RECIPES_SUPPORT
#define MCPE_BATCH009_RECIPES_SUPPORT
// Host supplies the actual registered IDs. Tile and item IDs share the original ID space.
class MCRecipeIDs009 {
 I32 Item_arrow;
 I32 Item_beetroot;
 I32 Item_beetrootSoup;
 I32 Item_bone;
 I32 Item_boots_cloth;
 I32 Item_boots_diamond;
 I32 Item_boots_gold;
 I32 Item_boots_iron;
 I32 Item_bow;
 I32 Item_bowl;
 I32 Item_chestplate_cloth;
 I32 Item_chestplate_diamond;
 I32 Item_chestplate_gold;
 I32 Item_chestplate_iron;
 I32 Item_coal;
 I32 Item_dye_powder;
 I32 Item_egg;
 I32 Item_emerald;
 I32 Item_feather;
 I32 Item_flint;
 I32 Item_goldIngot;
 I32 Item_hatchet_emerald;
 I32 Item_hatchet_gold;
 I32 Item_hatchet_iron;
 I32 Item_hatchet_stone;
 I32 Item_hatchet_wood;
 I32 Item_helmet_cloth;
 I32 Item_helmet_diamond;
 I32 Item_helmet_gold;
 I32 Item_helmet_iron;
 I32 Item_hoe_emerald;
 I32 Item_hoe_gold;
 I32 Item_hoe_iron;
 I32 Item_hoe_stone;
 I32 Item_hoe_wood;
 I32 Item_ironIngot;
 I32 Item_leather;
 I32 Item_leggings_cloth;
 I32 Item_leggings_diamond;
 I32 Item_leggings_gold;
 I32 Item_leggings_iron;
 I32 Item_melon;
 I32 Item_mushroomStew;
 I32 Item_netherQuartz;
 I32 Item_netherbrick;
 I32 Item_pickAxe_emerald;
 I32 Item_pickAxe_gold;
 I32 Item_pickAxe_iron;
 I32 Item_pickAxe_stone;
 I32 Item_pickAxe_wood;
 I32 Item_pumpkinPie;
 I32 Item_seeds_melon;
 I32 Item_seeds_pumpkin;
 I32 Item_shears;
 I32 Item_shovel_emerald;
 I32 Item_shovel_gold;
 I32 Item_shovel_iron;
 I32 Item_shovel_stone;
 I32 Item_shovel_wood;
 I32 Item_stick;
 I32 Item_string;
 I32 Item_sugar;
 I32 Item_sword_emerald;
 I32 Item_sword_gold;
 I32 Item_sword_iron;
 I32 Item_sword_stone;
 I32 Item_sword_wood;
 I32 Item_wheat;
 I32 Tile_chest;
 I32 Tile_cloth;
 I32 Tile_coalBlock;
 I32 Tile_emeraldBlock;
 I32 Tile_flower;
 I32 Tile_furnace;
 I32 Tile_glass;
 I32 Tile_goldBlock;
 I32 Tile_hayBlock;
 I32 Tile_ironBlock;
 I32 Tile_lapisBlock;
 I32 Tile_melon;
 I32 Tile_mushroom1;
 I32 Tile_mushroom2;
 I32 Tile_netherBrick;
 I32 Tile_pumpkin;
 I32 Tile_quartzBlock;
 I32 Tile_rock;
 I32 Tile_sand;
 I32 Tile_sandStone;
 I32 Tile_stoneBrick;
 I32 Tile_stoneBrickSmooth;
 I32 Tile_stoneSlabHalf;
 I32 Tile_stonecutterBench;
 I32 Tile_thinGlass;
 I32 Tile_wood;
 I32 Tile_workBench;
 U0 *host; Bool (*isDamageable)(U0 *host,I32 id);
};
class MCRecipeEntry009 { Bool shaped; U0 *recipe; };
class MCRecipeBook009 { MCVector entries; MCRecipeIDs009 *ids; };
U0 MCRecipeBook009_Init(MCRecipeBook009 *b,MCRecipeIDs009 *ids) { MCVector_Init(&b->entries,sizeof(MCRecipeEntry009));b->ids=ids; }
U0 MCRecipeBook009_Destroy(MCRecipeBook009 *b) { I64 i;MCRecipeEntry009 *e;for(i=0;i<b->entries.size;i++) { e=MCVector_At(&b->entries,i);if(e->shaped)ShapedRecipe_Destroy(e->recipe);else ShapelessRecipe_Destroy(e->recipe);free(e->recipe); }MCVector_Destroy(&b->entries); }
U0 MC009_item(MCRecipeBook009 *b,MCRecipeItem *it,I32 id,I32 count,I32 aux) { it->id=id;it->count=count;it->aux=aux;it->damageable=FALSE;if(b->ids->isDamageable)it->damageable=b->ids->isDamageable(b->ids->host,id); }
U0 MC009_shape(MCRecipeBook009 *b,MCRecipeItem *result,U8 *r0,U8 *r1,U8 *r2,U8 *keys,MCRecipeItem *defs,I32 n) { I32 w=strlen(r0),h=1,x,y,j;U8 *rows[3];MCRecipeItem pattern[9];MCRecipeEntry009 e;ShapedRecipe *r;if(r1)h++;if(r2)h++;rows[0]=r0;rows[1]=r1;rows[2]=r2;memset(pattern,0,sizeof(pattern));for(y=0;y<h;y++)for(x=0;x<w;x++)for(j=0;j<n;j++)if(rows[y][x]==keys[j]) { pattern[y*w+x]=defs[j];break; }r=MC_Alloc(sizeof(ShapedRecipe));ShapedRecipe_Init(r,w,h,pattern,result,1);e.shaped=TRUE;e.recipe=r;MCVector_Push(&b->entries,&e); }
U0 MC009_shapeless(MCRecipeBook009 *b,MCRecipeItem *result,MCRecipeItem *defs,I32 n) { MCRecipeEntry009 e;ShapelessRecipe *r=MC_Alloc(sizeof(ShapelessRecipe));ShapelessRecipe_Init(r,result,1,defs,n);e.shaped=FALSE;e.recipe=r;MCVector_Push(&b->entries,&e); }
#endif
