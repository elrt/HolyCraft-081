// Source flow search and tick branches. Material/thickness and mixing require explicit bindings.
class LiquidTileDynamic {LiquidTile base;I32 field_D8;Bool field_DC[4];I32 field_E0[4];I32 waterMaterial,lavaMaterial,rock;Bool overworld;Bool blocked[256];U0 *context;U0 (*updateLiquid)(U0*,Level*,I32,I32,I32);};
U0 LiquidTileDynamic_Init(LiquidTileDynamic *s,Level *l,I32 id,I32 material,I32 rock){memset(s,0,sizeof(LiquidTileDynamic));LiquidTile_Init(&s->base,&l->adapter,id,material);s->waterMaterial=3;s->lavaMaterial=4;s->rock=rock;s->overworld=FALSE;/* Dimension::isOverworldMaybe=0 (Dimension.cpp:113) -> lava dropOff 2 */I32 i;for(i=1;i<256;i++){Tile *t=l->tileObjects[i];s->blocked[i]=l->registry->tiles[i].solid;if(t && t->material)s->blocked[i]=Material_blocksMotion(t->material) || Material_isSolid(t->material);}s->blocked[0]=FALSE;}
Bool LiquidTileDynamic_isWaterBlocking(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return TRUE;return s->blocked[Level_getTile(level,x,y,z)];}
I32 LiquidTileDynamic_getDepth(LiquidTileDynamic *s,Level *l,I32 x,I32 y,I32 z){if(MC027_Material(l,x,y,z)!=s->base.material)return -1;return Level_getData(l,x,y,z);}
I32 LiquidTileDynamic_getTickDelay(LiquidTileDynamic *s){return LiquidTile_getTickDelay(&s->base);}
U0 LiquidTileDynamic__trySpreadFire(LiquidTileDynamic *s,Level *l,I32 x,I32 y,I32 z,Random *rng){LiquidTile_trySpreadFire(&s->base,x,y,z,rng);}
U0 LiquidTileDynamic_fizz(LiquidTileDynamic *s,Level *l,I32 x,I32 y,I32 z){MC023_Event(&l->world,MC023_LEVEL_EVENT,x,y,z,s->base.id,0,0);}
U0 LiquidTileDynamic_updateLiquid(LiquidTileDynamic *s,Level *l,I32 x,I32 y,I32 z){if(s->updateLiquid!=NULL)s->updateLiquid(s->context,l,x,y,z);}
Bool LiquidTileDynamic_canSpreadTo(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z){
		I32  v9; 
		v9 = MC027_Material(level,x, y, z);
		return v9 != s->base.material && v9 != s->lavaMaterial && !LiquidTileDynamic_isWaterBlocking(s,level, x, y, z);
	}
I32 LiquidTileDynamic_getHighest(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z,I32 oldhigh){
		I32 v7; 
		I32 depth; 
		v7 = oldhigh;
		depth = LiquidTileDynamic_getDepth(s,level, x, y, z);
		if (depth >= 0) {
			if (depth) {
				if (depth > 7) {
					depth = 0;
				}
			} else {
				++s->field_D8;
			}
			if (oldhigh < 0) {
				return depth;
			} else if (oldhigh >= depth) {
				return depth;
			}
		}
		return v7;
	}
I32 LiquidTileDynamic_getSlopeDistance(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z,I32 a6,I32 a7){
		I32 v11; 
		I32 v12; 
		I32 v13; 
		I32 v14; 
		I32 slope; 
		I32 v17; 
		v17 = y - 1;
		v11 = 0;
		v12 = 1000;
		do {
			switch (v11) {
			case 0:
				if (a7 == 1) {
					goto LABEL_27;
				}
				v13 = x - 1;
				goto LABEL_19;
			case 1:
				if (!a7) {
					goto LABEL_27;
				}
				v13 = x + 1;
				goto LABEL_19;
			case 2:
				if (a7 == 3) {
					goto LABEL_27;
				}
				v14 = z - 1;
				break;
			case 3:
				if (a7 == 2) {
					goto LABEL_27;
				}
				v14 = z + 1;
				break;
			default:
				v13 = x;
				LABEL_19: v14 = z;
				goto LABEL_20;
			}
			v13 = x;
			LABEL_20: if (!LiquidTileDynamic_isWaterBlocking(s,level, v13, y, v14) && (s->base.material != MC027_Material(level,v13, y, v14) || Level_getData(level,v13, y, v14))) {
				if (!LiquidTileDynamic_isWaterBlocking(s,level, v13, v17, v14)) {
					return a6;
				}
				if (a6 <= 3) {
					slope = LiquidTileDynamic_getSlopeDistance(s,level, v13, y, v14, a6 + 1, v11);
					if (v12 >= slope) {
						v12 = slope;
					}
				}
			}
			LABEL_27: ++v11;
		} while (v11 != 4);
		return v12;
	}
