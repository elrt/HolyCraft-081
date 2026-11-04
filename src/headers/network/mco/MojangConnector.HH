// Batch022: network/mco/MojangConnector; explicit host ABI, see docs/BATCH022.md.
class MojangConnector {RestService accountService,mcoService;ThreadCollection threadCollection;LoginInformation login;MCString gameVersionNet,joinMCOPayload,serverKey;I32 status;Bool serverCreationEnabled,serviceEnabled;Random random;MCVector servers;MC022DrawHost *host;U0 *cryptoContext;Bool (*encryptECB)(U0*,MCString*,MCString*,MCString*);};
U0 MojangConnector_Init(MojangConnector*,MCString*,LoginInformation*,MC022DrawHost*);U0 MojangConnector_Destroy(MojangConnector*);
U0 MojangConnector_setLoginInformation(MojangConnector*,LoginInformation*);U0 MojangConnector_clearLoginInformation(MojangConnector*);
U0 MojangConnector_setStatus(MojangConnector*,I32);U0 MojangConnector_applyStatus(MojangConnector*,MCString*,Bool);
U0 MojangConnector_setServerKey(MojangConnector*,MCString*);U0 MojangConnector_setPayload(MojangConnector*,MCString*);
U0 MojangConnector_setMCOServerList(MojangConnector*,MCVector*);U0 MojangConnector_updateUIThread(MojangConnector*);
Bool MojangConnector_getEncryptedJoinDataString(MojangConnector*,MCString*,I64,MCString*,MCString*);
U0 MojangConnector_urlEncode(MCString*,MCString*);


Bool MojangConnector_isMCOCreateServersEnabled(MojangConnector*);Bool MojangConnector_isServiceEnabled(MojangConnector*);
U0 MojangConnector_setMCOCreateServersEnabled(MojangConnector*,Bool);U0 MojangConnector_setMCOServiceEnabled(MojangConnector*,Bool);
RestService *MojangConnector_getAccountService(MojangConnector*);RestService *MojangConnector_getMCOService(MojangConnector*);
ThreadCollection *MojangConnector_getThreadCollection(MojangConnector*);LoginInformation *MojangConnector_getLoginInformation(MojangConnector*);
I32 MojangConnector_getConnectionStatus(MojangConnector*);

