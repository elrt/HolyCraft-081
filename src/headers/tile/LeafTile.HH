// Source 4-step trunk BFS; explicit IDs/UVs. Uninitialized border/source unloaded-chunk UB is repaired.
class LeafTile {Tile base;I32 *treeBlocksNearby;I32 trunk,sapling,apple,shears;Bool fancy;TextureUVCoordinateSet opaque[4],leaf[4],carried[4];};
Bool LeafTile_Init(LeafTile *s,MCRegistry023 *r,I32 id,I32 trunk,I32 sapling,I32 apple,I32 shears){memset(s,0,sizeof(LeafTile));s->trunk=trunk;s->sapling=sapling;s->apple=apple;s->shears=shears;Bool ok=Tile_Init(&s->base,r,id,5,TRUE,TRUE);r->tiles[id].renderShape=0;return ok;}
U0 LeafTile_Destroy(LeafTile *s){free(s->treeBlocksNearby);s->treeBlocksNearby=NULL;Tile_Destroy(&s->base);}
TextureUVCoordinateSet *LeafTile_getTexture(LeafTile *s,I32 face,I32 meta){if(s->fancy)return &s->leaf[meta&3];return &s->opaque[meta&3];}
TextureUVCoordinateSet *LeafTile_getCarriedTexture(LeafTile *s,I32 face,I32 meta){return &s->carried[meta&3];}
U0 LeafTile_onGraphicsModeChanged(LeafTile *s,Bool fancy){s->fancy=fancy;}
I32 LeafTile_getColor(LeafTile *s,Level *level,I32 x,I32 y,I32 z){I32 data=Level_getData(level,x,y,z)&3;if(data==1)return 0x619961;if(data==2)return 0x80A755;return 0x48B518;}
U0 LeafTile_spawnResources(LeafTile *s,Level *level,I32 x,I32 y,I32 z,I32 meta,F32 chance){if(level->world.isClient)return;if(Random_genrand_int32(&level->world.random)%20==0)MC027_DropAt(level,x,y,z,s->sapling,1,meta&3);if((meta&3)==0 && Random_genrand_int32(&level->world.random)%200==0)MC027_DropAt(level,x,y,z,s->apple,1,0);}
U0 LeafTile_playerDestroy(LeafTile *s,Level *level,Player *player,I32 x,I32 y,I32 z,I32 meta){ItemInstance *held=Inventory_getSelected(&player->inventory);if(!level->world.isClient && held && ItemInstance_getId(held)==s->shears && s->shears)MC027_DropAt(level,x,y,z,s->base.id,1,meta&3);else LeafTile_spawnResources(s,level,x,y,z,meta,1);}
U0 LeafTile_tick(LeafTile *s,Level *level,I32 x,I32 y,I32 z,Random *random){
		
		I32* treeBlocksNearby; 
		I32* v15; 
		I32* v16; 
		I32* v17; 
		I32* v18; 
		I32* v19; 
		I32 v20; 
		I32 v21; 
		I32 v22; 
		I32 v23; 
		I32 j; 
		I32 i; 
		I32 v27; 
		I32 yy; 
		I32 v29; 
		I32 v30; 
		I32 data; 
		if (!level->world.isClient) {
			I32 data = Level_getData(level,x, y, z);
			if ((data & 0xC) == 4) {
				
				I32 yzo = 32 * 32;
				I32 co = 32 / 2;
				if (!s->treeBlocksNearby) {
					s->treeBlocksNearby = MC_Alloc(32768*sizeof(I32));
					
					
				}
				if (!Level_hasChunksAt(level,x-5,y-5,z-5,x+5,y+5,z+5))return;
I32 init;for(init=0;init<32768;init++)s->treeBlocksNearby[init]=-1;
if (TRUE) {
					for (I32 xx = -4; xx <= 4; ++xx) {
						for (I32 yy = -4; yy <= 4; ++yy) {
							for (I32 zz = -4; zz <= 4; ++zz) {
								I32 tile = Level_getTile(level,x + xx, y + yy, z + zz);
								if (tile == s->trunk) s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + zz + co] = 0;
								else if (tile == s->base.id) s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + zz + co] = -2;
								else s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + zz + co] = -1;
							}
						}
					}
					for (I32 type = 1; type <= 4; ++type) {
						for (I32 xx = -4; xx <= 4; ++xx) {
							for (I32 yy = -4; yy <= 4; ++yy) {
								for (I32 zz = -4; zz <= 4; ++zz) {
									if (s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + zz + co] == type - 1) {
										if (s->treeBlocksNearby[(((xx + co) - 1) * yzo) + ((yy + co) * 32) + zz + co] == -2) {
											s->treeBlocksNearby[(((xx + co) - 1) * yzo) + ((yy + co) * 32) + zz + co] = type;
										}
										if (s->treeBlocksNearby[(((xx + co) + 1) * yzo) + ((yy + co) * 32) + zz + co] == -2) {
											s->treeBlocksNearby[(((xx + co) + 1) * yzo) + ((yy + co) * 32) + zz + co] = type;
										}
										if (s->treeBlocksNearby[((xx + co) * yzo) + (((yy + co) - 1) * 32) + zz + co] == -2) {
											s->treeBlocksNearby[((xx + co) * yzo) + (((yy + co) - 1) * 32) + zz + co] = type;
										}
										if (s->treeBlocksNearby[((xx + co) * yzo) + (((yy + co) + 1) * 32) + zz + co] == -2) {
											s->treeBlocksNearby[((xx + co) * yzo) + (((yy + co) + 1) * 32) + zz + co] = type;
										}
										if (s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + ((zz + co) - 1)] == -2) {
											s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + ((zz + co) - 1)] = type;
										}
										if (s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + ((zz + co) + 1)] == -2) {
											s->treeBlocksNearby[((xx + co) * yzo) + ((yy + co) * 32) + ((zz + co) + 1)] = type;
										}
									}
								}
							}
						}
					}
				}
				if (s->treeBlocksNearby[(co * yzo) + (co * 32) + co] < 0) {
					
					v27 = Level_getData(level,x, y, z);
					LeafTile_spawnResources(s,level, x, y, z, v27 & 3, 0.0);
					MC027_SetTile(level,x, y, z, 0, 3);
				} else {
					MC027_SetMetaQuiet(level,x, y, z, data & 0xFFFFFFFB);
				}
			}
		}
	}
U0 LeafTile_onRemove(LeafTile *s,Level *level,I32 x,I32 y,I32 z){
		I32 v8; 
		I32 meta; 
		I32 zz; 
		I32 yy; 
		I32 xx; 
		I32 v13; 
		if (!level->world.isClient && Level_hasChunksAt(level,x - 2, y - 2, z - 2, x + 2, y + 2, z + 2)) {
			for (xx = -1; xx != 2; ++xx) {
				yy = -1;
				v13 = xx + x;
				do {
					for (zz = -1; zz != 2; ++zz) {
						v8 = zz + z;
						if (Level_getTile(level,v13, yy + y, zz + z) == s->base.id) {
							meta = Level_getData(level,v13, yy + y, v8);
							MC027_SetMetaQuiet(level,v13, yy + y, v8, meta | 4);
						}
					}
					++yy;
				} while (yy != 2);
			}
		}
	}
