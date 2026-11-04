// Concrete connector -> RestRequestJob -> ThreadCollection -> parser integration.
// Caller retains connector, bridge and backend until all queued/running jobs are joined.
class MCMCOBridge022 {MojangConnector *connector;MCRestBackend022 *backend;MC022DrawHost proxy,display;Bool android;};
U0 MC022_BridgeStatusOK(U0 *ctx,I32 code,MCString *body,RestCallTagData *tag) {MCMCOBridge022 *b=ctx;MojangConnector_applyStatus(b->connector,body,FALSE);}
U0 MC022_BridgeStatusError(U0 *ctx,Bool stopped,Bool network,I32 code,MCString *body,RestCallTagData *tag) {MCMCOBridge022 *b=ctx;MojangConnector_applyStatus(b->connector,body,TRUE);}
U0 MC022_BridgeLogoutOK(U0 *ctx,I32 code,MCString *body,RestCallTagData *tag) {MCMCOBridge022 *b=ctx;MojangConnector_clearLoginInformation(b->connector);}
U0 MC022_BridgeLogoutError(U0 *ctx,Bool stopped,Bool network,I32 code,MCString *body,RestCallTagData *tag) {}
U0 MC022_BridgeStatus(MCMCOBridge022 *b) {RestRequestJob *job=RestRequestJob_CreateJob(RRT_GET,&b->connector->mcoService,b->backend,b->android);MC022_Set(&job->url,"/info/status");job->callbackContext=b;job->success=&MC022_BridgeStatusOK;job->error=&MC022_BridgeStatusError;RestRequestJob_launchRequest(job,&b->connector->threadCollection);Job_Release(job);}
U0 MC022_BridgeInvalidate(U0 *ctx,MCString *body) {MCMCOBridge022 *b=ctx;RestRequestJob *job=RestRequestJob_CreateJob(RRT_POST,&b->connector->accountService,b->backend,b->android);MC022_Set(&job->url,"/invalidate");RestRequestJob_setBody(job,body);job->callbackContext=b;job->success=&MC022_BridgeLogoutOK;job->error=&MC022_BridgeLogoutError;RestRequestJob_launchRequest(job,&b->connector->threadCollection);Job_Release(job);}
U0 MC022_BridgeEvent(U0 *ctx,I32 op,I64 arg,U0 *data) {MCMCOBridge022 *b=ctx;if(op==MC022_STATUS_REQUEST)MC022_BridgeStatus(b);MC022_Event(&b->display,op,arg,data);}
U0 MC022_BridgeQuad(U0 *ctx,MC022Vertex *q,Bool texture) {MCMCOBridge022 *b=ctx;if(b->display.quad!=NULL)b->display.quad(b->display.ctx,q,texture);}
U0 MC022_BridgeText(U0 *ctx,U8 *s,I32 x,I32 y,U32 color,Bool shadow) {MCMCOBridge022 *b=ctx;MC022_Text(&b->display,s,x,y,color,shadow);}
I32 MC022_BridgeWidth(U0 *ctx,U8 *s) {MCMCOBridge022 *b=ctx;return MC022_TextWidth(&b->display,s);}
U0 MC022_BridgeTexture(U0 *ctx,U8 *s) {MCMCOBridge022 *b=ctx;MC022_Texture(&b->display,s);}
U0 MC022_BridgeClip(U0 *ctx,Bool on,I32 x,I32 y,I32 w,I32 h) {MCMCOBridge022 *b=ctx;MC022_Clip(&b->display,on,x,y,w,h);}
U0 MCMCOBridge022_Init(MCMCOBridge022 *b,MojangConnector *connector,MCRestBackend022 *backend,MC022DrawHost *display,Bool android) {memset(b,0,sizeof(MCMCOBridge022));b->connector=connector;b->backend=backend;b->android=android;if(display)b->display=*display;b->proxy.ctx=b;b->proxy.event=&MC022_BridgeEvent;b->proxy.quad=&MC022_BridgeQuad;b->proxy.text=&MC022_BridgeText;b->proxy.textWidth=&MC022_BridgeWidth;b->proxy.texture=&MC022_BridgeTexture;b->proxy.clip=&MC022_BridgeClip;}
U0 MCMCOBridge022_AttachLogin(MCMCOBridge022 *b,LoginOption *option) {option->ctx=b;option->invalidate=&MC022_BridgeInvalidate;}
