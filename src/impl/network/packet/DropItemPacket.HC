// Batch 009: minecraftpe/impl/network/packet/DropItemPacket.cpp includes the header only.
U0 DropItemPacket_Init(DropItemPacket *s) { memset(s,0,sizeof(DropItemPacket));Packet_Init(s);s->packetId=PID_DROP_ITEM_PACKET;s->writeFn=&DropItemPacket_write;s->readFn=&DropItemPacket_read; }
U0 DropItemPacket_InitValues(DropItemPacket *s,I32 eid,U8 motionType,MCPacketItem009 *item) { DropItemPacket_Init(s);s->eid=eid;s->motionType=motionType;s->itemInstance=*item; }
U0 DropItemPacket_write(Packet *p,MCBitStream *s) { DropItemPacket *t=p;MCBitStream_WriteU8(s,PID_DROP_ITEM_PACKET);MCBitStream_WriteI32(s,t->eid);MCBitStream_WriteU8(s,t->motionType);PacketUtil_writeItemInstance(&t->itemInstance,s); }
U0 DropItemPacket_read(Packet *p,MCBitStream *s) { DropItemPacket *t=p;MCBitStream_ReadI32(s,&t->eid);MCBitStream_ReadU8(s,&t->motionType);PacketUtil_readItemInstance(&t->itemInstance,s); }
