// Batch022: android/AndroidRestCaller; explicit host ABI, see docs/BATCH022.md.
class MC022Pending {I32 id;RestCallerObject *request;};
class AndroidRestCaller: RestCaller {MCVector pending;MCNativeMutex pendingMutex;MCRestBackend022 *backend;};
U0 AndroidRestCaller_Init(AndroidRestCaller*,MCString*,MCString*,MCRestBackend022*);
U0 AndroidRestCaller_Destroy(AndroidRestCaller*);Bool AndroidRestCaller_makeRequest(AndroidRestCaller*,RestCallerObject*);
I32 AndroidRestCaller_getRequestIndex(AndroidRestCaller*,I32,RestCallerObject**);
U0 AndroidRestCaller_requestStop(AndroidRestCaller*);
Bool AndroidRestCaller_onRequestComplete(AndroidRestCaller*,I32,I32,MCString*);
