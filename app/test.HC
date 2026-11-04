// Batch030 headless self-test (no window): batch029 checks + sound checks. Run from the package root
// (assets/029/en_US.lang and assets/030/sound/*.pcm are read relative to it).
#include "../mcpe.HC"
I32 g_t29_fail=0,g_t29_n=0;
U0 T29_Check(Bool c,U8 *what){g_t29_n++;if(!c){g_t29_fail++;printf("T029 FAIL %s\n",what);}}
class T29Node{T29Node *next;I32 v;};
// hcc 0.0.17 workaround pattern used throughout batch029: explicit !=NULL for pointer operands after the 2nd.
Bool T29_Chain(T29Node *p,I32 x){return p!=NULL && x>0 && p->next!=NULL;}
I32 main(I32 argc,U8 **argv){U8 out[256];I32 i;
 T29_Check(G29_CREATIVE_N==182,"creative list has 182 entries");
 T29_Check(!MC029_ValidItem(NULL),"ValidItem(NULL)");
 ItemInstance z;memset(&z,0,sizeof(ItemInstance));z.count=1;
 T29_Check(!MC029_ValidItem(&z),"ValidItem(item without class)");
 T29_Check(!ItemInstance_sameItemAndAux(NULL,&z),"sameItemAndAux(NULL,x)");
 T29_Check(!ItemInstance_sameItemAndAux(&z,NULL),"sameItemAndAux(x,NULL)");
 T29_Check(!ItemInstance_sameItemAndAux(&z,&z),"sameItemAndAux(classless)");
 T29Node a,b;a.next=&b;b.next=NULL;
 T29_Check(!T29_Chain(NULL,1),"chain NULL guard");T29_Check(T29_Chain(&a,1),"chain true");T29_Check(!T29_Chain(&b,1),"chain NULL tail");T29_Check(!T29_Chain(&a,0),"chain int guard");
 T29_Check(MC029_SeedFrom("12345")==12345,"seed number");
 T29_Check(MC029_SeedFrom("  77\t")==77,"seed trimmed");
 T29_Check(MC029_SeedFrom("-5")==-5,"seed negative");
 T29_Check(MC029_SeedFrom("abc")==96354,"seed String.hashCode abc");
 T29_Check(MC029_SeedFrom("hello world")==1794106052,"seed String.hashCode hello world");
 T29_Check(MC029_SeedFrom("pocket edition")==-1933889228,"seed String.hashCode pocket edition");
 U8 u[4];u[0]=0xD0;u[1]=0x96;u[2]=0;i=0;T29_Check(MC029_Utf8(u,&i)==0x416 && i==2,"utf8 two-byte");
 u[0]=0xE2;u[1]=0x82;u[2]=0;i=0;T29_Check(MC029_Utf8(u,&i)==0x3F && i==1,"utf8 truncated three-byte");
 MC029_Get("t029.missing",out);T29_Check(!strcmp(out,"t029.missing<"),"I18n missing-key marker");
 if(MC029_LangLoad("assets/029/en_US.lang")){
  MC029_Get("tile.stone.name",out);T29_Check(!strcmp(out,"Stone"),"lang tile.stone.name");
  MC029_Get("gui.done",out);T29_Check(!strcmp(out,"Done"),"lang gui.done");
  MC029_Get("item.bucket.name",out);T29_Check(!strcmp(out,"Bucket"),"lang item.bucket.name");
 } else T29_Check(FALSE,"assets/029/en_US.lang loads (run from the package root)");
 // ---- batch030: SoundEngine::init / SoundRepository::get / _getVolumeMult / Tile::SoundType ----
 MC030_SoundInit(FALSE);
 T29_Check(g30_sndN==105,"SoundEngine::init registers 105 sound descs");T29_Check(g30_sndMissing==0,"all 105 PCM files load (assets/030/sound)");
 T29_Check(MC030_Get("t030.none")==-1,"unknown sound name");
 I32 seen[128],ns=0,k,j;for(k=0;k<400;k++){I32 id=MC030_Get("step.grass");Bool dup=FALSE;for(j=0;j<ns;j++)if(seen[j]==id)dup=TRUE;if(!dup && ns<128)seen[ns++]=id;}
 T29_Check(ns==4 && seen[0]>=0,"step.grass picks among its 4 variants");
 I32 c0=MC030_Get("random.click");Bool same=TRUE;for(k=0;k<50;k++)if(MC030_Get("random.click")!=c0)same=FALSE;T29_Check(c0>=0 && same,"random.click has one variant");
 ns=0;for(k=0;k<400;k++){I32 id=MC030_Get("mob.zombiepig.zpigangry");Bool dup=FALSE;for(j=0;j<ns;j++)if(seen[j]==id)dup=TRUE;if(!dup && ns<128)seen[ns++]=id;}T29_Check(ns==4,"zpigangry has 4 variants");
 g30_lx=0;g30_ly=64;g30_lz=0;
 T29_Check(MC030_VolumeMult(0,64,0)==1.0,"volume mult clamps to 1 at the listener");
 T29_Check(fabs(MC030_VolumeMult(10,64,0)-0.6)<0.0001,"volume mult 1.1-d/20 at d=10");
 T29_Check(fabs(MC030_VolumeMult(0,64+30,0)+0.4)<0.0001,"volume mult at d=30");
 T29_Check(MC030_VolumeMult(100,64,0)==-1.0,"volume mult clamps to -1");
 g30_volume=1.0;g30_log=FALSE;I32 before=g30_requests;MC030_Play("step.stone",0,64,0,1.0,1.0);MC030_PlayUI("random.click",1.0,1.0);MC030_Play("step.stone",80,64,0,1.0,1.0);
 T29_Check(g30_requests==before+3 && g30_started==0,"requests counted; nothing starts without an audio device");
 MCRegistry023 *tsr=MC_Alloc(sizeof(MCRegistry023));memset(tsr,0,sizeof(MCRegistry023));MC030_TileSounds(tsr);
 T29_Check(!strcmp(tsr->tiles[2].stepSound,"step.grass") && tsr->tiles[2].soundVolume==0.5,"grass: SOUND_GRASS 0.5");
 T29_Check(!strcmp(tsr->tiles[20].breakSound,"random.glass") && !strcmp(tsr->tiles[20].stepSound,"step.stone"),"glass: break random.glass, step step.stone");
 T29_Check(!strcmp(tsr->tiles[12].breakSound,"step.gravel") && !strcmp(tsr->tiles[12].stepSound,"step.sand"),"sand: break step.gravel, step step.sand");
 T29_Check(!strcmp(tsr->tiles[35].stepSound,"step.cloth") && !strcmp(tsr->tiles[17].stepSound,"step.wood"),"wool cloth, log wood");
 T29_Check(tsr->tiles[42].soundPitch==1.5 && !strcmp(tsr->tiles[1].breakSound,"step.stone"),"iron block metal pitch 1.5, stone");
 I32 badTiles=0;for(k=1;k<256;k++){MCTileDef023 *td=&tsr->tiles[k];if(td->stepSound!=NULL){if(MC030_Get(td->stepSound)<0)badTiles++;}if(td->breakSound!=NULL){if(MC030_Get(td->breakSound)<0)badTiles++;}}
 T29_Check(badTiles==0,"every tile step/break sound name is registered");
 // ---- batch034: hostile kinds, rail exit/connection tables, sign text, command names ----
 T29_Check(MC34_KindOk(32) && MC34_KindOk(36) && MC34_KindOk(10) && !MC34_KindOk(14) && !MC34_KindOk(37),"mob kinds 10-13 + 32-36");
 F32 sw,sh,ssp;I32 shp;MC34_Size(35,&sw,&sh,&shp,&ssp);T29_Check(Abs(sw-1.4)<0.001 && Abs(sh-0.9)<0.001 && shp==8,"spider 1.4x0.9 hp 8");MC34_Size(33,&sw,&sh,&shp,&ssp);T29_Check(shp==16 && Abs(sh-1.7)<0.001,"creeper hp 16");
 I32 badExit=0;for(k=0;k<10;k++){I32 *e=g34_exit+k*6,*c=g34_conn+k*6;Bool same=(e[0]==c[0] && e[2]==c[2] && e[3]==c[3] && e[5]==c[5]),swp=(e[0]==c[3] && e[2]==c[5] && e[3]==c[0] && e[5]==c[2]);if(!same && !swp)badExit++;}T29_Check(badExit==0,"rail EXITS and connection tables agree in x/z");
 T29_Check(g34_exit[2*6+1]==-1 && g34_conn[2*6+4]==1,"ascending east rail: low west exit, high east connection");
 MC34Sign sg;memset(&sg,0,sizeof(MC34Sign));MC34_SignSet(&sg,1,"0123456789abcdefghij");T29_Check(strlen(sg.text+16)==15 && sg.text[0]==0,"sign line clipped to 15 chars");
 T29_Check(MC34_Kind("zombie")==32 && MC34_Kind("pigman")==36 && MC34_Kind("minecart")==1 && MC34_Kind("x")==0,"summon names");
 T29_Check(MC35_Crop(59) && MC35_Crop(141) && MC35_Crop(142) && MC35_Crop(244),"crop classification");
 T29_Check(MC35_Crop(104) && MC35_Crop(105) && !MC35_Crop(60),"stem classification");
 MCCatalog028 *cat=MC_Alloc(sizeof(MCCatalog028));MC028_CatalogInit(cat);
 T29_Check(cat->texIndex[103]==79 && cat->texIndex[105]==80,"melon and melon stem texture");
 MC028_View(cat,59,0);F32 u0=cat->views[59].uv[0].minX,v0=cat->views[59].uv[0].minY;MC028_View(cat,59,7);T29_Check(u0!=cat->views[59].uv[0].minX || v0!=cat->views[59].uv[0].minY,"wheat stage texture");
 MC028_View(cat,141,0);u0=cat->views[141].uv[0].minX;v0=cat->views[141].uv[0].minY;MC028_View(cat,141,7);T29_Check(u0!=cat->views[141].uv[0].minX || v0!=cat->views[141].uv[0].minY,"carrot stage texture");
 MC028_CatalogDestroy(cat);free(cat);
 // batch035 mechanics: bow, paintings, reactor, stacks
 T29_Check(MC35_LaunchPower(0)==0 && MC35_LaunchPower(20)==1.0 && MC35_LaunchPower(40)==1.0,"bow launch power ends");
 T29_Check(MC35_LaunchPower(10)>0.41 && MC35_LaunchPower(10)<0.42,"bow launch power at 10 ticks");
 g35_using=FALSE;T29_Check(MC035_BowFrame()==-1,"bow frame idle");g35_using=TRUE;g35_useTicks=0;T29_Check(MC035_BowFrame()==0,"bow frame start");g35_useTicks=13;T29_Check(MC035_BowFrame()==1,"bow frame middle");g35_useTicks=30;T29_Check(MC035_BowFrame()==2,"bow frame full");g35_using=FALSE;g35_useTicks=0;
 I32 k35,big=0;for(k35=0;k35<28;k35++)if(!g35_mot[k35*5+4])big++;T29_Check(big==4,"four non-random motives (Earth/Wind/Fire/Water)");
 T29_Check(g35_mot[13*5]==32 && g35_mot[13*5+1]==32 && g35_mot[19*5]==64 && g35_mot[19*5+1]==64,"motive sizes Match/Pointer");
 MC35Paint pp;memset(&pp,0,sizeof(MC35Paint));pp.tx=10;pp.ty=20;pp.tz=30;pp.motive=0;MC35_SetDir(&pp,2);T29_Check(pp.yaw==0 && fabs(pp.z-(30.5-0.5625))<0.001 && fabs(pp.x-10.5)<0.001,"painting dir 2 position");
 T29_Check(pp.box.maxX-pp.box.minX>0.93 && pp.box.maxX-pp.box.minX<0.95 && pp.box.maxZ-pp.box.minZ<0.07,"painting 16x16 box");
 pp.motive=13;MC35_SetDir(&pp,1);T29_Check(pp.yaw==90 && fabs(pp.z-31.0)<0.001 && pp.box.maxZ-pp.box.minZ>1.9,"painting 32 wide dir 1 offset");
 T29_Check(MC35_PatternAt(1,1,1)==247 && MC35_PatternAt(0,0,0)==41 && MC35_PatternAt(0,1,1)==4 && MC35_PatternAt(2,0,0)==0 && MC35_PatternAt(2,1,1)==4,"reactor pattern");
 I32 gold35=0,cob35=0;for(k35=0;k35<27;k35++){if(g35_pattern[k35]==41)gold35++;if(g35_pattern[k35]==4)cob35++;}T29_Check(gold35==4 && cob35==14,"reactor needs 4 gold + 14 cobblestone");
 T29_Check(MC35_LevelChange(10) && MC35_LevelChange(40) && !MC35_LevelChange(11) && !MC35_LevelChange(46),"reactor level-change table");
 T29_Check(MC35_IsEdge(8,8,0) && MC35_IsEdge(0,8,-8) && !MC35_IsEdge(7,8,-7),"dome edge test");
 if(g_t29_fail){printf("T035 FAILED %d of %d\n",g_t29_fail,g_t29_n);return 1;}
 printf("T035 ok %d checks (creative list %d, sounds %d)\n",g_t29_n,G29_CREATIVE_N,g30_sndN);return 0;}
