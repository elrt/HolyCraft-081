#ifndef MC021_NETWORK_PACKET_ENTITYDATAPACKET
#define MC021_NETWORK_PACKET_ENTITYDATAPACKET
class EntityDataPacket: Packet {I32 x,y,z;CompoundTag *data;};
U0 EntityDataPacket_Destroy(Packet *base);
U0 EntityDataPacket_write(Packet *base,MCBitStream *stream);
U0 EntityDataPacket_read(Packet *base,MCBitStream *stream);
U0 EntityDataPacket_Init(EntityDataPacket *s);
U0 EntityDataPacket_InitValues(EntityDataPacket *s,I32 x,I32 y,I32 z,CompoundTag *tag);

U0 EntityDataPacket_Destroy(Packet *base) {EntityDataPacket *s=base;if(s->data)Tag_DeleteDeep(s->data);s->data=NULL;}
U0 EntityDataPacket_write(Packet *base,MCBitStream *stream) {EntityDataPacket *s=base;if(!s->data){stream->failed=TRUE;return;}MCBitStream_WriteU8(stream,PID_ENTITY_DATA_PACKET);MCBitStream_WriteI16(stream,s->x);MCBitStream_WriteU8(stream,s->y);MCBitStream_WriteI16(stream,s->z);RakDataOutput out;RakDataOutput_Init(&out,stream);Tag_writeNamedTag(s->data,&out);}
U0 EntityDataPacket_read(Packet *base,MCBitStream *stream) {EntityDataPacket *s=base;I16 x=0,z=0;U8 y=0;MCBitStream_ReadI16(stream,&x);MCBitStream_ReadU8(stream,&y);MCBitStream_ReadI16(stream,&z);s->x=x;s->y=y;s->z=z;if(stream->failed)return;RakDataInput input;RakDataInput_Init(&input,stream);Tag *tag=Tag_readNamedTag(&input);if(!tag || Tag_getId(tag)!=10 || input.failed){if(tag)Tag_DeleteDeep(tag);stream->failed=TRUE;return;}if(s->data)Tag_DeleteDeep(s->data);s->data=tag(CompoundTag*);}
U0 EntityDataPacket_Init(EntityDataPacket *s) {memset(s,0,sizeof(EntityDataPacket));Packet_Init(s);s->packetId=PID_ENTITY_DATA_PACKET;s->writeFn=&EntityDataPacket_write;s->readFn=&EntityDataPacket_read;s->destroyFn=&EntityDataPacket_Destroy;s->data=MC_Alloc(sizeof(CompoundTag));CompoundTag_InitEmpty(s->data);}
U0 EntityDataPacket_InitValues(EntityDataPacket *s,I32 x,I32 y,I32 z,CompoundTag *tag) {EntityDataPacket_Init(s);s->x=x;s->y=y;s->z=z;if(tag){Tag_DeleteDeep(s->data);s->data=Tag_copy(tag)(CompoundTag*);}}

#endif
