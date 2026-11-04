// Batch 019: host constructs the five packet types not yet ported.
#ifndef MCPE_MINECRAFT_PACKETS_HH
#define MCPE_MINECRAFT_PACKETS_HH
class MCPacketFactoryHost019 { U0 *ctx; Packet *(*newMissing)(U0 *ctx,I32 id); };
Packet *MinecraftPackets_createPacket(I32 id,MCPacketFactoryHost019 *host);
#endif
