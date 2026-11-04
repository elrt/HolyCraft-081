// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Player {Mob mob;MCPlayer023 view;Inventory inventory;Abilities abilities;ItemInstance armor[4],usingItem;MCString name;I32 score,bedX,bedY,bedZ,useItemDuration,dimension,sleepingCounter,spawnX,spawnY,spawnZ;Bool sleeping,hasRespawnPosition;};

U0 Player_syncView(Player *s);
U0 Player_Init(Player *s,Level *level,U8 *name,Bool creative);
U0 Player_Destroy(Player *s);
ItemInstance *Player_getArmor(Player *s,I32 slot);
I32 Player_getArmorTypeHash(Player *s);
F32 Player_getSleepRotation(Player *s);
Bool Player_hurt(Player *s,Entity *attacker,I32 damage,Bool hostile);
U0 Player_startUsingItem(Player *s,ItemInstance *item,I32 duration);
U0 Player_stopUsingItem(Player *s);
U0 Player_pickupNearby(Player *s);
U0 Player_addSaveData(Player *s,CompoundTag *tag);
Bool Player_load(Player *s,CompoundTag *tag);

U0 Player_travel(Player *s,F32 strafe,F32 forward);

U0 Player_resetPos(Player *s,Bool heal);
