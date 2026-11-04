#ifndef MC021_NETWORK_PACKET_SETENTITYDATAPACKET
#define MC021_NETWORK_PACKET_SETENTITYDATAPACKET
class SetEntityDataPacket: Packet {I32 entityId;I8 needsMemoryFreeing,field_11,field_12,field_13;MCPtrVector data;};
U0 SetEntityDataPacket_Destroy(Packet *base);
U0 SetEntityDataPacket_write(Packet *base,MCBitStream *stream);
U0 SetEntityDataPacket_read(Packet *base,MCBitStream *stream);
U0 SetEntityDataPacket_Init(SetEntityDataPacket *s);
U0 SetEntityDataPacket_InitValues(SetEntityDataPacket *s,I32 id,Bool owns,MCPtrVector *values);

U0 SetEntityDataPacket_Destroy(Packet *base) {SetEntityDataPacket *s=base;if(s->needsMemoryFreeing)DataItem2_DeleteList(&s->data);else MCPtrVector_Destroy(&s->data);s->needsMemoryFreeing=FALSE;}
U0 SetEntityDataPacket_write(Packet *base,MCBitStream *stream) {SetEntityDataPacket *s=base;MCBitStream_WriteU8(stream,PID_SET_ENTITY_DATA_PACKET);MCBitStream_WriteI32(stream,s->entityId);RakDataOutput out;RakDataOutput_Init(&out,stream);SynchedEntityData_pack(&s->data,&out);}
U0 SetEntityDataPacket_read(Packet *base,MCBitStream *stream) {SetEntityDataPacket *s=base;MCBitStream_ReadI32(stream,&s->entityId);SetEntityDataPacket_Destroy(s);s->needsMemoryFreeing=TRUE;RakDataInput input;RakDataInput_Init(&input,stream);if(!SynchedEntityData_unpack(&input,&s->data))stream->failed=TRUE;}
U0 SetEntityDataPacket_Init(SetEntityDataPacket *s) {memset(s,0,sizeof(SetEntityDataPacket));Packet_Init(s);s->packetId=PID_SET_ENTITY_DATA_PACKET;s->writeFn=&SetEntityDataPacket_write;s->readFn=&SetEntityDataPacket_read;s->destroyFn=&SetEntityDataPacket_Destroy;MCPtrVector_Init(&s->data);}
U0 SetEntityDataPacket_InitValues(SetEntityDataPacket *s,I32 id,Bool owns,MCPtrVector *values) {SetEntityDataPacket_Init(s);s->entityId=id;s->needsMemoryFreeing=owns;I64 i;for(i=0;i<values->size;i++)MCPtrVector_Push(&s->data,values->data[i]);}

#endif
