// Source burn odds/tick/placement logic. Particle/sound animation and native TNT actor are not implemented here.
class MCFireIDs027 {I32 wood[11],trunk,leaves,bookshelf,tnt,tallgrass,cloth,carpet,coalBlock,hay,sponge,netherrack;};
class FireTile {Tile base;I32 flammability[256],field_480[256];I32 tnt,netherrack;};
U0 FireTile_setFlammable(FireTile *s,I32 id,I32 encouragement,I32 burn){if(id>0 && id<256){s->flammability[id]=encouragement;s->field_480[id]=burn;}}
Bool FireTile_Init(FireTile *s,MCRegistry023 *r,I32 id,MCFireIDs027 *ids){memset(s,0,sizeof(FireTile));Bool ok=Tile_Init(&s->base,r,id,6,FALSE,FALSE);s->base.ticking=TRUE;s->base.replaceable=TRUE;r->tiles[id].renderShape=3;if(!ids)return ok;I32 i;for(i=0;i<11;i++)FireTile_setFlammable(s,ids->wood[i],5,20);FireTile_setFlammable(s,ids->trunk,5,5);FireTile_setFlammable(s,ids->leaves,30,60);FireTile_setFlammable(s,ids->bookshelf,30,20);FireTile_setFlammable(s,ids->tnt,15,100);FireTile_setFlammable(s,ids->tallgrass,60,100);FireTile_setFlammable(s,ids->cloth,30,60);FireTile_setFlammable(s,ids->carpet,30,60);FireTile_setFlammable(s,ids->coalBlock,5,5);FireTile_setFlammable(s,ids->hay,60,20);FireTile_setFlammable(s,ids->sponge,30,60);s->tnt=ids->tnt;s->netherrack=ids->netherrack;return ok;}
Bool FireTile_canBurn(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		return s->flammability[Level_getTile(level,x, y, z)] > 0;
	}
I32 FireTile_getFlammability(FireTile *s,Level *level,I32 x,I32 y,I32 z,I32 mx){
		I32 res = s->flammability[Level_getTile(level,x, y, z)];
		if (res < mx) return mx;

		return res;
	}
I32 FireTile_getFireOdds(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		if (MC027_Empty(level,x, y, z)) {
			I32 fl1 = FireTile_getFlammability(s,level, x + 1, y, z, 0);
			I32 fl2 = FireTile_getFlammability(s,level, x - 1, y, z, fl1);
			I32 fl3 = FireTile_getFlammability(s,level, x, y - 1, z, fl2);
			I32 fl4 = FireTile_getFlammability(s,level, x, y + 1, z, fl3);
			I32 fl5 = FireTile_getFlammability(s,level, x, y, z - 1, fl4);
			return FireTile_getFlammability(s,level, x, y, z + 1, fl5);
		}
		return 0;
	}
Bool FireTile_isValidFireLocation(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		return FireTile_canBurn(s,level, x + 1, y, z) || FireTile_canBurn(s,level, x - 1, y, z) || FireTile_canBurn(s,level, x, y - 1, z) || FireTile_canBurn(s,level, x, y + 1, z) || FireTile_canBurn(s,level, x, y, z - 1) || FireTile_canBurn(s,level, x, y, z + 1);
	}
Bool FireTile_mayPlace(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		return MC027_Solid(level,x, y - 1, z) || FireTile_isValidFireLocation(s,level, x, y, z);
	}
U0 FireTile_checkBurn(FireTile *s,Level *level,I32 x,I32 y,I32 z,I32 a6,Random *random){if(a6<=0)return;
		I32 v11; 
		I32 v12; 
		I32 blockID; 
		I32 v14; 
		I32 v15; 
		v11 = s->field_480[Level_getTile(level,x, y, z)];
		if ((((Random_genrand_int32(random) % a6)))(I32) < v11) {
			v12 = Level_getTile(level,x, y, z);
			blockID = s->tnt;
			v14 = v12;
			if ((Random_genrand_int32(random) & 1) != 0) {
				v15 = 0;
			} else {
				v15 = s->base.id;
			}
			MC027_SetTile(level,x, y, z, v15, 3);
			if (v14 == blockID) {
				MC023_Event(&level->world,MC023_EXPLODE,x,y,z,s->tnt,1,0);
			}
		}
	}
