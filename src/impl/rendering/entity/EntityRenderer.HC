// Ported from minecraftpe/impl/rendering/entity/EntityRenderer.cpp; host-facing representation, not C++ ABI.

I32 EntityRenderer_flameCounter020=0;
U0 EntityRenderer_Init(EntityRenderer *s,MCG020 *g,U0 *dispatcher,Bool fancy) {s->g=g;s->dispatcher=dispatcher;s->fancy=fancy;}
U0 EntityRenderer_bindTexture(EntityRenderer *s,MCString *name) {s->g->bind(s->g->ctx,name);}
U0 * EntityRenderer_getFont(EntityRenderer *s) {return s->g->getFont(s->g->ctx);}
Bool EntityRenderer_isFancy(EntityRenderer *s) {return s->fancy;}
U0 EntityRenderer_renderFlat(MCG020 *g,AABB *bb) {MCG020_C(g,14,24);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
MCG020_C(g,18,1);}
U0 EntityRenderer_renderBox(MCG020 *g,AABB *bb,F32 x,F32 y,F32 z) {MCG020_C(g,8,0xDE1);MCG020_C(g,6,1,1,1,1);MCG020_C(g,14,24);MCG020_C(g,17,x,y,z);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->minX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->minX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->minZ);
	MCG020_C(g,19,bb->maxX, bb->maxY, bb->maxZ);
	MCG020_C(g,19,bb->maxX, bb->minY, bb->maxZ);
MCG020_C(g,17,0,0,0);MCG020_C(g,18,1);MCG020_C(g,7,0xDE1);}
U0 EntityRenderer_renderFlame(EntityRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 t) {MCG020 *g=s->g;Vec3 point;g->randomPoint(g->ctx,e->identity,&point);if(EntityRenderer_flameCounter020&1){F32 yoff=1;if(point.y>=e->a.y)yoff=0;U0 *p=g->particle(g->ctx,0,(point.x)(F32),(point.y+yoff)(F32),(point.z)(F32),(e->motionX*0.5)(F32),(0)(F32),(e->motionZ*0.5)(F32),250);if(p)g->halfLife(g->ctx,p);}++EntityRenderer_flameCounter020;if(EntityRenderer_flameCounter020==10){EntityRenderer_flameCounter020=0;U0 *p=g->particle(g->ctx,1,(point.x)(F32),(e->a.minY)(F32),(point.z)(F32),(e->motionX*0.5)(F32),(0)(F32),(e->motionZ*0.5)(F32),0);if(p)g->particleEntity(g->ctx,p,e->identity);}}
U0 EntityRenderer_postRender(EntityRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t) {if(e->onFire)EntityRenderer_renderFlame(s,e,x,y,z,t);}
U0 EntityRenderer_renderName(EntityRenderer *s,MCRenderEntity020 *e,F32 t) {}
U0 EntityRenderer_Destroy(EntityRenderer *s) {}
