// Batch 003. Source: minecraftpe/headers/network/packet/SetTimePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_SETTIMEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_SETTIMEPACKET_HPP
class SetTimePacket : Packet { I32 timeValue ;
 Bool stopTime ;
 I8 align , align1 , align2 ;
 };
U0 SetTimePacket_read(Packet *base,MCBitStream *stream) { SetTimePacket *self=base;MCBitStream_ReadI32 ( stream , & self -> timeValue ) ;
 MCBitStream_ReadBool ( stream , & self -> stopTime ) ;
}
U0 SetTimePacket_write(Packet *base,MCBitStream *stream) { SetTimePacket *self=base;MCBitStream_WriteU8 ( stream , PID_SET_TIME_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> timeValue ) ;
 MCBitStream_WriteBool ( stream , self -> stopTime ) ;
}
U0 SetTimePacket_Destroy(Packet *base) { SetTimePacket *self=base;}
U0 SetTimePacket_Init(SetTimePacket *self) { memset(self,0,sizeof(SetTimePacket));Packet_Init(self);self->packetId=PID_SET_TIME_PACKET;self->readFn=&SetTimePacket_read;self->writeFn=&SetTimePacket_write;self->destroyFn=&SetTimePacket_Destroy;}
U0 SetTimePacket_InitValues(SetTimePacket *self,I32 tv , Bool stopTime) { SetTimePacket_Init(self);self -> timeValue = tv ;
 self -> stopTime = stopTime ;
}

#endif

