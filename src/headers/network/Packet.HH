// Batch 003. Source: minecraftpe/headers/network/Packet.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_HPP
class Packet { I32 packetPriorityMaybe,packetReliabilityMaybe,packetId;U0 (*readFn)(Packet *self,MCBitStream *stream);U0 (*writeFn)(Packet *self,MCBitStream *stream);U0 (*destroyFn)(Packet *self); };
class MCPacketReceiver { U0 *context;U0 (*handle)(U0 *context,U64 guid,I32 packetId,Packet *packet); };
U0 Packet_Init(Packet *self) { self->packetPriorityMaybe=1;self->packetReliabilityMaybe=2;self->packetId=0;self->readFn=NULL;self->writeFn=NULL;self->destroyFn=NULL; }
U0 Packet_read(Packet *self,MCBitStream *stream) { if(!self->readFn)exit(87);self->readFn(self,stream); }
U0 Packet_write(Packet *self,MCBitStream *stream) { if(!self->writeFn)exit(87);self->writeFn(self,stream); }
U0 Packet_handle(Packet *self,U64 guid,MCPacketReceiver *callback) { if(!callback || !callback->handle)exit(88);callback->handle(callback->context,guid,self->packetId,self); }
U0 Packet_Destroy(Packet *self) { if(self->destroyFn)self->destroyFn(self); }

#endif

