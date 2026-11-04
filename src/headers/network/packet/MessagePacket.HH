// Batch 003. Source: minecraftpe/headers/network/packet/MessagePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_MESSAGEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_MESSAGEPACKET_HPP
class MessagePacket : Packet { MCString source ;
 MCString message ;
 };
U0 MessagePacket_read(Packet *base,MCBitStream *stream) { MessagePacket *self=base;MCBitStream_ReadString ( stream , & self -> source ) ;
 MCBitStream_ReadString ( stream , & self -> message ) ;
}
U0 MessagePacket_write(Packet *base,MCBitStream *stream) { MessagePacket *self=base;MCBitStream_WriteU8 ( stream , PID_MESSAGE_PACKET ) ;
 MCBitStream_WriteString ( stream , & self -> source ) ;
 MCBitStream_WriteString ( stream , & self -> message ) ;
}
U0 MessagePacket_Destroy(Packet *base) { MessagePacket *self=base;MCString_Destroy(&self->source);MCString_Destroy(&self->message);}
U0 MessagePacket_Init(MessagePacket *self) { memset(self,0,sizeof(MessagePacket));Packet_Init(self);self->packetId=PID_MESSAGE_PACKET;self->readFn=&MessagePacket_read;self->writeFn=&MessagePacket_write;self->destroyFn=&MessagePacket_Destroy;MCString_Init(&self->source);MCString_Init(&self->message);}
U0 MessagePacket_InitValues(MessagePacket *self,MCString * message , MCString * source) { MessagePacket_Init(self);MCString_Assign ( & self -> message , message ) ;
 MCString_Assign ( & self -> source , source ) ;
}

#endif

