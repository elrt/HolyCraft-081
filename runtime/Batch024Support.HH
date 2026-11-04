class TileEntity;class ChestTileEntity;class LevelData;class Tesselator;
class MCWorld024 {MCWorld023 *w;Bool passable[256],flammable[256],stairs[256],rails[256];I32 calmWater,fence,fenceGate,obsidian,netherrack,reactor,glowingObsidian,ice;Bool instantTick;};
U0 MC024_Init(MCWorld024 *s,MCWorld023 *w){memset(s,0,sizeof(MCWorld024));s->w=w;s->passable[0]=TRUE;}
Bool MC024_ValidId(I32 id){return id>=0 && id<256;}
Bool MC024_Passable(MCWorld024 *s,I32 x,I32 y,I32 z){I32 id=MC023_Tile(s->w,x,y,z);return MC024_ValidId(id) && s->passable[id];}
I32 MC024_Int(CompoundTag *t,U8 *name){MCString k;MCString_FromC(&k,name);I32 v=CompoundTag_getInt(t,&k);MCString_Destroy(&k);return v;}
I64 MC024_Long(CompoundTag *t,U8 *name){MCString k;MCString_FromC(&k,name);I64 v=CompoundTag_getLong(t,&k);MCString_Destroy(&k);return v;}
U0 MC024_PutInt(CompoundTag *t,U8 *name,I32 v){MCString k;MCString_FromC(&k,name);CompoundTag_putInt(t,&k,v);MCString_Destroy(&k);}
U0 MC024_PutLong(CompoundTag *t,U8 *name,I64 v){MCString k;MCString_FromC(&k,name);CompoundTag_putLong(t,&k,v);MCString_Destroy(&k);}
U0 MC024_PutString(CompoundTag *t,U8 *name,MCString *v){MCString k;MCString_FromC(&k,name);CompoundTag_putString(t,&k,v);MCString_Destroy(&k);}
U0 MC024_GetString(CompoundTag *t,U8 *name,MCString *v){MCString k;MCString_FromC(&k,name);CompoundTag_getString(t,&k,v);MCString_Destroy(&k);}
U0 MC024_SetString(MCString *out,U8 *value){MCString temp;MCString_FromC(&temp,value);MCString_Assign(out,&temp);MCString_Destroy(&temp);}
Bool MC024_Contains(CompoundTag *t,U8 *name,I32 type){Tag *v=MC023_TagGet(t,name);return v && Tag_getId(v)==type;}
I64 MC024_Epoch(){MCTimeval t;gettimeofday(&t,NULL);return t.tv_sec;}
U0 MC024_BytesInit(MCVector *v){MCVector_Init(v,1);}
Bool MC024_ReadFile(U8 *path,MCVector *v){v->size=0;U0 *f=fopen(path,"rb");if(!f)return FALSE;fseek(f,0,2);I64 n=ftell(f);fseek(f,0,0);if(n<0 || n>67108864){fclose(f);return FALSE;}MCVector_Reserve(v,n);Bool ok=fread(v->data,1,n,f)==n;if(ok)v->size=n;fclose(f);return ok;}
class MCAudio024 {U0 *ctx;Bool (*init)(U0*,I32);Bool (*playing)(U0*,I32,I32);Bool (*play)(U0*,I32,I32,SoundDesc*,F32,F32,F32,F32,F32,I32);U0 (*release)(U0*,I32,I32);U0 (*angle)(U0*,I32,F32,F32,F32);};
class MCImage024 {I32 width,height,format,lod;U8 *pixels;I64 bytes;Bool borrowed;};
class MCTextureBackend024 {U0 *ctx;Bool (*load)(U0*,MCString*,MCImage024*);U32 (*create)(U0*);Bool (*upload)(U0*,U32,MCImage024*,Bool);U0 (*bind)(U0*,U32);U0 (*remove)(U0*,U32);};
class MCVertex024 {F32 x,y,z,u,v;U32 color;I8 nx,ny,nz,pad;};
class MCGeometry024 {U0 *ctx;U0 (*draw)(U0*,MCVertex024*,I32,U16*,I32,I32);Bool (*tile)(U0*,I32,I32,I32,I32,Tesselator*);I32 (*layer)(U0*,I32);};
