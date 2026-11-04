// Source connection/shape/collision branches. UVs are explicitly supplied, not an atlas loader.
class ThinFenceTile {Tile base;I32 glass;Bool drop;TextureUVCoordinateSet edge;};
Bool ThinFenceTile_Init(ThinFenceTile *s,MCRegistry023 *r,I32 id,I32 glass,Bool drop){memset(s,0,sizeof(ThinFenceTile));s->glass=glass;s->drop=drop;Bool ok=Tile_Init(&s->base,r,id,1,TRUE,FALSE);r->tiles[id].renderShape=18;return ok;}
Bool ThinFenceTile_attachsTo(ThinFenceTile *s,I32 id){if(id<0 || id>255)return FALSE;return s->base.registry->tiles[id].solid || id==s->base.id || id==s->glass;}
U0 MC027_FenceBox(ThinFenceTile *s,I32 x,I32 y,I32 z,AABB *test,MCVector *out){AABB a;Tile_getAABB(&s->base,x,y,z,&a);if(!test || MC025_Intersects(&a,test))MCVector_Push(out,&a);}
U0 ThinFenceTile_updateShape(ThinFenceTile *s,Level *level,I32 x,I32 y,I32 z){
		I32 v9; 
		Bool v10; 
		I32 v11; 
		Bool v12; 
		I32 v13; 
		Bool v14; 
		I32 v15; 
		Bool v16; 
		F32 v17; 
		F32 v18; 
		F32 v19; 
		F32 v20; 
		v9 = Level_getTile(level,x, y, z - 1);
		v10 = ThinFenceTile_attachsTo(s,v9);
		v11 = Level_getTile(level,x, y, z + 1);
		v12 = ThinFenceTile_attachsTo(s,v11);
		v13 = Level_getTile(level,x - 1, y, z);
		v14 = ThinFenceTile_attachsTo(s,v13);
		v15 = Level_getTile(level,x + 1, y, z);
		v16 = ThinFenceTile_attachsTo(s,v15);
		if (v14) {
			v17 = 0.5625;
			v18 = 0.0;
			if (v16) {
				v17 = 1.0;
			}
			LABEL_10: if (!v10) {
				goto LABEL_14;
			}
			goto LABEL_13;
		}
		if (v16) {
			v17 = 1.0;
			v18 = 0.4375;
			goto LABEL_10;
		}
		if (!v10) {
			if (!v12) {
				v18 = 0.0;
				v17 = 1.0;
				v19 = 0.0;
				v20 = 1.0;
				goto LABEL_29;
			}
			v17 = 0.5625;
			v18 = 0.4375;
			LABEL_20: v20 = 1.0;
			LABEL_27: v19 = 0.4375;
			goto LABEL_29;
		}
		v17 = 0.5625;
		v18 = 0.4375;
		LABEL_13: if (v12) {
			LABEL_28: v20 = 1.0;
			v19 = 0.0;
			goto LABEL_29;
		}
		LABEL_14: if (!v14 && !v16) {
			if (!v10) {
				if (!v12) {
					goto LABEL_28;
				}
				goto LABEL_20;
			}
			goto LABEL_22;
		}
		if (!v10) {
			if (!v12) {
				v20 = 0.5625;
				goto LABEL_27;
			}
			goto LABEL_20;
		}
		LABEL_22: v20 = 0.5625;
		if (v12) {
			v19 = 0.4375;
		} else {
			v19 = 0.0;
		}
		LABEL_29: Tile_setShape(&s->base,v18, 0.0, v19, v17, 1.0, v20);
	}
U0 ThinFenceTile_addAABBs(ThinFenceTile *s,Level *level,I32 x,I32 y,I32 z,AABB *a6,MCVector *a7){
		I32 v11; 
		I32 v12; 
		Bool v13; 
		I32 v14; 
		I32 v15; 
		Bool v16; 
		F32 v18; 
		F32 v22; 
		F32 a5; 
		F32 aaa; 
		Bool v25; 
		Bool v26; 
		Bool v27; 
		v11 = Level_getTile(level,x, y, z - 1);
		v25 = ThinFenceTile_attachsTo(s,v11);
		v12 = Level_getTile(level,x, y, z + 1);
		v13 = ThinFenceTile_attachsTo(s,v12);
		v14 = Level_getTile(level,x - 1, y, z);
		v27 = ThinFenceTile_attachsTo(s,v14);
		v15 = Level_getTile(level,x + 1, y, z);
		v16 = ThinFenceTile_attachsTo(s,v15);
		v26 = v16;
		if (v27) {
			if (!v16) {
				a5 = 0.5;
				LABEL_8: v18 = 0.0;
				goto LABEL_10;
			}
			LABEL_7: a5 = 1.0;
			goto LABEL_8;
		}
		if (!v16) {
			if (v25) {
				goto LABEL_11;
			}
			if (v13) {
				goto LABEL_22;
			}
			goto LABEL_7;
		}
		a5 = 1.0;
		v18 = 0.5;
		LABEL_10: Tile_setShape(&s->base,v18, 0.0, 0.4375, a5, 1.0, 0.5625);
		MC027_FenceBox(s,x,y,z,a6,a7);
		if (!v25) {
			LABEL_12: if (v27 || v26) {
				if (!v25) {
					if (!v13) {
						return;
					}
					goto LABEL_22;
				}
			} else if (!v25) {
				if (!v13) {
					goto LABEL_16;
				}
				LABEL_22: aaa = 1.0;
				v22 = 0.5;
				goto LABEL_23;
			}
			if (v13) {
				return;
			}
			aaa = 0.5;
			goto LABEL_20;
		}
		LABEL_11: if (!v13) {
			goto LABEL_12;
		}
		LABEL_16: aaa = 1.0;
		LABEL_20: v22 = 0.0;
		LABEL_23: Tile_setShape(&s->base,0.4375, 0.0, v22, 0.5625, 1.0, aaa);
		MC027_FenceBox(s,x,y,z,a6,a7);
	}
U0 ThinFenceTile_updateDefaultShape(ThinFenceTile *s){Tile_setShape(&s->base,0,0,0,1,1,1);}
Bool ThinFenceTile_shouldRenderFace(ThinFenceTile *s,Level *l,I32 x,I32 y,I32 z,I32 face){return Level_getTile(l,x,y,z)!=s->base.id && Tile_shouldRenderFace(&s->base,&l->world,x,y,z,face);}
I32 ThinFenceTile_getResource(ThinFenceTile *s){if(s->drop)return s->base.id;return 0;}
I32 ThinFenceTile_getRenderLayer(){return 1;}
