#ifndef MCPE_BATCH021_FACTORY
#define MCPE_BATCH021_FACTORY
Packet *MinecraftPackets_createPacket021(I32 id,MCPacketFactoryHost019 *host) {U0 *p;switch(id){case PID_ADD_MOB_PACKET:p=MC_Alloc(sizeof(AddMobPacket));AddMobPacket_Init(p);return p;case PID_ADD_PLAYER_PACKET:p=MC_Alloc(sizeof(AddPlayerPacket));AddPlayerPacket_Init(p);return p;case PID_SET_ENTITY_DATA_PACKET:p=MC_Alloc(sizeof(SetEntityDataPacket));SetEntityDataPacket_Init(p);return p;case PID_CHUNK_DATA_PACKET:p=MC_Alloc(sizeof(ChunkDataPacket));ChunkDataPacket_Init(p);return p;case PID_ENTITY_DATA_PACKET:p=MC_Alloc(sizeof(EntityDataPacket));EntityDataPacket_Init(p);return p;}return MinecraftPackets_createPacket(id,host);}
// No-op callbacks are not installed: these are actual new packet objects.
U0 MC021_AddMobFrom020(AddMobPacket *packet,MCMob020 *mob,SynchedEntityData *data) {MCPacketEntity009 e;memset(&e,0,sizeof(e));e.eid=mob->a.id;e.type=mob->a.type;e.x=mob->a.x;e.y=mob->a.y;e.z=mob->a.z;e.yaw=mob->a.yaw;e.pitch=mob->a.pitch;AddMobPacket_InitEntity(packet,&e,data);}
// Explicit corrected application path: the decompiled assignValues skips byte
// metadata unconditionally. Keep the legacy method, but do not use that bug here.
Bool MC021_ApplyEntityData(SynchedEntityData *local,I32 localEntityId,SetEntityDataPacket *packet) {if(localEntityId!=packet->entityId)return FALSE;SynchedEntityData_assignValuesMode(local,&packet->data,TRUE);return TRUE;}

#endif
