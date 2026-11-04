// Ported from minecraftpe/impl/rendering/entity/ArrowRenderer.cpp; host-facing representation, not C++ ABI.

U0 ArrowRenderer_Init(ArrowRenderer *s,MCG020 *g) {s->g=g;s->mesh.handle=NULL;g->listener(g->ctx,s,TRUE);}
U0 ArrowRenderer_onAppSuspended(ArrowRenderer *s) {if(s->mesh.handle)s->g->meshDelete(s->g->ctx,s->mesh.handle);s->mesh.handle=NULL;}
U0 ArrowRenderer_Destroy(ArrowRenderer *s) {s->g->listener(s->g->ctx,s,FALSE);ArrowRenderer_onAppSuspended(s);}
U0 ArrowRenderer_render(ArrowRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t) {MCG020 *g=s->g;if(!s->mesh.handle){MCG020_C(g,14,12);MCG020_C(g,15,1,0,0);
MCG020_C(g,16,-7,-2,-2,0,0.15625);MCG020_C(g,16,-7,-2,2,0.15625,0.15625);MCG020_C(g,16,-7,2,2,0.15625,0.3125);MCG020_C(g,16,-7,2,-2,0,0.3125);MCG020_C(g,15,0,0,1);
MCG020_C(g,16,-8,-2,0,0,0);MCG020_C(g,16,8,-2,0,0.5,0);MCG020_C(g,16,8,2,0,0.5,0.15625);MCG020_C(g,16,-8,2,0,0,0.15625);MCG020_C(g,15,0,1,0);
MCG020_C(g,16,-8,0,-2,0,0);MCG020_C(g,16,8,0,-2,0.5,0);MCG020_C(g,16,8,0,2,0.5,0.15625);MCG020_C(g,16,-8,0,2,0,0.15625);s->mesh.handle=g->meshEnd(g->ctx);}
g->lighting(g->ctx,e->identity,e->fancy,(t)(F32));MCG020_Bind(g,"item/arrows.png");MCG020_C(g,1);MCG020_C(g,7,0xBC0);MCG020_C(g,8,0xB44);MCG020_C(g,13,0xB52,1);MCG020_C(g,3,x,y,z);MCG020_C(g,5,(e->a.prevYaw+(e->a.yaw-e->a.prevYaw)*t)-90,0,1,0);MCG020_C(g,5,e->a.prevPitch+(e->a.pitch-e->a.prevPitch)*t,0,0,1);F32 shake=e->shake-t;if(shake>0)MCG020_C(g,5,-(Mth_sin(shake*3)*shake),0,0,1);MCG020_C(g,5,45,1,0,0);MCG020_C(g,4,0.05625,0.05625,0.05625);MCG020_C(g,3,-4,0,0);g->meshDraw(g->ctx,s->mesh.handle);MCG020_C(g,13,0xB52,0);MCG020_C(g,7,0xB44);MCG020_C(g,8,0xBC0);MCG020_C(g,2);}
