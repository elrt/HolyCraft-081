// Batch 003. Source: minecraftpe/headers/network/packet/LoginStatusPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_LOGINSTATUSPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_LOGINSTATUSPACKET_HPP
class LoginStatusPacket : Packet { I32 status ;
 };
U0 LoginStatusPacket_read(Packet *base,MCBitStream *stream) { LoginStatusPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> status ) ;
}
U0 LoginStatusPacket_write(Packet *base,MCBitStream *stream) { LoginStatusPacket *self=base;MCBitStream_WriteU8 ( stream , PID_LOGIN_STATUS_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> status ) ;
}
U0 LoginStatusPacket_Destroy(Packet *base) { LoginStatusPacket *self=base;}
U0 LoginStatusPacket_Init(LoginStatusPacket *self) { memset(self,0,sizeof(LoginStatusPacket));Packet_Init(self);self->packetId=PID_LOGIN_STATUS_PACKET;self->readFn=&LoginStatusPacket_read;self->writeFn=&LoginStatusPacket_write;self->destroyFn=&LoginStatusPacket_Destroy;}
U0 LoginStatusPacket_InitValues(LoginStatusPacket *self,I32 status) { LoginStatusPacket_Init(self);self -> status = status ;
}

#endif

