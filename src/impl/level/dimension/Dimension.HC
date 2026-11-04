U0 Dimension_Init(Dimension *s,MCWorldHost012 *h){memset(s,0,sizeof(Dimension));s->host=h;}
Dimension *Dimension_getNew(MCWorldHost012 *h,I32 id){Dimension *s;if(id!=0 && id!=10)return NULL;s=MC_Alloc(sizeof(Dimension));Dimension_Init(s,h);s->normalDayCycle=id==10;return s;}
U0 Dimension_Destroy(Dimension *s){if(s->biome)s->host->destroyBiome(s->host->host,s->biome);s->biome=NULL;}
U0 Dimension_initWorld(Dimension *s,U0 *level){s->level=level;Dimension_initBiome(s);Dimension_updateLightRamp(s);}
U0 Dimension_initBiome(Dimension *s){s->biome=s->host->createBiome(s->host->host);}
U0 *Dimension_createRandomLevelSource(Dimension *s){MCWorldHost012 *h=s->host;Bool spawn=FALSE;I32 seed=h->seed(h->host),ver=h->generatorVersion(h->host);if(!h->isClient(h->host))spawn=h->spawnMobs(h->host);return h->createRandomSource(h->host,seed,ver,spawn);}
Bool Dimension_isValidSpawn(Dimension *s,I32 x,I32 z){I32 tile=s->host->topTile(s->host->host,x,z);if(tile==s->host->invisibleBedrock)return FALSE;return s->host->tileSolid(s->host->host,tile);}
Bool Dimension_isNaturalDimension(Dimension *s){return FALSE;}I32 Dimension_getMoonPhase(Dimension *s,I64 time){return (time/19200)%8;}
F32 Dimension_getTimeOfDay(Dimension *s,I64 t,F32 partial){if(s->normalDayCycle)return NormalDayCycleDimension_getTimeOfDay(t,partial);return 1.0;}
U0 Dimension_getSunriseColor(Dimension *s,F32 a,F32 b,Color4 *out){F32 v4=Mth_cos(a*3.1416+a*3.1416),v5,v6,v7,v8;if(v4>=-0.4 && v4<=0.4){v5=((v4+0.0)/0.4)*0.5+0.5;v6=1.0-(1.0-Mth_sin(v5*3.1416))*0.99;v7=v5*0.3+0.7;v8=v5*v5;Color4_Init(out,v7,v8*0.7+0.2,v8*0.0+0.2,v6*v6);}else Color4_Init(out,0,0,0,0);}
U0 Dimension_getFogColor(Dimension *s,F32 a,F32 b,Color4 *out){F32 v4=Mth_cos(a*3.1416+a*3.1416),v5=v4+v4+0.5,v6;if(v5>1)v5=1;else if(v5<=0)v5=0;v6=v5*0.94+0.06;Color4_Init(out,v6*0.50196,v6*0.8549,v6,1);}
F32 Dimension_getCloudHeight(Dimension *s){return 128;}Bool Dimension_mayRespawn(Dimension *s){return TRUE;}U0 Dimension_updateLightRamp(Dimension *s){I32 i;F32 v;for(i=0;i<16;i++){v=i*0.0625;s->lightRamp[i]=(1.0-(1.0-v))/((1.0-v)*3.0+1.0)*0.95+0.15;}}