Bool* LiquidTileDynamic_getSpread(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z){
		LiquidTileDynamic* v8; 
		I32 v9; 
		I32 v11; 
		I32 v12; 
		I32 v13; 
		I32 i; 
		I32* v15; 
		I32 isWaterBlocking; 
		I32 v19; 
		v8 = s;
		v9 = 0;
		v19 = y - 1;
		do {
			v8->field_E0[v9] = 1000;
			if (v9) {
				if (v9 != 1) {
					if (v9 == 2) {
						v12 = z - 1;
					} else {
						if (v9 != 3) {
							v11 = x;
							goto LABEL_12;
						}
						v12 = z + 1;
					}
					v11 = x;
					goto LABEL_13;
				}
				v11 = x + 1;
			} else {
				v11 = x - 1;
			}
			LABEL_12: v12 = z;
			LABEL_13: if (!LiquidTileDynamic_isWaterBlocking(s,level, v11, y, v12) && (s->base.material != MC027_Material(level,v11, y, v12) || Level_getData(level,v11, y, v12))) {
				isWaterBlocking = LiquidTileDynamic_isWaterBlocking(s,level, v11, v19, v12);
				if (isWaterBlocking) {
					isWaterBlocking = LiquidTileDynamic_getSlopeDistance(s,level, v11, y, v12, 1, v9);
				}
				v8->field_E0[v9] = isWaterBlocking;
			}
			++v9;
		} while (v9 != 4);
		v13 = s->field_E0[1];
		if (v13 >= s->field_E0[0]) {
			v13 = s->field_E0[0];
		}
		if (v13 >= s->field_E0[2]) {
			v13 = s->field_E0[2];
		}
		if (v13 >= s->field_E0[3]) {
			v13 = s->field_E0[3];
		}
		for (i = 0; i != 4; ++i) {
			s->field_DC[i] = s->field_E0[i] == v13;
		}
		return s->field_DC;
	}
U0 LiquidTileDynamic_setStatic(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z){
		I32 v9; 
		v9 = Level_getData(level,x, y, z);
		MC027_SetTileQuiet(level,x, y, z, s->base.id + 1, v9);
		MC023_Event(&level->world,MC023_DIRTY,x,y,z,s->base.id,0,0);
		MC023_Event(&level->world,MC023_CHANGED,x,y,z,s->base.id,0,0);
	}
U0 LiquidTileDynamic_trySpreadTo(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z,I32 a6){
		I32 v10; 
		Tile* v11; 
		I32 v13; 
		if (LiquidTileDynamic_canSpreadTo(s,level, x, y, z)) {
			v10 = Level_getTile(level,x, y, z);
			if (v10 > 0) {
				if (s->base.material == s->lavaMaterial) {
					LiquidTileDynamic_fizz(s,level, x, y, z);
				} else {
					v11 = level->tileObjects[v10];
					if(v11)Tile_spawnResources(v11,level,x,y,z,Level_getData(level,x,y,z),1);
				}
			}
			Level_setTileAndData(level,x, y, z, s->base.id, a6, 3);
		}
	}
