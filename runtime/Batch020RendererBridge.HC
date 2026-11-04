#ifndef MCPE_BATCH020_RENDERER_BRIDGE
#define MCPE_BATCH020_RENDERER_BRIDGE
// Executable bridge from dispatcher callbacks to four concrete HolyC renderers.
// It deliberately returns NULL for all other IDs; the host may provide those.
// The bridge owns both the callback record and the concrete implementation.
class MCRenderBridge020 {MCRenderer020 callbacks;I32 kind;U0 *impl,*dispatcher,*level;MCG020 *g;EntityRenderer post;};
U0 MCRenderBridge020_InitFn(U0 *object,U0 *dispatcher) {MCRenderBridge020 *b=object;b->dispatcher=dispatcher;}
U0 MCRenderBridge020_LevelFn(U0 *object,U0 *level) {MCRenderBridge020 *b=object;b->level=level;}
U0 MCRenderBridge020_RenderFn(U0 *object,U0 *entity,F32 x,F32 y,F32 z,F32 angle,F32 t) {MCRenderBridge020 *b=object;
if(b->kind==15)ArrowRenderer_render(b->impl,entity,x,y,z,angle,t);
else if(b->kind==19)PaintingRenderer_render(b->impl,entity,x,y,z,angle,t);
else if(b->kind==101)ChestRenderer_render(b->impl,entity,x,y,z,angle,t!=0);
else if(b->kind==102)SignRenderer_render(b->impl,entity,x,y,z,angle,t!=0);}
U0 MCRenderBridge020_PostFn(U0 *object,U0 *entity,F32 x,F32 y,F32 z,F32 angle,F32 t) {MCRenderBridge020 *b=object;if(b->kind<100)EntityRenderer_postRender(&b->post,entity,x,y,z,angle,t);}
U0 MCRenderBridge020_DestroyFn(U0 *object) {MCRenderBridge020 *b=object;
if(b->kind==15)ArrowRenderer_Destroy(b->impl);else if(b->kind==19)PaintingRenderer_Destroy(b->impl);else if(b->kind==101)ChestRenderer_Destroy(b->impl);else if(b->kind==102)SignRenderer_Destroy(b->impl);free(b->impl);free(b);}
MCRenderer020 *MC020_NewBuiltInRenderer(MCG020 *g,I32 id,Bool tile) {I32 kind=id;if(tile)kind+=100;if(kind!=15 && kind!=19 && kind!=101 && kind!=102)return NULL;
MCRenderBridge020 *b=MC_Alloc(sizeof(MCRenderBridge020));memset(b,0,sizeof(MCRenderBridge020));b->kind=kind;b->g=g;b->callbacks.object=b;b->callbacks.initFn=&MCRenderBridge020_InitFn;b->callbacks.newLevel=&MCRenderBridge020_LevelFn;b->callbacks.render=&MCRenderBridge020_RenderFn;b->callbacks.post=&MCRenderBridge020_PostFn;b->callbacks.destroy=&MCRenderBridge020_DestroyFn;EntityRenderer_Init(&b->post,g,NULL,TRUE);
if(kind==15){b->impl=MC_Alloc(sizeof(ArrowRenderer));ArrowRenderer_Init(b->impl,g);}else if(kind==19){b->impl=MC_Alloc(sizeof(PaintingRenderer));PaintingRenderer_Init(b->impl,g);}else if(kind==101){b->impl=MC_Alloc(sizeof(ChestRenderer));ChestRenderer_Init(b->impl,g);}else{b->impl=MC_Alloc(sizeof(SignRenderer));SignRenderer_Init(b->impl,g);}return &b->callbacks;}
#endif
