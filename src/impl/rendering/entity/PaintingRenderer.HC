// Ported from minecraftpe/impl/rendering/entity/PaintingRenderer.cpp; host-facing representation, not C++ ABI.

U0 PaintingRenderer_Init(PaintingRenderer *s,MCG020 *g) {s->g=g;MCVector_Init(&s->motives,sizeof(MCPaintMesh020));g->listener(g->ctx,s,TRUE);}
U0 PaintingRenderer_onAppSuspended(PaintingRenderer *s) {I64 i;MCPaintMesh020 *m=s->motives.data(MCPaintMesh020*);for(i=0;i<s->motives.size;i++)s->g->meshDelete(s->g->ctx,m[i].handle);s->motives.size=0;}
U0 PaintingRenderer_Destroy(PaintingRenderer *s) {s->g->listener(s->g->ctx,s,FALSE);PaintingRenderer_onAppSuspended(s);MCVector_Destroy(&s->motives);}
U0 * PaintingRenderer_buildPainting(PaintingRenderer *s,I32 a2,I32 a3,I32 a4,I32 a5) {MCG020 *g=s->g;
	I32 v8; 
	F32 v9; 
	F32 v10; 
	I32 v11; 
	F32 v12; 
	I32 v13; 
	F32 v14; 
	F32 v15; 
	I32 v16; 
	I32 v17; 
	I32 v18; 
	I32 v19; 
	I32 v20; 
	I32 v21; 
	I32 v22; 
	I32 v23; 
	I32 v25; 

	v8 = 0;
	v9 = -a2 * 0.5;
	v10 = -a3 * 0.5;
	MCG020_C(g,14,0);
	v25 = a2 / 16;
	v23 = a4 + a2;
	while(v8 < v25) {
		v17 = 0;
		v19 = 16 * v8;
		v20 = 16 * (v8 + 1);
		v21 = v23 - 16;
		v16 = a5 + a3;
		while(1) {
			v18 = v16 - 16;
			if(v17 >= a3 / 16) {
				break;
			}
			v11 = v17 + 1;
			v12 = v10 + (16 * v11);
			v13 = v16;
			v22 = v11;
			v14 = v10 + (16 * (v11 + 0xFFFFFFF))(I32);
			MCG020_C(g,15,0,0,-1);
			v15 = v23 * 0.0039062;
			MCG020_C(g,16,v9 + v20, v14, -0.5, v21 * 0.0039062, v13 * 0.0039062);
			MCG020_C(g,16,v9 + v19, v14, -0.5, v15, v13 * 0.0039062);
			MCG020_C(g,16,v9 + v19, v12, -0.5, v15, v18 * 0.0039062);
			MCG020_C(g,16,v9 + v20, v12, -0.5, v21 * 0.0039062, v18 * 0.0039062);
			MCG020_C(g,15,0,0,1);
			MCG020_C(g,16,v9 + v20, v12, 0.5, 0.75, 0.0);
			MCG020_C(g,16,v9 + v19, v12, 0.5, 0.8125, 0.0);
			MCG020_C(g,16,v9 + v19, v14, 0.5, 0.8125, 0.0625);
			MCG020_C(g,16,v9 + v20, v14, 0.5, 0.75, 0.0625);
			MCG020_C(g,15,0,1,0);
			MCG020_C(g,16,v9 + v20, v12, -0.5, 0.75, 0.0019531);
			MCG020_C(g,16,v9 + v19, v12, -0.5, 0.8125, 0.0019531);
			MCG020_C(g,16,v9 + v19, v12, 0.5, 0.8125, 0.0019531);
			MCG020_C(g,16,v9 + v20, v12, 0.5, 0.75, 0.0019531);
			MCG020_C(g,15,0,-1,0);
			MCG020_C(g,16,v9 + v20, v14, 0.5, 0.75, 0.0019531);
			MCG020_C(g,16,v9 + v19, v14, 0.5, 0.8125, 0.0019531);
			MCG020_C(g,16,v9 + v19, v14, -0.5, 0.8125, 0.0019531);
			MCG020_C(g,16,v9 + v20, v14, -0.5, 0.75, 0.0019531);
			MCG020_C(g,15,1,0,0);
			MCG020_C(g,16,v9 + v20, v12, 0.5, 0.75195, 0.0);
			MCG020_C(g,16,v9 + v20, v14, 0.5, 0.75195, 0.0625);
			MCG020_C(g,16,v9 + v20, v14, -0.5, 0.75195, 0.0625);
			MCG020_C(g,16,v9 + v20, v12, -0.5, 0.75195, 0.0);
			MCG020_C(g,15,-1,0,0);
			MCG020_C(g,16,v9 + v19, v12, -0.5, 0.75195, 0.0);
			MCG020_C(g,16,v9 + v19, v14, -0.5, 0.75195, 0.0625);
			MCG020_C(g,16,v9 + v19, v14, 0.5, 0.75195, 0.0625);
			MCG020_C(g,16,v9 + v19, v12, 0.5, 0.75195, 0.0);
			v16 = v18;
			v17 = v22;
		}
		++v8;
		v23 -= 16;
	}
	return g->meshEnd(g->ctx);
}

U0 * PaintingRenderer_getMesh(PaintingRenderer *s,MCRenderEntity020 *e) {I64 i;MCPaintMesh020 *m=s->motives.data(MCPaintMesh020*);for(i=0;i<s->motives.size;i++)if(m[i].motive==e->motive)return m[i].handle;MCPaintMesh020 entry;entry.motive=e->motive;entry.handle=PaintingRenderer_buildPainting(s,e->motiveW,e->motiveH,e->motiveU,e->motiveV);MCVector_Push(&s->motives,&entry);return entry.handle;}
U0 PaintingRenderer_render(PaintingRenderer *s,MCRenderEntity020 *e,F32 x,F32 y,F32 z,F32 angle,F32 t) {MCG020 *g=s->g;U0 *mesh=PaintingRenderer_getMesh(s,e);g->lighting(g->ctx,e->identity,e->fancy,(t)(F32));MCG020_C(g,1);MCG020_C(g,3,x,y,z);MCG020_C(g,5,angle,0,1,0);MCG020_Bind(g,"art/kz.png");MCG020_C(g,4,0.0625,0.0625,0.0625);g->meshDraw(g->ctx,mesh);MCG020_C(g,2);}
