// Batch022: network/mco/RestCaller; explicit host ABI, see docs/BATCH022.md.
class RestCaller {MCString baseURL,key,user,sid,gameVersion;U0 *ctx;Bool (*makeRequest)(U0*,RestCallerObject*);U0 (*requestStop)(U0*);};
U0 RestCaller_Init(RestCaller*,MCString*,MCString*);
U0 RestCaller_Destroy(RestCaller*);
U0 RestCaller_addToCookieData(MCString*,U8*,MCString*);
U0 RestCaller_getCookieDataAsString(RestCaller*,MCString*);
U0 RestCaller_urlEscape(MCString*,MCString*);
Bool RestCaller_call(RestCaller*,I32,I32,MCString*,MCString*,RestCallTagData*);
U0 RestCaller_setSID(RestCaller*,MCString*);U0 RestCaller_setUser(RestCaller*,MCString*);U0 RestCaller_setKey(RestCaller*,MCString*);
