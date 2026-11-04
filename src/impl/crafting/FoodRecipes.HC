// Batch 009: minecraftpe/impl/crafting/FoodRecipes.cpp and inline header
U0 FoodRecipes_addRecipes(MCRecipeBook009 *book) {
 MCRecipeIDs009 *ids=book->ids;MCRecipeItem result,defs[4];U8 keys[4];
 MC009_item(book,&result,ids->Item_mushroomStew,1,0);
 keys[0]='0';MC009_item(book,&defs[0],ids->Tile_mushroom1,1,0);
 keys[1]='0';MC009_item(book,&defs[1],ids->Tile_mushroom2,1,0);
 keys[2]='0';MC009_item(book,&defs[2],ids->Item_bowl,1,0);
 MC009_shapeless(book,&result,defs,3);
 MC009_item(book,&result,ids->Item_beetrootSoup,1,0);
 keys[0]='B';MC009_item(book,&defs[0],ids->Item_beetroot,1,0);
 keys[1]='#';MC009_item(book,&defs[1],ids->Item_bowl,1,0);
 MC009_shape(book,&result,"BB","BB","#",keys,defs,2);
 MC009_item(book,&result,ids->Tile_melon,1,0);
 keys[0]='M';MC009_item(book,&defs[0],ids->Item_melon,1,0);
 MC009_shape(book,&result,"MMM","MMM","MMM",keys,defs,1);
 MC009_item(book,&result,ids->Item_seeds_melon,1,0);
 keys[0]='M';MC009_item(book,&defs[0],ids->Item_melon,1,0);
 MC009_shape(book,&result,"M",NULL,NULL,keys,defs,1);
 MC009_item(book,&result,ids->Item_seeds_pumpkin,4,0);
 keys[0]='M';MC009_item(book,&defs[0],ids->Tile_pumpkin,1,-1);
 MC009_shape(book,&result,"M",NULL,NULL,keys,defs,1);
 MC009_item(book,&result,ids->Item_pumpkinPie,1,0);
 keys[0]='0';MC009_item(book,&defs[0],ids->Tile_pumpkin,1,0);
 keys[1]='0';MC009_item(book,&defs[1],ids->Item_sugar,1,0);
 keys[2]='0';MC009_item(book,&defs[2],ids->Item_egg,1,0);
 MC009_shapeless(book,&result,defs,3);
}
