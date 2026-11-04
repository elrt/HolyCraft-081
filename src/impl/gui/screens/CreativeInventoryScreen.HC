// Batch026; algorithms and omissions documented in docs/BATCH026.md.
Bool CreativeInventoryScreen_populateItem(CreativeInventoryScreen *s,Bool tile,U8 *name,I32 count,I32 aux){MCUIHost026 *h=s->menu.host;if(!h || h->resolve==NULL || !h->minecraft || !h->minecraft->level)return FALSE;I32 id=h->resolve(h->context,tile,name);MCCreativeItem026 row;ItemInstance_Init(&row.item,h->minecraft->level->registry,id,count,aux);if(id<=0 || ItemInstance_isNull(&row.item) || !row.item.isValid){s->missing++;return FALSE;}row.category=1;if(h->category!=NULL)row.category=h->category(h->context,id);if(row.category<1 || row.category>4){s->missing++;return FALSE;}MCVector_Push(&s->items,&row);return TRUE;}
U0 CreativeInventoryScreen_populateFilteredItems(CreativeInventoryScreen *s){I32 i;for(i=0;i<4;i++)s->filtered[i].size=0;for(i=0;i<s->items.size;i++){MCCreativeItem026 *row=MCVector_At(&s->items,i);MCVector_Push(&s->filtered[row->category-1],&i);}}
Bool CreativeInventoryScreen_addItem(CreativeInventoryScreen *s,I32 index){Player *p=MC026_Player(s->menu.host);if(!p || !p->abilities.instabuild || index<0 || index>=s->items.size)return FALSE;MCCreativeItem026 *v=MCVector_At(&s->items,index);I32 slot=p->inventory.selectedSlot+9;if(slot<9 || slot>=p->inventory.size)return FALSE;Inventory_clearSlot(&p->inventory,slot);p->inventory.items[slot]=ItemInstance_clone(&v->item);Inventory_moveToSelectionSlot(&p->inventory,p->inventory.selectedSlot,slot);return TRUE;}
U0 CreativeInventoryScreen_action(MCMenu026 *m,I32 id){CreativeInventoryScreen *s=m;if(id>=1 && id<=4)s->selectedCategory=id-1;else MC026_MenuBack(m,FALSE);}
U0 CreativeInventoryScreen_Init(CreativeInventoryScreen *s,MCUIHost026 *h,MCUI025 *ui){memset(s,0,sizeof(CreativeInventoryScreen));MC026_MenuInit(&s->menu,h,ui,"Creative inventory");MCVector_Init(&s->items,sizeof(MCCreativeItem026));I32 i;for(i=0;i<4;i++){MCVector_Init(&s->filtered[i],sizeof(I32));MC026_Button(&s->menu,i+1,"Category",10+i*75,25,70,20);}MC026_Button(&s->menu,0,"Back",4,170,70,20);s->menu.onAction=&CreativeInventoryScreen_action;}
U0 CreativeInventoryScreen_Destroy(CreativeInventoryScreen *s){I32 i;MCVector_Destroy(&s->items);for(i=0;i<4;i++)MCVector_Destroy(&s->filtered[i]);MC026_MenuDestroy(&s->menu);}
U0 CreativeInventoryScreen_populateItems(CreativeInventoryScreen *s){if(!s->menu.host || s->menu.host->resolve==NULL)return;s->items.size=0;s->missing=0;

	CreativeInventoryScreen_populateItem(s,TRUE,"rail",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"goldenRail",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneBrick",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneBrickSmooth",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneBrickSmooth",1,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneBrickSmooth",1,2);
	CreativeInventoryScreen_populateItem(s,TRUE,"mossStone",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"wood",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"wood",1,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"wood",1,2);
	CreativeInventoryScreen_populateItem(s,TRUE,"wood",1,3);
	CreativeInventoryScreen_populateItem(s,TRUE,"redBrick",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"rock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"dirt",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"grass",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"clay",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"sandStone",5,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"sandStone",5,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"sandStone",5,2);
	CreativeInventoryScreen_populateItem(s,TRUE,"sand",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"gravel",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"cobbleWall",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"cobbleWall",5,1);
	for(I32 i = 0; i != 4; ++i) {
		CreativeInventoryScreen_populateItem(s,TRUE,"treeTrunk",5,i);
	}
	CreativeInventoryScreen_populateItem(s,TRUE,"netherBrick",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"netherrack",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"unbreakable",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_stone",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_wood",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"woodStairsDark",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"woodStairsBirch",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"woodStairsJungle",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_brick",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_sandStone",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_stoneBrickSmooth",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_netherBricks",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stairs_quartz",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,3);
	for(I32 v2 = 0; v2 != 4; ++v2) {
		CreativeInventoryScreen_populateItem(s,TRUE,"woodSlabHalf",1,v2);
	}
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,4);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,5);
	CreativeInventoryScreen_populateItem(s,TRUE,"stoneSlabHalf",1,6);
	CreativeInventoryScreen_populateItem(s,TRUE,"quartzBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"quartzBlock",1,2);
	CreativeInventoryScreen_populateItem(s,TRUE,"quartzBlock",1,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"coalOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"ironOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"goldOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"emeraldOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"lapisOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"redStoneOre",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"goldBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"ironBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"emeraldBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"lapisBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"coalBlock",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"obsidian",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"ice",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"snow",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"topSnow",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"glass",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"lightGem",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"netherReactor",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"ladder",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"sponge",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"torch",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"thinGlass",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"bucket",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"bucket",1,s->menu.host->resolve(s->menu.host->context,TRUE,"water"));
	CreativeInventoryScreen_populateItem(s,FALSE,"bucket",1,s->menu.host->resolve(s->menu.host->context,TRUE,"lava"));
	CreativeInventoryScreen_populateItem(s,FALSE,"door_wood",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"trapdoor",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"fence",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"fenceGate",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"ironFence",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"bed",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"bookshelf",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"painting",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"workBench",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"stonecutterBench",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"chest",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"furnace",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"tnt",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"flower",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"rose",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"mushroom1",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"mushroom2",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"cactus",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"melon",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"pumpkin",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"litPumpkin",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"web",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"hayBlock",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"reeds",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"wheat",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"tallgrass",5,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"tallgrass",5,2);
	CreativeInventoryScreen_populateItem(s,TRUE,"deadBush",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"sapling",1,0);
	CreativeInventoryScreen_populateItem(s,TRUE,"sapling",1,1);
	CreativeInventoryScreen_populateItem(s,TRUE,"sapling",1,2);
	for(I32 j = 0; j != 4; ++j) {
		CreativeInventoryScreen_populateItem(s,TRUE,"leaves",1,j);
	}
	CreativeInventoryScreen_populateItem(s,FALSE,"seeds_wheat",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"seeds_pumpkin",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"seeds_melon",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"carrot",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"potato",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"seeds_beetroot",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"hoe_iron",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"cake",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"egg",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"sword_iron",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"bow",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"flintAndSteel",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"shears",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"sign",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"clock",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"compass",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"minecart",1,0);
	CreativeInventoryScreen_populateItem(s,FALSE,"mobPlacer",1,10);
	CreativeInventoryScreen_populateItem(s,FALSE,"mobPlacer",1,11);
	CreativeInventoryScreen_populateItem(s,FALSE,"mobPlacer",1,12);
	CreativeInventoryScreen_populateItem(s,FALSE,"mobPlacer",1,13);
	
		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,8);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,7);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xF);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xC);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xE);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,1);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,4);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,5);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xD);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,9);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,3);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xB);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,0xA);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,2);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"cloth",1,6);
	
	
		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,8);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,7);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xF);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xC);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xE);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,1);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,4);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,5);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xD);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,9);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,3);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xB);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,0xA);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,2);
	

		CreativeInventoryScreen_populateItem(s,TRUE,"woolCarpet",1,6);
	
	
		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,8);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,7);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xF);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xC);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xE);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,1);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,4);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,5);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xD);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,9);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,3);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xB);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,0xA);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,2);
	

		CreativeInventoryScreen_populateItem(s,FALSE,"dye_powder",1,6);
	
	CreativeInventoryScreen_populateFilteredItems(s);

}
