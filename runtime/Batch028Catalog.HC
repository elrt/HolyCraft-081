#include "Batch028Atlas.HH"
#include "Batch028ItemsAtlas.HH"
U0 MC028_UV(TextureUVCoordinateSet *out,I32 texture,I32 variant){if(variant<0 || variant>=TerrainCount028[texture])variant=0;F32 *u=TerrainUV028+(TerrainFirst028[texture]+variant)*6;TextureUVCoordinateSet_Init(out,u[0],u[1],u[2],u[3],u[4],u[5]);}
U0 MC028_Register(MCCatalog028 *c,I32 id,I32 texture,Material *material,I32 materialId,Bool solid,Bool cube,F32 hardness,F32 emission,I32 opacity,I32 kind,U8 *label){
 Tile *tile=&c->tiles[id];Tile_Init(tile,&c->registry,id,materialId,solid,cube);Tile_bindMaterial(tile,material);Tile_setDestroyTime(tile,hardness);Tile_setLightEmission(tile,emission);Tile_setLightBlock(tile,opacity);
 Item_Init(&c->items[id],&c->registry,id-256);Item_setDescriptionId(&c->items[id],label);c->itemExists[id]=TRUE;c->labels[id]=label;c->texIndex[id]=texture;
 c->placeable[id]=solid || kind==1 || kind==2;c->registry.tiles[id].renderShape=kind;c->registry.tiles[id].plant=kind==1;
 if(id==44 || id==158)Tile_setShape(tile,0,0,0,1,0.5,1);
 if(id==78)Tile_setShape(tile,0,0,0,1,0.125,1);
 if(id==171)Tile_setShape(tile,0,0,0,1,0.0625,1);
 if(id==60)Tile_setShape(tile,0,0,0,1,0.9375,1);
 if(id==26)Tile_setShape(tile,0,0,0,1,0.5625,1);
 if(id==54)Tile_setShape(tile,0.0625,0,0.0625,0.9375,0.875,0.9375);
 if(id==81)Tile_setShape(tile,0.0625,0,0.0625,0.9375,1,0.9375);
 if(id==85 || id==139)Tile_setShape(tile,0.375,0,0.375,0.625,1.5,0.625);
 if(id==20 || id==79)c->registry.tiles[id].opacity=0;
 TextureUVCoordinateSet uv[6];I32 i;for(i=0;i<6;i++)MC028_UV(&uv[i],texture,0);MC027_RenderView(&c->views[id],tile,kind,uv);c->views[id].liquid=id>=8 && id<=11;
 if(id==2){c->views[id].grass=TRUE;c->views[id].color=0x91BD59;}
 if(id==18)c->views[id].color=0x48B518;
 if(id==8 || id==9)c->views[id].color=0x3F76E4;
 if(id==79)c->registry.tiles[id].slipperiness=0.98;
 if(id==95 || id==255)c->placeable[id]=FALSE;
}
U0 MC028_RegisterItem(MCCatalog028 *c,I32 id,I32 tex,I32 variant,U8 *label,I32 stack,I32 damage,F32 speed){Item *item=&c->items[id];Item_Init(item,&c->registry,id-256);Item_setDescriptionId(item,label);Item_setMaxStackSize(item,stack);Item_setMaxDamage(item,damage);item->def.destroySpeed=speed;c->baseSpeed[id]=speed;c->itemExists[id]=TRUE;c->labels[id]=label;if(variant>=ItemCount028[tex])variant=0;F32 *u=ItemUV028+(ItemFirst028[tex]+variant)*6;TextureUVCoordinateSet_Init(&c->itemUV[id],u[0],u[1],u[2],u[3],u[4],u[5]);}
#include "Batch028CatalogData.HC"
#include "Batch028ItemData.HC"
U0 MC028_View(MCCatalog028 *c,I32 id,I32 meta){
 MCRenderTile027 *v=&c->views[id];I32 texture=c->texIndex[id],i,variant=0;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,0);
 if(id==2){MC028_UV(&v->uv[0],c->texIndex[3],0);for(i=2;i<6;i++)MC028_UV(&v->uv[i],texture,1);}
 if(id==5 || id==157 || id==158 || id==35 || id==171 || id==98 || id==6){variant=meta;if(id==157 || id==158)variant=meta&7;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,variant);}
 if(id==247){variant=meta;if(variant<0 || variant>2)variant=0;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,variant);}
 if(id==17){variant=(meta&3)*2;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,variant);MC028_UV(&v->uv[0],texture,variant+1);MC028_UV(&v->uv[1],texture,variant+1);}
 if(id==18){variant=(meta&3)*2;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,variant);}
 if(id==24 || id==128){I32 sm=meta;if(id==128 || sm<0 || sm>2)sm=0;for(i=2;i<6;i++)MC028_UV(&v->uv[i],texture,sm);MC028_UV(&v->uv[1],texture,3);if(sm==0)MC028_UV(&v->uv[0],texture,4);else MC028_UV(&v->uv[0],texture,3);}
 if(id==155 || id==156){I32 qm=meta;if(id==156)qm=0;I32 qs=2,qt=1,qb=0;if(qm==1){qs=5;qt=6;qb=6;}if(qm==2){qs=3;qt=4;qb=4;}for(i=2;i<6;i++)MC028_UV(&v->uv[i],texture,qs);MC028_UV(&v->uv[1],texture,qt);MC028_UV(&v->uv[0],texture,qb);}
 if(id==245){MC028_UV(&v->uv[1],texture,2);MC028_UV(&v->uv[0],texture,3);MC028_UV(&v->uv[2],texture,0);MC028_UV(&v->uv[3],texture,0);MC028_UV(&v->uv[4],texture,1);MC028_UV(&v->uv[5],texture,1);}
 if(id==81){MC028_UV(&v->uv[0],texture,2);for(i=2;i<6;i++)MC028_UV(&v->uv[i],texture,1);}
 if(id==134 || id==135 || id==136){for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,id-133);}
 if(id==46){MC028_UV(&v->uv[0],texture,2);MC028_UV(&v->uv[1],texture,1);}
 if(id==47){MC028_UV(&v->uv[0],c->texIndex[5],0);MC028_UV(&v->uv[1],c->texIndex[5],0);}
 if(id==54){MC028_UV(&v->uv[0],texture,2);MC028_UV(&v->uv[1],texture,2);MC028_UV(&v->uv[2],texture,1);}
 if(id==58){for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,1);MC028_UV(&v->uv[1],texture,0);MC028_UV(&v->uv[0],c->texIndex[5],0);MC028_UV(&v->uv[3],texture,2);}
 if(id==61 || id==62){for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,0);MC028_UV(&v->uv[0],texture,3);MC028_UV(&v->uv[1],texture,3);I32 side=meta;if(side<2 || side>5)side=2;variant=1;if(id==62)variant=2;MC028_UV(&v->uv[side],texture,variant);}
 if(id==170){MC028_UV(&v->uv[0],texture,1);MC028_UV(&v->uv[1],texture,1);}
 if(id==103){MC028_UV(&v->uv[0],texture,1);MC028_UV(&v->uv[1],texture,1);}
 if(id==59){for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,meta&7);}
 if(id==141 || id==142 || id==244){variant=(meta&7)/2;for(i=0;i<6;i++)MC028_UV(&v->uv[i],texture,variant);}
 if(id==86 || id==91){MC028_UV(&v->uv[0],texture,0);MC028_UV(&v->uv[1],texture,0);for(i=2;i<6;i++)MC028_UV(&v->uv[i],texture,1);I32 side=meta&3;I32 fronts[4]={3,4,2,5};variant=2;if(id==91)variant=3;MC028_UV(&v->uv[fronts[side]],texture,variant);}
 if(id==8 || id==9 || id==10 || id==11){v->maxY=0.9;if(meta&8)v->maxY=1;else if(meta>0)v->maxY=1-(meta+1)/9.0;}
}
U0 MC028_CatalogInit(MCCatalog028 *c){memset(c,0,sizeof(MCCatalog028));Material_initMaterials();MC028_CatalogData(c);MC028_ItemData(c);
 I32 ids[64]={1,2,3,4,5,7,12,13,14,15,16,17,18,19,20,21,22,24,35,41,42,43,44,45,46,47,48,49,50,54,56,57,58,60,61,78,79,80,81,82,85,86,87,89,91,98,103,112,155,157,158,170,171,173,245,246,247,6,37,38,39,40,31,83};I32 i;for(i=0;i<64;i++)if(c->placeable[ids[i]])c->palette[c->paletteN++]=ids[i];
 I32 extras[8]={325,325,325,259,270,274,278,260},extraMeta[8]={0,8,10,0,0,0,0,0};for(i=0;i<8;i++)if(c->itemExists[extras[i]]){c->palette[c->paletteN]=extras[i];c->paletteMeta[c->paletteN++]=extraMeta[i];}for(i=0;i<4;i++){F32 *u=ItemUV028+(ItemFirst028[22]+i)*6;TextureUVCoordinateSet_Init(&c->bucketUV[i],u[0],u[1],u[2],u[3],u[4],u[5]);}c->items[325].def.maxStack=16;c->items[325].def.stackedByData=TRUE;c->labels[1]="Stone";c->labels[2]="Grass";c->labels[3]="Dirt";c->labels[4]="Cobblestone";c->labels[5]="Oak planks";c->labels[17]="Oak log";c->labels[18]="Leaves";c->labels[20]="Glass";c->labels[50]="Torch";c->labels[58]="Crafting table";
 memset(&MC_featureTiles,0,sizeof(MCFeatureRegistry));MC_featureTiles.rock=1;MC_featureTiles.grass=2;MC_featureTiles.dirt=3;MC_featureTiles.treeTrunk=17;MC_featureTiles.leaves=18;MC_featureTiles.cactus=81;MC_featureTiles.reeds=83;MC_featureTiles.sand=12;MC_featureTiles.clay=82;MC_featureTiles.waterMaterial=3;for(i=0;i<256;i++)MC_featureTiles.solid[i]=c->registry.tiles[i].cube;
}
U0 MC028_CatalogDestroy(MCCatalog028 *c){I32 i;for(i=1;i<256;i++)if(c->registry.tiles[i].registered)Tile_Destroy(&c->tiles[i]);for(i=0;i<512;i++)if(c->itemExists[i])Item_Destroy(&c->items[i]);Material_teardownMaterials();}

U8 *MC028_Label(MCCatalog028 *c,I32 id,I32 meta){if(id==325){if(meta==8)return "Water bucket";if(meta==10)return "Lava bucket";return "Bucket";}if(id>0 && id<512 && c->labels[id]!=NULL)return c->labels[id];return "Unknown item";}
