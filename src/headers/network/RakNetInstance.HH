// Requires a real RakNet-compatible backend; this is NOT an implementation of RakNet transport.
class MCRakHost027 {U0 *context;Bool (*start)(U0*,Bool,I32,I32);Bool (*connect)(U0*,U8*,I32);U0 (*disconnect)(U0*);Bool (*send)(U0*,U64,U8*,I32,I32,I32);U0 (*close)(U0*,U64);};
class MCPong027 {MCString address,name;I32 time;Bool stale;};
class RakNetInstance {MCRakHost027 *host;MCPacketFactoryHost019 *factory;Bool _isServer,loggedIn,isPingingHostsMaybe,active,broken;U64 localGuid;MCVector serverList;};
U0 RakNetInstance_Init(RakNetInstance*,MCRakHost027*,MCPacketFactoryHost019*);U0 RakNetInstance_Destroy(RakNetInstance*);Bool RakNetInstance_host(RakNetInstance*,I32,I32);Bool RakNetInstance_connect(RakNetInstance*,U8*,I32);U0 RakNetInstance_disconnect(RakNetInstance*);Bool RakNetInstance_send(RakNetInstance*,U64,Packet*);Bool RakNetInstance_receive(RakNetInstance*,U64,U8*,I32,MCPacketReceiver*);I32 RakNetInstance_handleUnconnectedPong(RakNetInstance*,MCString*,MCString*,U8*,I32,Bool);
