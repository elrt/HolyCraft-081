#ifndef MC021_NETWORK_PACKET_ADDPLAYERPACKET
#define MC021_NETWORK_PACKET_ADDPLAYERPACKET
class MCPacketPlayer021 {MCPacketEntity009 e;U64 guid;MCString username;F32 ridingHeight;MCPacketItem009 *selected;SynchedEntityData *data;};
class AddPlayerPacket: Packet {I32 field_C;U64 clientId;MCString username;I32 eid;F32 x,y,z,pitch,yaw;I16 itemId,itemAuxValue;MCPtrVector entityData;SynchedEntityData *dataToSend;};
U0 AddPlayerPacket_Destroy(Packet *base);
U0 AddPlayerPacket_write(Packet *base,MCBitStream *stream);
U0 AddPlayerPacket_read(Packet *base,MCBitStream *stream);
U0 AddPlayerPacket_Init(AddPlayerPacket *s);
U0 AddPlayerPacket_InitPlayer(AddPlayerPacket *s,MCPacketPlayer021 *p);

U0 AddPlayerPacket_Destroy(Packet *base) {AddPlayerPacket *s=base;DataItem2_DeleteList(&s->entityData);MCString_Destroy(&s->username);}
U0 AddPlayerPacket_write(Packet *base,MCBitStream *stream) {AddPlayerPacket *s=base;MCBitStream_WriteU8(stream,PID_ADD_PLAYER_PACKET);MCBitStream_WriteU64(stream,s->clientId);MCBitStream_WriteString(stream,&s->username);MCBitStream_WriteI32(stream,s->eid);MCBitStream_WriteF32(stream,s->x);MCBitStream_WriteF32(stream,s->y);MCBitStream_WriteF32(stream,s->z);MCBitStream_WriteI8(stream,PacketUtil_Rot_degreesToChar(s->yaw));MCBitStream_WriteI8(stream,PacketUtil_Rot_degreesToChar(s->pitch));MCBitStream_WriteI16(stream,s->itemId);MCBitStream_WriteI16(stream,s->itemAuxValue);RakDataOutput out;RakDataOutput_Init(&out,stream);if(s->dataToSend)SynchedEntityData_packAll(s->dataToSend,&out);else SynchedEntityData_pack(NULL,&out);}
U0 AddPlayerPacket_read(Packet *base,MCBitStream *stream) {AddPlayerPacket *s=base;U8 yaw=0,pitch=0;MCBitStream_ReadU64(stream,&s->clientId);MCBitStream_ReadString(stream,&s->username);MCBitStream_ReadI32(stream,&s->eid);MCBitStream_ReadF32(stream,&s->x);MCBitStream_ReadF32(stream,&s->y);MCBitStream_ReadF32(stream,&s->z);MCBitStream_ReadU8(stream,&yaw);MCBitStream_ReadU8(stream,&pitch);MCBitStream_ReadI16(stream,&s->itemId);MCBitStream_ReadI16(stream,&s->itemAuxValue);RakDataInput input;RakDataInput_Init(&input,stream);DataItem2_DeleteList(&s->entityData);if(!SynchedEntityData_unpack(&input,&s->entityData))stream->failed=TRUE;s->yaw=PacketUtil_Rot_degreesToChar(yaw(F32));s->pitch=PacketUtil_Rot_charToDegrees(pitch(I8));}
U0 AddPlayerPacket_Init(AddPlayerPacket *s) {memset(s,0,sizeof(AddPlayerPacket));Packet_Init(s);s->packetId=PID_ADD_PLAYER_PACKET;s->writeFn=&AddPlayerPacket_write;s->readFn=&AddPlayerPacket_read;s->destroyFn=&AddPlayerPacket_Destroy;MCString_Init(&s->username);MCPtrVector_Init(&s->entityData);}
U0 AddPlayerPacket_InitPlayer(AddPlayerPacket *s,MCPacketPlayer021 *p) {AddPlayerPacket_Init(s);s->eid=p->e.eid;s->clientId=p->guid;s->x=p->e.x;s->y=p->e.y-p->ridingHeight;s->z=p->e.z;s->pitch=p->e.pitch;s->yaw=p->e.yaw;s->dataToSend=p->data;MCString_Assign(&s->username,&p->username);if(p->selected){s->itemId=p->selected->id;s->itemAuxValue=p->selected->aux;}}

#endif
