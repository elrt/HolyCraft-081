// Batch 009: minecraftpe/headers/item/ArmorItem.hpp
class ArmorMaterial009 { I32 health,defenceForSlot[4]; };
class ArmorItem { MCItem009 base;I32 armorSlot,defenseForSlot,field_50;ArmorMaterial009 *armorMaterial; };
U0 ArmorMaterial009_Init(ArmorMaterial009 *s,I32 h,I32 a,I32 b,I32 c,I32 d);I32 ArmorMaterial009_getDefenseForSlot(ArmorMaterial009 *s,I32 slot);I32 ArmorMaterial009_getHealthForSlot(ArmorMaterial009 *s,I32 slot);U0 ArmorItem_Init(ArmorItem *s,MCItemContext009 *c,I32 id,ArmorMaterial009 *material,I32 f,I32 slot);Bool ArmorItem_isArmor(ArmorItem *s);
ArmorMaterial009 ArmorItem_CLOTH,ArmorItem_CHAIN,ArmorItem_IRON,ArmorItem_GOLD,ArmorItem_DIAMOND;
U0 ArmorItem_initMaterials();
