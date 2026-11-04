// Batch022: network/mco/RestRequestJob; explicit host ABI, see docs/BATCH022.md.
U0 RestRequestJob_StopHook022(Job *s) {RestRequestJob_stop(s);}
U0 RestRequestJob_RunHook022(Job *s) {RestRequestJob_run(s);}
U0 RestRequestJob_FinishHook022(Job *s) {RestRequestJob_finish(s);}
U0 RestRequestJob_DestroyHook022(Job *s) {RestRequestJob_Destroy(s);}
U0 RestRequestJob_Init(RestRequestJob *s,RestService *service,I32 type) {memset(s,0,sizeof(RestRequestJob));Job_Init(s);s->service=service;s->requestType=type;MCString_Init(&s->url);MCString_Init(&s->body);MCString_Init(&s->response);RestCallTagData_Init(&s->tag);MCThread_Check(pthread_mutex_init(MC_MutexAddress(&s->ioMutex)));MCThread_Check(pthread_cond_init(MC_CondAddress(&s->ready)));s->stopFn=&RestRequestJob_StopHook022;s->runFn=&RestRequestJob_RunHook022;s->finishFn=&RestRequestJob_FinishHook022;s->destroyFn=&RestRequestJob_DestroyHook022;}
U0 RestRequestJob_Destroy(RestRequestJob *s) {MCString_Destroy(&s->url);MCString_Destroy(&s->body);MCString_Destroy(&s->response);RestCallTagData_Destroy(&s->tag);MCThread_Check(pthread_cond_destroy(MC_CondAddress(&s->ready)));MCThread_Check(pthread_mutex_destroy(MC_MutexAddress(&s->ioMutex)));}
U8 *RestRequestJob_Method(I32 type) {if(type==RRT_POST)return "POST";if(type==RRT_PUT)return "PUT";if(type==RRT_DELETE)return "DELETE";return "GET";}
U0 RestRequestJob_setBody(RestRequestJob *s,MCString *v) {MCString_Assign(&s->body,v);}
U0 RestRequestJob_setTagData(RestRequestJob *s,RestCallTagData *v) {s->tag.guid_g=v->guid_g;MCString_Assign(&s->tag.str,&v->str);}
U0 RestRequestJob_setMethod(RestRequestJob *s,MCString *fmt,MCVector *args) {MCString out;Util_simpleFormat(&out,fmt,args);MCString_Assign(&s->url,&out);MCString_Destroy(&out);}
U0 RestRequestJob_stop(RestRequestJob *s) {Job_trySetStatus(s,JS_STOPPED);}
U0 RestRequestJob_run(RestRequestJob *s) {Job_trySetStatus(s,JS_STARTED);usleep(1000000);Job_trySetStatus(s,JS_FINISHED);}
U0 RestRequestJob_finish(RestRequestJob *s) {if(Job_getStatus(s)==JS_STOPPED)return;MCString msg;MCString_FromC(&msg,"Yey");RestCallTagData tag;RestCallTagData_Init(&tag);if((s->success!=NULL))s->success(s->callbackContext,200,&msg,&tag);RestCallTagData_Destroy(&tag);MCString_Destroy(&msg);}
U0 RestRequestJob_launchRequest(RestRequestJob *s,ThreadCollection *pool) {Job_addToThreadCollection(s,pool);}
RestRequestJob *RestRequestJob_CreateJob(I32 type,RestService *service,MCRestBackend022 *backend,Bool android) {RestRequestJob *s=MC_Alloc(sizeof(RestRequestJob));if(android)AndroidRestRequestJob_Init(s,service,type,backend);else CurlRestRequestJob_Init(s,service,type,backend);return s;}
