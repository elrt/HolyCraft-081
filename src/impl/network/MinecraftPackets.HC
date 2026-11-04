// Batch 019: factory over ported packet projections; see README-batch019.md.
Packet *MinecraftPackets_createPacket(I32 id,MCPacketFactoryHost019 *host) {
 U0 *p;
 switch(id) {
 case PID_LOGIN_PACKET:
  p=MC_Alloc(sizeof(LoginPacket)); LoginPacket_Init(p); return p;
 case PID_LOGIN_STATUS_PACKET:
  p=MC_Alloc(sizeof(LoginStatusPacket)); LoginStatusPacket_Init(p); return p;
 case PID_READY_PACKET:
  p=MC_Alloc(sizeof(ReadyPacket)); ReadyPacket_InitValues(p,0); return p;
 case PID_MESSAGE_PACKET:
  p=MC_Alloc(sizeof(MessagePacket)); MessagePacket_Init(p); return p;
 case PID_SET_TIME_PACKET:
  p=MC_Alloc(sizeof(SetTimePacket)); SetTimePacket_Init(p); return p;
 case PID_START_GAME_PACKET:
  p=MC_Alloc(sizeof(StartGamePacket)); StartGamePacket_Init(p); return p;
 case PID_ADD_MOB_PACKET:
  if(host) { if(host->newMissing) return host->newMissing(host->ctx,id); }
  return NULL;
 case PID_ADD_PLAYER_PACKET:
  if(host) { if(host->newMissing) return host->newMissing(host->ctx,id); }
  return NULL;
 case PID_REMOVE_PLAYER_PACKET:
  p=MC_Alloc(sizeof(RemovePlayerPacket)); RemovePlayerPacket_Init(p); return p;
 case PID_ADD_ENTITY_PACKET:
  p=MC_Alloc(sizeof(AddEntityPacket)); AddEntityPacket_Init(p); return p;
 case PID_REMOVE_ENTITY_PACKET:
  p=MC_Alloc(sizeof(RemoveEntityPacket)); RemoveEntityPacket_Init(p); return p;
 case PID_ADD_ITEM_ENTITY_PACKET:
  p=MC_Alloc(sizeof(AddItemEntityPacket)); AddItemEntityPacket_Init(p); return p;
 case PID_TAKE_ITEM_ENTITY_PACKET:
  p=MC_Alloc(sizeof(TakeItemEntityPacket)); TakeItemEntityPacket_Init(p); return p;
 case PID_MOVE_ENTITY_PACKET:
  p=MC_Alloc(sizeof(MoveEntityPacket)); MoveEntityPacket_InitValues(p,0); return p;
 case PID_MOVE_ENTITY_POSROT_PACKET:
  p=MC_Alloc(sizeof(MoveEntityPacket_PosRot)); MoveEntityPacket_PosRot_Init(p); return p;
 case PID_ROTATE_HEAD_PACKET:
  p=MC_Alloc(sizeof(RotateHeadPacket)); RotateHeadPacket_Init(p); return p;
 case PID_MOVE_PLAYER_PACKET:
  p=MC_Alloc(sizeof(MovePlayerPacket)); MovePlayerPacket_Init(p); return p;
 case PID_PLACE_BLOCK_PACKET:
  p=MC_Alloc(sizeof(PlaceBlockPacket)); PlaceBlockPacket_Init(p); return p;
 case PID_REMOVE_BLOCK_PACKET:
  p=MC_Alloc(sizeof(RemoveBlockPacket)); RemoveBlockPacket_Init(p); return p;
 case PID_UPDATE_BLOCK_PACKET:
  p=MC_Alloc(sizeof(UpdateBlockPacket)); UpdateBlockPacket_Init(p); return p;
 case PID_ADD_PAINTING_PACKET:
  p=MC_Alloc(sizeof(AddPaintingPacket)); AddPaintingPacket_Init(p); return p;
 case PID_EXPLODE_PACKET:
  p=MC_Alloc(sizeof(ExplodePacket)); ExplodePacket_Init(p); return p;
 case PID_LEVEL_EVENT_PACKET:
  p=MC_Alloc(sizeof(LevelEventPacket)); LevelEventPacket_Init(p); return p;
 case PID_TILE_EVENT_PACKET:
  p=MC_Alloc(sizeof(TileEventPacket)); TileEventPacket_Init(p); return p;
 case PID_ENTITY_EVENT_PACKET:
  p=MC_Alloc(sizeof(EntityEventPacket)); EntityEventPacket_Init(p); return p;
 case PID_REQUEST_CHUNK_PACKET:
  p=MC_Alloc(sizeof(RequestChunkPacket)); RequestChunkPacket_Init(p); return p;
 case PID_CHUNK_DATA_PACKET:
  if(host) { if(host->newMissing) return host->newMissing(host->ctx,id); }
  return NULL;
 case PID_PLAYER_EQUIPMENT_PACKET:
  p=MC_Alloc(sizeof(PlayerEquipmentPacket)); PlayerEquipmentPacket_Init(p); return p;
 case PID_PLAYER_ARMOR_EQUIPMENT_PACKET:
  p=MC_Alloc(sizeof(PlayerArmorEquipmentPacket)); PlayerArmorEquipmentPacket_Init(p); return p;
 case PID_INTERACT_PACKET:
  p=MC_Alloc(sizeof(InteractPacket)); InteractPacket_Init(p); return p;
 case PID_USE_ITEM_PACKET:
  p=MC_Alloc(sizeof(UseItemPacket)); UseItemPacket_Init(p); return p;
 case PID_PLAYER_ACTION_PACKET:
  p=MC_Alloc(sizeof(PlayerActionPacket)); PlayerActionPacket_Init(p); return p;
 case PID_HURT_ARMOR_PACKET:
  p=MC_Alloc(sizeof(HurtArmorPacket)); HurtArmorPacket_Init(p); return p;
 case PID_SET_ENTITY_DATA_PACKET:
  if(host) { if(host->newMissing) return host->newMissing(host->ctx,id); }
  return NULL;
 case PID_SET_ENTITY_MOTION_PACKET:
  p=MC_Alloc(sizeof(SetEntityMotionPacket)); SetEntityMotionPacket_Init(p); return p;
 case PID_SET_ENTITY_LINK_PACKET:
  p=MC_Alloc(sizeof(SetEntityLinkPacket)); SetEntityLinkPacket_Init(p); return p;
 case PID_SET_HEALTH_PACKET:
  p=MC_Alloc(sizeof(SetHealthPacket)); SetHealthPacket_Init(p); return p;
 case PID_SET_SPAWN_POSITION_PACKET:
  p=MC_Alloc(sizeof(SetSpawnPositionPacket)); SetSpawnPositionPacket_Init(p); return p;
 case PID_ANIMATE_PACKET:
  p=MC_Alloc(sizeof(AnimatePacket)); AnimatePacket_Init(p); return p;
 case PID_RESPAWN_PACKET:
  p=MC_Alloc(sizeof(RespawnPacket)); RespawnPacket_Init(p); return p;
 case PID_SEND_INVENTORY_PACKET:
  p=MC_Alloc(sizeof(SendInventoryPacket)); SendInventoryPacket_Init(p); return p;
 case PID_DROP_ITEM_PACKET:
  p=MC_Alloc(sizeof(DropItemPacket)); DropItemPacket_Init(p); return p;
 case PID_CONTAINER_OPEN_PACKET:
  p=MC_Alloc(sizeof(ContainerOpenPacket)); ContainerOpenPacket_Init(p); return p;
 case PID_CONTAINER_CLOSE_PACKET:
  p=MC_Alloc(sizeof(ContainerClosePacket)); ContainerClosePacket_Init(p); return p;
 case PID_CONTAINER_SET_SLOT_PACKET:
  p=MC_Alloc(sizeof(ContainerSetSlotPacket)); ContainerSetSlotPacket_Init(p); return p;
 case PID_CONTAINER_SET_DATA_PACKET:
  p=MC_Alloc(sizeof(ContainerSetDataPacket)); ContainerSetDataPacket_Init(p); return p;
 case PID_CONTAINER_SET_CONTENT_PACKET:
  p=MC_Alloc(sizeof(ContainerSetContentPacket)); ContainerSetContentPacket_Init(p); return p;
 case PID_CONTAINER_ACK_PACKET:
  p=MC_Alloc(sizeof(ContainerAckPacket)); ContainerAckPacket_Init(p); return p;
 case PID_CHAT_PACKET:
  p=MC_Alloc(sizeof(ChatPacket)); ChatPacket_Init(p); return p;
 case PID_ADVENTURE_SETTINGS_PACKET:
  p=MC_Alloc(sizeof(AdventureSettingsPacket)); AdventureSettingsPacket_Init(p); return p;
 case PID_ENTITY_DATA_PACKET:
  if(host) { if(host->newMissing) return host->newMissing(host->ctx,id); }
  return NULL;
 case PID_PLAYER_INPUT_PACKET:
  p=MC_Alloc(sizeof(PlayerInputPacket)); PlayerInputPacket_Init(p); return p;
 default: return NULL;
 }
}