U0 LiquidTileDynamic_tick(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z,Random *rng){
		I32 depth; 
		I32 v10; 
		I32 tickDelay; 
		I32 vv; 
		I32 v13; 
		I32 v14; 
		I32 highest; 
		I32 v16; 
		I32 dpth; 
		I32 v18; 
		Bool* Spread; 
		I32 oldid; 
		I32 v22; 
		I32 spreadAdder; 
		depth = LiquidTileDynamic_getDepth(s,level, x, y, z);
		if (s->base.material == s->lavaMaterial) {
			if (s->overworld) {
				v10 = 1;
			} else {
				v10 = 2;
			}
			spreadAdder = v10;
			LiquidTileDynamic__trySpreadFire(s,level, x, y, z, rng);
		} else {
			spreadAdder = 1;
		}
		tickDelay = LiquidTileDynamic_getTickDelay(s);
		if (depth > 0) {
			s->field_D8 = 0;
			vv = LiquidTileDynamic_getHighest(s,level, x - 1, y, z, -100);
			v13 = LiquidTileDynamic_getHighest(s,level, x + 1, y, z, vv);
			v14 = LiquidTileDynamic_getHighest(s,level, x, y, z - 1, v13);
			highest = LiquidTileDynamic_getHighest(s,level, x, y, z + 1, v14);
			if (highest + spreadAdder > 7) {
				v16 = -1;
			} else {
				v16 = (highest + spreadAdder) & ~(highest >> 31);
				if (highest < 0) {
					v16 = -1;
				}
			}
			if (LiquidTileDynamic_getDepth(s,level, x, y + 1, z) >= 0) {
				dpth = LiquidTileDynamic_getDepth(s,level, x, y + 1, z);
				if (dpth > 7) {
					v16 = dpth;
				} else {
					v16 = dpth + 8;
				}
			}
			if (s->field_D8 > 1 && s->base.material == s->waterMaterial && (MC027_Solid(level,x, y - 1, z) || s->base.material == MC027_Material(level,x, y - 1, z) && !Level_getData(level,x, y, z))) {
				v16 = 0;
			}
			if (s->base.material == s->lavaMaterial && depth <= 7) {
				if (v16 > 7) {
					goto LABEL_32;
				}
				if (v16 > depth) {
					if (Random_genrand_int32(rng) & 3) {
						tickDelay *= 4;
					}
					LABEL_30: if (v16 < 0) {
						MC027_SetTile(level,x, y, z, 0, 3);
						LABEL_33: depth = v16;
						goto LABEL_35;
					}
					LABEL_32: MC027_SetMeta(level,x, y, z, v16, 2);
					Level_addToTickNextTick(level,x, y, z, s->base.id, tickDelay);
					MC027_Neighbors(level,x, y, z, s->base.id);
					goto LABEL_33;
				}
			}
			if (v16 != depth) {
				goto LABEL_30;
			}
		}
		LiquidTileDynamic_setStatic(s,level, x, y, z);
		LABEL_35: if (LiquidTileDynamic_canSpreadTo(s,level, x, y - 1, z)) {
			if (s->base.material == s->lavaMaterial && s->waterMaterial == MC027_Material(level,x, y - 1, z)) {
				MC027_SetTile(level,x, y - 1, z, s->rock, 3);
				LiquidTileDynamic_fizz(s,level, x, y - 1, z);
			} else {
				if (depth > 7) {
					v22 = depth;
				}
				oldid = s->base.id;
				if (depth <= 7) {
					v22 = depth + 8;
				}
				Level_setTileAndData(level,x, y - 1, z, s->base.id, v22, 3);
			}
		} else if (depth >= 0 && (!depth || LiquidTileDynamic_isWaterBlocking(s,level, x, y - 1, z))) {
			Spread = LiquidTileDynamic_getSpread(s,level, x, y, z);
			if (depth > 7) {
				v18 = 1;
			} else {
				v18 = depth + spreadAdder;
				if (v18 > 7) {
					return;
				}
			}
			if (Spread[0]) {
				LiquidTileDynamic_trySpreadTo(s,level, x - 1, y, z, v18);
			}
			if (Spread[1]) {
				LiquidTileDynamic_trySpreadTo(s,level, x + 1, y, z, v18);
			}
			if (Spread[2]) {
				LiquidTileDynamic_trySpreadTo(s,level, x, y, z - 1, v18);
			}
			if (Spread[3]) {
				LiquidTileDynamic_trySpreadTo(s,level, x, y, z + 1, v18);
			}
		}
	}
U0 LiquidTileDynamic_onPlace(LiquidTileDynamic *s,Level *level,I32 x,I32 y,I32 z){
		LiquidTileDynamic_updateLiquid(s,level, x, y, z);
		I32 id = Level_getTile(level,x, y, z);
		if (id == s->base.id) {
			Level_addToTickNextTick(level,x, y, z, id, LiquidTileDynamic_getTickDelay(s));
		}
	}
