#ifndef MC021_NETWORK_PACKET_ADDMOBPACKET
#define MC021_NETWORK_PACKET_ADDMOBPACKET
class AddMobPacket: Packet {I32 eid,type;F32 x,y,z,yaw,pitch;MCPtrVector readData;SynchedEntityData *synchedData;};
U0 AddMobPacket_Destroy(Packet *base);
U0 AddMobPacket_write(Packet *base,MCBitStream *stream);
U0 AddMobPacket_read(Packet *base,MCBitStream *stream);
U0 AddMobPacket_Init(AddMobPacket *s);
U0 AddMobPacket_InitEntity(AddMobPacket *s,MCPacketEntity009 *e,SynchedEntityData *data);

U0 AddMobPacket_Destroy(Packet *base) {AddMobPacket *s=base;DataItem2_DeleteList(&s->readData);}
U0 AddMobPacket_write(Packet *base,MCBitStream *stream) {AddMobPacket *s=base;MCBitStream_WriteU8(stream,PID_ADD_MOB_PACKET);MCBitStream_WriteI32(stream,s->eid);MCBitStream_WriteI32(stream,s->type);MCBitStream_WriteF32(stream,s->x);MCBitStream_WriteF32(stream,s->y);MCBitStream_WriteF32(stream,s->z);MCBitStream_WriteI8(stream,PacketUtil_Rot_degreesToChar(s->pitch));MCBitStream_WriteI8(stream,PacketUtil_Rot_degreesToChar(s->yaw));RakDataOutput out;RakDataOutput_Init(&out,stream);if(s->synchedData)SynchedEntityData_packAll(s->synchedData,&out);else SynchedEntityData_pack(NULL,&out);}
U0 AddMobPacket_read(Packet *base,MCBitStream *stream) {AddMobPacket *s=base;U8 a=0,b=0;MCBitStream_ReadI32(stream,&s->eid);MCBitStream_ReadI32(stream,&s->type);MCBitStream_ReadF32(stream,&s->x);MCBitStream_ReadF32(stream,&s->y);MCBitStream_ReadF32(stream,&s->z);MCBitStream_ReadU8(stream,&a);MCBitStream_ReadU8(stream,&b);RakDataInput input;RakDataInput_Init(&input,stream);DataItem2_DeleteList(&s->readData);if(!SynchedEntityData_unpack(&input,&s->readData))stream->failed=TRUE;s->pitch=PacketUtil_Rot_degreesToChar(a(F32));s->yaw=PacketUtil_Rot_charToDegrees(b(I8));}
U0 AddMobPacket_Init(AddMobPacket *s) {memset(s,0,sizeof(AddMobPacket));Packet_Init(s);s->packetId=PID_ADD_MOB_PACKET;s->writeFn=&AddMobPacket_write;s->readFn=&AddMobPacket_read;s->destroyFn=&AddMobPacket_Destroy;MCPtrVector_Init(&s->readData);}
U0 AddMobPacket_InitEntity(AddMobPacket *s,MCPacketEntity009 *e,SynchedEntityData *data) {AddMobPacket_Init(s);s->eid=e->eid;s->type=e->type;s->x=e->x;s->y=e->y;s->z=e->z;s->yaw=e->pitch;s->pitch=e->yaw;s->synchedData=data;}

#endif
