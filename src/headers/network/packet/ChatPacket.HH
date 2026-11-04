// Batch 003. Source: minecraftpe/headers/network/packet/ChatPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_CHATPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_CHATPACKET_HPP
class ChatPacket : Packet { MCString message ;
 Bool field_10 ;
 I8 field_11 , field_12 , field_13 ;
 };
U0 ChatPacket_read(Packet *base,MCBitStream *stream) { ChatPacket *self=base;MCBitStream_ReadString ( stream , & self -> message ) ;
}
U0 ChatPacket_write(Packet *base,MCBitStream *stream) { ChatPacket *self=base;MCBitStream_WriteU8 ( stream , PID_CHAT_PACKET ) ;
 MCBitStream_WriteString ( stream , & self -> message ) ;
}
U0 ChatPacket_Destroy(Packet *base) { ChatPacket *self=base;MCString_Destroy(&self->message);}
U0 ChatPacket_Init(ChatPacket *self) { memset(self,0,sizeof(ChatPacket));Packet_Init(self);self->packetId=PID_CHAT_PACKET;self->readFn=&ChatPacket_read;self->writeFn=&ChatPacket_write;self->destroyFn=&ChatPacket_Destroy;MCString_Init(&self->message);}
U0 ChatPacket_InitValues(ChatPacket *self,MCString * a2 , Bool a3) { ChatPacket_Init(self);I64 len = a2 -> size ;
 if ( len > 116 ) len = 116 ;
 MCString_Destroy ( & self -> message ) ;
 MCString_FromBytes ( & self -> message , a2 -> data , len ) ;
 self -> field_10 = a3 ;
}

#endif

