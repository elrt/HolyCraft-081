// Batch023: item/ItemInstance; explicit simulation ABI, see docs/BATCH023.md.
Bool ItemInstance_setItem(ItemInstance *s,I32 id) {s->itemClass=NULL;s->tileClass=NULL;if(id>=0 && id<512)s->itemClass=s->registry->items[id];s->isValid=s->itemClass!=NULL || id==0;if(s->isValid){if(id>=0 && id<256)s->tileClass=&s->registry->tiles[id];}else{s->count=-1;s->metadata=-1;}return s->isValid;}
U0 ItemInstance_Init(ItemInstance *s,MCRegistry023 *r,I32 id,I32 count,I32 meta) {s->registry=r;s->count=count;s->metadata=meta;ItemInstance_setItem(s,id);}
I32 ItemInstance_getId(ItemInstance *s) {if(!s->isValid)return -1;if(s->itemClass)return s->itemClass->id;return 0;}
U0 ItemInstance_setNull(ItemInstance *s) {s->count=0;s->metadata=0;s->itemClass=NULL;/* source retains validity/tileClass */}
Bool ItemInstance_isItem(ItemInstance *s) {return s && s->itemClass!=NULL;}
Bool ItemInstance_isNull(ItemInstance *s) {if(!s || !s->isValid)return TRUE;if(s->count)return FALSE;if(s->metadata)return FALSE;return s->itemClass==NULL;}
Bool ItemInstance_isDamageableItem(ItemInstance *s) {return s && s->itemClass && s->itemClass->maxDamage>0;}
Bool ItemInstance_isDamaged(ItemInstance *s) {return ItemInstance_isDamageableItem(s) && s->metadata>0;}
Bool ItemInstance_isStackable(ItemInstance *s) {if(!s || !s->itemClass || s->itemClass->maxStack<=1)return FALSE;if(ItemInstance_isDamageableItem(s))return !ItemInstance_isDamaged(s);return TRUE;}
Bool ItemInstance_canStack(ItemInstance *a,ItemInstance *b) {if(!a || !b || a->itemClass!=b->itemClass || !ItemInstance_isStackable(b))return FALSE;if(!b->itemClass->stackedByData)return TRUE;return a->metadata==b->metadata;}
Bool ItemInstance_sameItemAndAux(ItemInstance *a,ItemInstance *b) {if(!a || !b || a->itemClass==NULL)return FALSE;return a->itemClass==b->itemClass && a->metadata==b->metadata;}
Bool ItemInstance_matches(ItemInstance *a,ItemInstance *b) {if(!a)return b==NULL;if(!b)return FALSE;return a->itemClass==b->itemClass && a->count==b->count && a->metadata==b->metadata;}
Bool ItemInstance_matchesNulls(ItemInstance *a,ItemInstance *b) {Bool na=ItemInstance_isNull(a),nb=ItemInstance_isNull(b);if(na)return nb;if(nb)return FALSE;return ItemInstance_matches(a,b);}
ItemInstance *ItemInstance_clone(ItemInstance *s) {if(!s)return NULL;ItemInstance *out=MC_Alloc(sizeof(ItemInstance));ItemInstance_Init(out,s->registry,ItemInstance_getId(s),s->count,s->metadata);return out;}
U0 ItemInstance_cloneSafe(ItemInstance *out,MCRegistry023 *registry,ItemInstance *s) {if(s)ItemInstance_Init(out,s->registry,ItemInstance_getId(s),s->count,s->metadata);else ItemInstance_Init(out,registry,0,0,0);}
U0 ItemInstance_remove(ItemInstance *s,I32 amount,ItemInstance *out) {s->count-=amount;I32 id=ItemInstance_getId(s);ItemInstance_Init(out,s->registry,id,amount,s->metadata);}
U0 ItemInstance_hurtAndBreak(ItemInstance *s,I32 amount,MCBody023 *mob) {if(!ItemInstance_isDamageableItem(s))return;s->metadata=(s->metadata+amount)(I32);if(s->metadata>s->itemClass->maxDamage){s->count--;if(s->count<0)s->count=0;s->metadata=0;if(mob)MC023_Sound(mob->w,"random.break",mob->x,mob->y,mob->z,1.0,0.9);}}
U0 ItemInstance_useAsFuel(ItemInstance *s) {if(s->count==1 && ItemInstance_getId(s)==s->registry->bucket && s->metadata==s->registry->lava)ItemInstance_Init(s,s->registry,s->registry->bucket,1,0);else{s->count--;if(!s->count)ItemInstance_setNull(s);}}
U0 ItemInstance_load(ItemInstance *s,CompoundTag *tag) {ItemInstance_setItem(s,MC023_NBTGet(tag,"id",FALSE));s->count=MC023_NBTGet(tag,"Count",TRUE)&255;s->metadata=MC023_NBTGet(tag,"Damage",FALSE);}
U0 ItemInstance_save(ItemInstance *s,CompoundTag *tag) {MC023_NBTPut(tag,"id",ItemInstance_getId(s),FALSE);MC023_NBTPut(tag,"Count",s->count,TRUE);MC023_NBTPut(tag,"Damage",s->metadata,FALSE);}
