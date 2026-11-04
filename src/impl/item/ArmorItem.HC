// Batch 009: minecraftpe/impl/item/ArmorItem.cpp
U0 ArmorMaterial009_Init(ArmorMaterial009 *s,I32 h,I32 a,I32 b,I32 c,I32 d) { s->health=h;s->defenceForSlot[0]=a;s->defenceForSlot[1]=b;s->defenceForSlot[2]=c;s->defenceForSlot[3]=d; }
I32 ArmorMaterial009_getDefenseForSlot(ArmorMaterial009 *s,I32 slot) { if(slot<0 || slot>3)exit(97);return s->defenceForSlot[slot]; }
I32 ArmorMaterial009_getHealthForSlot(ArmorMaterial009 *s,I32 slot) { I32 health[4]={11,16,15,13};if(slot<0 || slot>3)exit(97);return s->health+health[slot]; }
U0 ArmorItem_Init(ArmorItem *s,MCItemContext009 *c,I32 id,ArmorMaterial009 *m,I32 f,I32 slot) { MCItem009_Init(&s->base,c,id);s->armorSlot=slot;s->field_50=f;s->armorMaterial=m;s->defenseForSlot=ArmorMaterial009_getDefenseForSlot(m,slot);s->base.maxDamage=ArmorMaterial009_getHealthForSlot(m,slot);s->base.maxStackSize=1; }
Bool ArmorItem_isArmor(ArmorItem *s) { return TRUE; }
U0 ArmorItem_initMaterials() { ArmorMaterial009_Init(&ArmorItem_CLOTH,5,1,3,2,1);ArmorMaterial009_Init(&ArmorItem_CHAIN,15,2,5,4,1);ArmorMaterial009_Init(&ArmorItem_IRON,15,2,6,5,2);ArmorMaterial009_Init(&ArmorItem_GOLD,7,2,5,3,1);ArmorMaterial009_Init(&ArmorItem_DIAMOND,33,3,8,6,3); }