U0 FireTile_tick(FireTile *s,Level *level,I32 x,I32 y,I32 z,Random *random){
		I32 v10; 
		I32 v11; 
		I32 v12; 
		I32 v13; 
		U32 v14; 
		I32 v15; 
		I32 v16; 
		I32 FireOdds; 
		I32 i; 
		I32 v19; 
		I32 v20; 
		I32 v21; 
		I32 v22; 
		I32 v23; 
		I32 v24; 
		I32 v25; 
		I32 v26; 
		I32 blockID; 
		I32 v29; 
		v26 = y - 1;
		v10 = Level_getTile(level,x, y - 1, z);
		blockID = s->netherrack;
		v11 = v10;
		if (!FireTile_mayPlace(s,level, x, y, z)) {
			MC027_SetTile(level,x, y, z, 0, 3);
		}
		v25 = Level_getData(level,x, y, z);
		if (v25 <= 14) {
			v12 = Random_genrand_int32(random) % 3;
			MC027_SetMeta(level,x, y, z, v25 + (v12 >> 1), 4);
		}
		Level_addToTickNextTick(level,x, y, z, s->base.id, (Random_genrand_int32(random) % 0xA) + 30);
		if (v11 != blockID) {
			if (!FireTile_isValidFireLocation(s,level, x, y, z)) {
				if (MC027_Solid(level,x, v26, z) && v25 <= 3) {
					return;
				}
				STOP_BURNING: MC027_SetTile(level,x, y, z, 0, 3);
				return;
			}
			if (!FireTile_canBurn(s,level, x, v26, z) && v25 == 15 && (Random_genrand_int32(random) & 3) == 0) {
				goto STOP_BURNING;
			}
		}
		if ((v25 & 1) == 0) {
			if (v25 <= 2) {
				return;
			}
			v15 = x - 1;
			FireTile_checkBurn(s,level, x + 1, y, z, 300, random);
			FireTile_checkBurn(s,level, x - 1, y, z, 300, random);
			FireTile_checkBurn(s,level, x, v26, z, 250, random);
			v29 = y + 1;
			FireTile_checkBurn(s,level, x, y + 1, z, 250, random);
			FireTile_checkBurn(s,level, x, y, z - 1, 300, random);
			FireTile_checkBurn(s,level, x, y, z + 1, 300, random);
			while (v15 <= x + 1) {
				for (i = z - 1; i <= z + 1; ++i) {
					v20 = v26;
					v21 = 0;
					while (v20 <= y + 4) {
						if (v15 != x || v20 != y || i != z) {
							v16 = y + 1;
							v22 = i;
							I32 t;
							if (v20 <= v29) {
								v16 = 100;
							} else {
								t = (v21 - 100);
							}
							if (v20 <= v29) {
								t = v16;
							}
							FireOdds = FireTile_getFireOdds(s,level, v15, v20, i);
							i = v22;
							if (FireOdds > 0) {
								v24 = FireOdds;
								v19 = Random_genrand_int32(random) % ((t))(U32);
								i = v22;
								if (v19 <= v24) {
									MC027_SetTile(level,v15, v20, v22, s->base.id, 3);
									i = v22;
								}
							}
						}
						++v20;
						v21 += 100;
					}
				}
				++v15;
			}
		}
		if (v25 == 15) {
			FireTile_checkBurn(s,level, x + 1, y, z, 1, random);
			FireTile_checkBurn(s,level, x - 1, y, z, 1, random);
			FireTile_checkBurn(s,level, x, v26, z, 1, random);
			FireTile_checkBurn(s,level, x, y + 1, z, 1, random);
			FireTile_checkBurn(s,level, x, y, z - 1, 1, random);
			FireTile_checkBurn(s,level, x, y, z + 1, 1, random);
		}
	}
U0 FireTile_neighborChanged(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		if (MC027_Solid(level,x, y - 1, z) && FireTile_isValidFireLocation(s,level, x, y, z)) {
			MC027_SetTile(level,x, y, z, 0, 3);
		}
	}
U0 FireTile_onPlace(FireTile *s,Level *level,I32 x,I32 y,I32 z){
		if (MC027_Solid(level,x, y - 1, z) || FireTile_isValidFireLocation(s,level, x, y, z)) {
			Level_addToTickNextTick(level,x, y, z, s->base.id, 30);
		} else {
			MC027_SetTile(level,x, y, z, 0, 3);
		}
	}
