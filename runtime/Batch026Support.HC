
Bool MC026_Command(MCUIHost026 *h,I32 op,MCString *a,MCString *b,I64 n,I32 flags){if(!h || h->command==NULL)return FALSE;return h->command(h->context,op,a,b,n,flags);}
Player *MC026_Player(MCUIHost026 *h){if(!h || !h->minecraft || !h->minecraft->player)return NULL;return &h->minecraft->player->player;}
U0 MC026_MenuAction(U0 *object,Button *b){MCMenu026 *s=object;if(s->onAction!=NULL)s->onAction(s,b->id);}
U0 MC026_MenuTick(U0 *object){MCMenu026 *s=object;if(s->onTick!=NULL)s->onTick(s);}
U0 MC026_MenuDraw(U0 *object,Bool modal,I32 epoch){MCMenu026 *s=object;MC025_Text(s->screen.ui,&s->title,8,6,-1);if(s->draw!=NULL)s->draw(s);}
Bool MC026_MenuBack(U0 *object,Bool held){MCMenu026 *s=object;I32 i;for(i=0;i<s->screen.elements.size;i++){MCWidget025 *w=s->screen.elements.data[i];if(w!=&s->widget && w->back!=NULL && w->back(w->object,held))return TRUE;}if(!held){s->closed=TRUE;MC026_Command(s->host,MC026_NAVIGATE,NULL,NULL,0,0);}return TRUE;}
U0 MC026_MenuInit(MCMenu026 *s,MCUIHost026 *h,MCUI025 *ui,U8 *title){memset(s,0,sizeof(MCMenu026));s->host=h;MCString_FromC(&s->title,title);Screen_Init(&s->screen,ui);if(h && h->minecraft)Screen_attach(&s->screen,h->minecraft,320,200);else Screen_setSize(&s->screen,320,200);s->screen.context=s;s->screen.buttonClicked=&MC026_MenuAction;s->screen.backHook=&MC026_MenuBack;s->widget.object=s;s->widget.tick=&MC026_MenuTick;s->widget.render=&MC026_MenuDraw;MCPtrVector_Push(&s->screen.elements,&s->widget);}
Button *MC026_Button(MCMenu026 *s,I32 id,U8 *name,I32 x,I32 y,I32 w,I32 h){if(s->buttonCount>=12)return NULL;Button *b=&s->buttons[s->buttonCount++];Button_Init(b,NULL,id,x,y,w,h,name);MCPtrVector_Push(&s->screen.buttons,b);return b;}
U0 MC026_MenuDestroy(MCMenu026 *s){I32 i;for(i=0;i<s->buttonCount;i++)Button_Destroy(&s->buttons[i]);Screen_Destroy(&s->screen);MCString_Destroy(&s->title);}
U0 MC026_Drop(Player *p,ItemInstance *item){if(!p || !item || item->count<=0 || ItemInstance_isNull(item))return;Level *l=p->mob.entity.level;ItemEntity *d=MC_Alloc(sizeof(ItemEntity));ItemEntity_Init(d,&l->world,p->mob.entity.body.x,p->mob.entity.body.y,p->mob.entity.body.z,item,Random_genrand_int32(&l->world.random));d->pickupDelay=40;MCPtrVector_Push(&l->drops,d);Level_addEntity(l,d);item->count=0;}
U0 MC026_Return(Player *p,ItemInstance *item){Inventory_add(&p->inventory,item);if(p->inventory.creative || p->inventory.unlimited){item->count=0;return;}if(item->count>0)MC026_Drop(p,item);}
I32 MC026_MaxStack(ItemInstance *s){if(!s || !s->itemClass)return 0;I32 n=s->itemClass->maxStack;if(n>64)n=64;if(n<1)n=1;return n;}
Bool MC026_ResourceMatches(ItemInstance *a,MCRecipeItem *b){if(!a || ItemInstance_getId(a)!=b->id)return FALSE;return b->damageable || Recipe_isAnyAuxValue(b->id) || b->aux==-1 || a->metadata==b->aux;}
I32 MC026_Count(Inventory *s,MCRecipeItem *need){I32 i,n=0;for(i=9;i<s->size;i++)if(MC026_ResourceMatches(s->items[i],need))n+=s->items[i]->count;return n;}
Bool MC026_Remove(Inventory *s,MCRecipeItem *need){if(need->count<=0)return TRUE;if(MC026_Count(s,need)<need->count)return FALSE;I32 i,left=need->count,n;for(i=9;i<s->size && left>0;i++)if(MC026_ResourceMatches(s->items[i],need)){n=s->items[i]->count;if(n>left)n=left;s->items[i]->count-=n;left-=n;if(s->items[i]->count<=0)Inventory_clearSlot(s,i);}return left==0;}
I32 MC026_Amount(I32 count,I32 percent,I32 held){I32 n=count*percent/100;if(!n || held<=199)n=1;return n;}
F32 MC026_Ease(F32 t,F32 duration,F32 start,F32 target){if(duration<=0)return target;F32 v=t/duration+t/duration,d=target-start;if(v>=1)return start+(d*-0.5)*((v-1)*(v-3)-1);return start+(d*0.5)*v*v;}
Bool MC026_Same(MCString *a,MCString *b){return a->size==b->size && (!a->size || memcmp(a->data,b->data,a->size)==0);}
