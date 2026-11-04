// Batch 003. Source: minecraftpe/headers/network/packet/LoginPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_LOGINPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_LOGINPACKET_HPP
class LoginPacket : Packet { MCString username ;
 I32 protocol1 , protocol2 ;
 I32 clientId ;
 MCString data ;
 };
U0 LoginPacket_read(Packet *base,MCBitStream *stream) { LoginPacket *self=base;MCBitStream_ReadString ( stream , & self -> username ) ;
 {
 MCBitStream_ReadI32 ( stream , & self -> protocol1 ) ;
 MCBitStream_ReadI32 ( stream , & self -> protocol1 ) ;
 
}
 {
 MCBitStream_ReadI32 ( stream , & self -> clientId ) ;
 MCBitStream_ReadString ( stream , & self -> data ) ;
 
}
}
U0 LoginPacket_write(Packet *base,MCBitStream *stream) { LoginPacket *self=base;MCBitStream_WriteU8 ( stream , PID_LOGIN_PACKET ) ;
 MCBitStream_WriteString ( stream , & self -> username ) ;
 MCBitStream_WriteI32 ( stream , self -> protocol1 ) ;
 MCBitStream_WriteI32 ( stream , self -> protocol2 ) ;
 MCBitStream_WriteI32 ( stream , self -> clientId ) ;
 MCBitStream_WriteString ( stream , & self -> data ) ;
}
U0 LoginPacket_Destroy(Packet *base) { LoginPacket *self=base;MCString_Destroy(&self->username);MCString_Destroy(&self->data);}
U0 LoginPacket_Init(LoginPacket *self) { memset(self,0,sizeof(LoginPacket));Packet_Init(self);self->packetId=PID_LOGIN_PACKET;self->readFn=&LoginPacket_read;self->writeFn=&LoginPacket_write;self->destroyFn=&LoginPacket_Destroy;MCString_Init(&self->username);MCString_Init(&self->data);self -> clientId = 0 ;
 self -> protocol1 = self -> protocol2 = - 1 ;
}
U0 LoginPacket_InitValues(LoginPacket *self,MCString * name , I32 clientId , MCString * payload) { LoginPacket_Init(self);self -> clientId = clientId ;
 self -> protocol1 = 14 ;
 self -> protocol2 = 14 ;
 MCString_Assign ( & self -> username , name ) ;
 MCString_Assign ( & self -> data , payload ) ;
}

#endif

