// Batch022: network/mco/RestRequestJob; explicit host ABI, see docs/BATCH022.md.
class RestRequestJob;
class MCRestBackend022 {U0 *ctx;Bool (*execute)(U0*,RestRequestJob*,MCString*,U8*,MCString*,MCString*,I32*,MCString*);U0 (*start)(U0*,RestRequestJob*,I32,MCString*,U8*,MCString*,MCString*);U0 (*abort)(U0*,I32);};
class RestRequestJob: Job {MCString url,body,response;RestService *service;I32 requestType,httpCode,requestId;RestCallTagData tag;U0 *callbackContext;U0 (*success)(U0*,I32,MCString*,RestCallTagData*);U0 (*error)(U0*,Bool,Bool,I32,MCString*,RestCallTagData*);MCRestBackend022 *backend;MCNativeMutex ioMutex;MCNativeCond ready;Bool started,completed;};
U0 RestRequestJob_Init(RestRequestJob *s,RestService *service,I32 type);
U0 RestRequestJob_setBody(RestRequestJob *s,MCString *v);
U0 RestRequestJob_setTagData(RestRequestJob *s,RestCallTagData *v);
U0 RestRequestJob_setMethod(RestRequestJob *s,MCString *fmt,MCVector *args);
U8 *RestRequestJob_Method(I32 type);
U0 RestRequestJob_Destroy(RestRequestJob *s);
U0 RestRequestJob_stop(RestRequestJob *s);
U0 RestRequestJob_run(RestRequestJob *s);
U0 RestRequestJob_finish(RestRequestJob *s);
U0 RestRequestJob_launchRequest(RestRequestJob *s,ThreadCollection *pool);
RestRequestJob *RestRequestJob_CreateJob(I32 type,RestService *service,MCRestBackend022 *backend,Bool android);
