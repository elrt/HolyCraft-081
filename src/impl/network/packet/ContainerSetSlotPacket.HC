// Batch 009: minecraftpe/impl/network/packet/ContainerSetSlotPacket.cpp includes the header only.
U0 ContainerSetSlotPacket_Init(ContainerSetSlotPacket *s) { memset(s,0,sizeof(ContainerSetSlotPacket));Packet_Init(s);s->packetId=PID_CONTAINER_SET_SLOT_PACKET;s->writeFn=&ContainerSetSlotPacket_write;s->readFn=&ContainerSetSlotPacket_read; }
U0 ContainerSetSlotPacket_InitValues(ContainerSetSlotPacket *s,I8 c,I8 d,I16 e,MCPacketItem009 *it) { ContainerSetSlotPacket_Init(s);s->field_C=c;s->field_D=d;s->field_E=e;s->field_10=*it; }
U0 ContainerSetSlotPacket_write(Packet *p,MCBitStream *s) { ContainerSetSlotPacket *t=p;MCBitStream_WriteU8(s,PID_CONTAINER_SET_SLOT_PACKET);MCBitStream_WriteI8(s,t->field_D);MCBitStream_WriteI16(s,t->field_E);PacketUtil_writeItemInstance(&t->field_10,s); }
U0 ContainerSetSlotPacket_read(Packet *p,MCBitStream *s) { ContainerSetSlotPacket *t=p;MCBitStream_ReadI8(s,&t->field_D);MCBitStream_ReadI16(s,&t->field_E);PacketUtil_readItemInstance(&t->field_10,s); }
