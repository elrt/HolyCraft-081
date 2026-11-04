// Batch029 I18n: loads the APK en_US.lang (I18n::loadLanguage) and resolves item names like
// Item::getName/Tile::getName + I18n::get ("key<" marker when a key is missing, as in the original).
#define G29_LANG_SLOTS 4096
U8 *g29_langBuf=NULL;U8 *g29_langKey[G29_LANG_SLOTS];U8 *g29_langVal[G29_LANG_SLOTS];I32 g29_langN=0;
U32 MC029_Hash(U8 *k){U32 h=5381;I32 i;for(i=0;k[i];i++)h=(h*33+k[i])&0x7FFFFFFF;return h;}
U0 MC029_LangPut(U8 *k,U8 *v){U32 h=MC029_Hash(k)%G29_LANG_SLOTS;I32 n;for(n=0;n<G29_LANG_SLOTS;n++){if(!g29_langKey[h]){g29_langKey[h]=k;g29_langVal[h]=v;g29_langN++;return;}if(!strcmp(g29_langKey[h],k)){g29_langVal[h]=v;return;}h=(h+1)%G29_LANG_SLOTS;}}
U8 *MC029_Lang(U8 *k){U32 h=MC029_Hash(k)%G29_LANG_SLOTS;I32 n;for(n=0;n<G29_LANG_SLOTS;n++){if(!g29_langKey[h])return NULL;if(!strcmp(g29_langKey[h],k))return g29_langVal[h];h=(h+1)%G29_LANG_SLOTS;}return NULL;}
Bool MC029_LangLoad(U8 *path){memset(g29_langKey,0,sizeof(g29_langKey));memset(g29_langVal,0,sizeof(g29_langVal));g29_langN=0;U0 *f=fopen(path,"rb");if(!f)return FALSE;g29_langBuf=malloc(131072);I64 n=fread(g29_langBuf,1,131071,f);fclose(f);if(n<=0)return FALSE;g29_langBuf[n]=0;
 I64 i=0;if(n>=3 && g29_langBuf[0]==0xEF && g29_langBuf[1]==0xBB && g29_langBuf[2]==0xBF)i=3;
 while(i<n){I64 st=i;while(i<n && g29_langBuf[i]!=10 && g29_langBuf[i]!=13)i++;I64 en=i;while(i<n && (g29_langBuf[i]==10 || g29_langBuf[i]==13)){g29_langBuf[i]=0;i++;}g29_langBuf[en]=0;
  if(en<=st || g29_langBuf[st]=='#')continue;I64 eq=st;while(eq<en && g29_langBuf[eq]!='=')eq++;if(eq>=en)continue;g29_langBuf[eq]=0;MC029_LangPut(g29_langBuf+st,g29_langBuf+eq+1);}
 return g29_langN>0;}
// I18n::get(key) with the original "key<" marker for untranslated keys.
U0 MC029_Get(U8 *k,U8 *out){U8 *v=MC029_Lang(k);if(v){strncpy(out,v,127);out[127]=0;return;}strncpy(out,k,120);out[120]=0;strcat(out,"<");}
// Returns translation or the key itself (static strings used by the screens).
U8 *MC029_L(U8 *k){U8 *v=MC029_Lang(k);if(v)return v;return k;}
U8 *g29_colorName[16]={"black","red","green","brown","blue","purple","cyan","silver","gray","pink","lime","yellow","lightBlue","magenta","orange","white"};
U8 *g29_woodName[4]={"oak","spruce","birch","jungle"};
U8 *g29_slabName[7]={"stone","sand","wood","cobble","brick","smoothStoneBrick","quartz"};
U0 MC029_ItemName(MCApp028 *s,I32 id,I32 aux,U8 *out){U8 key[160];out[0]=0;if(id<1 || id>511){return;}U8 *d=G29_Desc[id];
 if(id==35){sprintf(key,"tile.cloth.%s.name",g29_colorName[(~aux)&15]);MC029_Get(key,out);return;}
 if(id==5){I32 k=aux;if(k>3 || k<0)k=0;sprintf(key,"tile.wood.%s.name",g29_woodName[k]);MC029_Get(key,out);return;}
 if(id==17){sprintf(key,"tile.log.%s.name",g29_woodName[aux&3]);MC029_Get(key,out);return;}
 if(id==157 || id==158){sprintf(key,"tile.woodSlab.%s.name",g29_woodName[aux&3]);MC029_Get(key,out);return;}
 if(id==43 || id==44){I32 k=aux;if(k<0 || k>6)k=0;sprintf(key,"tile.stoneSlab.%s.name",g29_slabName[k]);MC029_Get(key,out);return;}
 if(id==155){if(aux==1)MC029_Get("tile.quartzBlockChiseled.name",out);else if(aux==2)MC029_Get("tile.quartzBlockPillar.name",out);else MC029_Get("tile.quartzBlock.name",out);return;}
 if(id==31){if(aux==1)MC029_Get("tile.tallgrass.grass.name",out);else MC029_Get("tile.tallgrass.fern.name",out);return;}
 if(id==351){I32 k=aux;if(k<0)k=0;if(k>15)k=15;sprintf(key,"item.dyePowder.%s.name",g29_colorName[k]);MC029_Get(key,out);return;}
 if(id==263 && aux==1){MC029_Get("item.charcoal.name",out);return;}
 if(id==325){if(aux==8)MC029_Get("item.bucketWater.name",out);else if(aux==10)MC029_Get("item.bucketLava.name",out);else MC029_Get("item.bucket.name",out);return;}
 if(id==383){U8 *e="Pig";if(aux==10)e="Chicken";if(aux==11)e="Cow";if(aux==12)e="Pig";if(aux==13)e="Sheep";if(aux==32)e="Zombie";if(aux==33)e="Creeper";if(aux==34)e="Skeleton";if(aux==35)e="Spider";if(aux==36)e="PigZombie";U8 a[128],b[128];MC029_Get("item.monsterPlacer.name",a);sprintf(key,"entity.%s.name",e);MC029_Get(key,b);sprintf(out,"%s %s",a,b);return;}
 if(d && d[0]){sprintf(key,"%s.name",d);U8 *v=MC029_Lang(key);if(v){strncpy(out,v,127);out[127]=0;return;}}
 U8 *l=MC028_Label(&s->catalog,id,aux);if(l){strncpy(out,l,127);out[127]=0;}}
