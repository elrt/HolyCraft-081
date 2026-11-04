// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
Bool Item_Init(Item *s,MCRegistry023 *r,I32 relativeId){I32 id=relativeId+256;if(id<0 || id>=512)return FALSE;memset(s,0,sizeof(Item));s->registry=r;s->def.id=id;s->def.maxStack=64;s->categoryOrder=-1;s->def.destroySpeed=1;MCString_Init(&s->description);r->items[id]=&s->def;return TRUE;}
U0 Item_Destroy(Item *s){if(s->registry && s->registry->items[s->def.id]==&s->def)s->registry->items[s->def.id]=NULL;MCString_Destroy(&s->description);}
U0 Item_setMaxDamage(Item *s,I32 n){s->def.maxDamage=n;}
U0 Item_setMaxStackSize(Item *s,I32 n){s->def.maxStack=n;}
U0 Item_setStackedByData(Item *s,Bool n){s->def.stackedByData=n;}
Bool Item_canBeDepleted(Item *s){return s->def.maxDamage>0 && !s->def.stackedByData;}
U0 Item_setCategory(Item *s,I32 cat,I32 order){s->creativeCategory=cat;s->categoryOrder=order;}
U0 Item_setDescriptionId(Item *s,U8 *name){MC024_SetString(&s->description,"item.");MC025_Append(&s->description,name);}
