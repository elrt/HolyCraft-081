// Batch 009: minecraftpe/impl/crafting/WeaponRecipes.cpp and inline header
U0 WeaponRecipes_addRecipes(MCRecipeBook009 *book) {
 MCRecipeIDs009 *ids=book->ids;MCRecipeItem result,defs[4];U8 keys[4];
 MC009_item(book,&result,ids->Item_sword_wood,1,0);
 keys[0]='#';MC009_item(book,&defs[0],ids->Item_stick,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Tile_wood,1,-1);
 MC009_shape(book,&result,"X","X","#",keys,defs,2);
 MC009_item(book,&result,ids->Item_sword_stone,1,0);
 keys[0]='#';MC009_item(book,&defs[0],ids->Item_stick,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Tile_stoneBrick,1,-1);
 MC009_shape(book,&result,"X","X","#",keys,defs,2);
 MC009_item(book,&result,ids->Item_sword_iron,1,0);
 keys[0]='#';MC009_item(book,&defs[0],ids->Item_stick,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Item_ironIngot,1,0);
 MC009_shape(book,&result,"X","X","#",keys,defs,2);
 MC009_item(book,&result,ids->Item_sword_emerald,1,0);
 keys[0]='#';MC009_item(book,&defs[0],ids->Item_stick,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Item_emerald,1,0);
 MC009_shape(book,&result,"X","X","#",keys,defs,2);
 MC009_item(book,&result,ids->Item_sword_gold,1,0);
 keys[0]='#';MC009_item(book,&defs[0],ids->Item_stick,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Item_goldIngot,1,0);
 MC009_shape(book,&result,"X","X","#",keys,defs,2);
 MC009_item(book,&result,ids->Item_bow,1,0);
 keys[0]='X';MC009_item(book,&defs[0],ids->Item_string,1,0);
 keys[1]='#';MC009_item(book,&defs[1],ids->Item_stick,1,0);
 MC009_shape(book,&result," #X","# X"," #X",keys,defs,2);
 MC009_item(book,&result,ids->Item_arrow,4,0);
 keys[0]='Y';MC009_item(book,&defs[0],ids->Item_feather,1,0);
 keys[1]='X';MC009_item(book,&defs[1],ids->Item_flint,1,0);
 keys[2]='#';MC009_item(book,&defs[2],ids->Item_stick,1,0);
 MC009_shape(book,&result,"X","#","Y",keys,defs,3);
}
