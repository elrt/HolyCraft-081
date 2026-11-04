#ifndef MCPE_NET_EVENT_CALLBACK_021
#define MCPE_NET_EVENT_CALLBACK_021
class MCNetPlayer021 {U0 *identity;U64 guid;I32 eid;Bool isPlayer;F32 yaw,pitch;};
class MCNetHost021 {U0 *ctx;MCPtrVector *players;MCNetPlayer021 *(*entity)(U0 *,I32);I32 (*queryType)(U0 *,MCNetPlayer021 *);U0 (*move)(U0 *,MCNetPlayer021 *,F32,F32,F32,F32,F32);U0 (*reset)(U0 *,MCNetPlayer021 *);U0 (*resetPos)(U0 *,MCNetPlayer021 *,Bool);};
class NetEventCallback {MCPacketReceiver receiver;MCNetHost021 *host;};
U0 NetEventCallback_Init(NetEventCallback *s,MCNetHost021 *h);
MCNetPlayer021 *NetEventCallback_findPlayerGuid(NetEventCallback *s,U64 guid);
MCNetPlayer021 *NetEventCallback_findPlayerId(NetEventCallback *s,I32 id);
MCNetPlayer021 *NetEventCallback_findPlayer(NetEventCallback *s,I32 id,U64 *guid);
U0 NetEventCallback_handleRespawn(NetEventCallback *s,U64 guid,RespawnPacket *packet);
Bool NetEventCallback_allowIncomingPacketId(NetEventCallback *s,U64 guid,I32 id);
U0 NetEventCallback_event(NetEventCallback *s,I32 event,U0 *data);
#endif
