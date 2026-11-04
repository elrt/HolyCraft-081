// Batch026; algorithms and omissions documented in docs/BATCH026.md.
Bool ChestScreen_handleAddItem(ChestScreen *s,FillingContainer *from,FillingContainer *to,I32 index){if(!from || !to || from==to || index<0)return FALSE;I32 slot=index+from->linkedCount;ItemInstance *item=FillingContainer_getItem(from,slot);if(ItemInstance_isNull(item))return FALSE;I32 n=MC026_Amount(item->count,s->percent,s->heldTicks);if(n>item->count)n=item->count;if(n<=0)return FALSE;ItemInstance copy=*item;copy.count=n;FillingContainer_add(to,&copy);I32 moved=n-copy.count;if(moved<=0)return FALSE;item->count-=moved;if(item->count<=0)FillingContainer_clearSlot(from,slot);if(s->ownsCache)MC024_CommitInventory(&s->player->inventory,&s->cache);s->transfers+=moved;s->needsSetup=TRUE;return TRUE;}
U0 ChestScreen_action(MCMenu026 *m,I32 id){MC026_MenuBack(m,FALSE);}
U0 ChestScreen_Init(ChestScreen *s,MCUIHost026 *h,MCUI025 *ui,FillingContainer *player,FillingContainer *chest){memset(s,0,sizeof(ChestScreen));MC026_MenuInit(&s->menu,h,ui,"Chest");s->left=player;s->right=chest;s->percent=100;s->menu.onAction=&ChestScreen_action;MC026_Button(&s->menu,4,"Back",4,170,70,20);}
U0 ChestScreen_tick(ChestScreen *s){Screen_tick(&s->menu.screen);s->needsSetup=FALSE;}
U0 ChestScreen_onInternetUpdate(ChestScreen *s){s->needsSetup=TRUE;}
U0 ChestScreen_Destroy(ChestScreen *s){if(s->ownsCache)FillingContainer_Destroy(&s->cache);MC026_MenuDestroy(&s->menu);}

U0 ChestScreen_InitPlayer(ChestScreen *s,MCUIHost026 *h,MCUI025 *ui,FillingContainer *chest){ChestScreen_Init(s,h,ui,NULL,chest);s->player=MC026_Player(h);if(s->player){MC024_ImportInventory(&s->cache,&s->player->inventory);s->left=&s->cache;s->ownsCache=TRUE;}}
