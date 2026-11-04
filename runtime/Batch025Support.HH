class Level;class LevelChunk;class Tile;class Entity;class Mob;class Player;class LocalPlayer;class Options;class Minecraft;class Screen;class AppPlatform;
extern "c" I32 sscanf(U8*,U8*,...);
class MCUI025 {U0 *ctx;U0 (*keyboard)(U0*,Bool,MCString*,I32,Bool);U0 (*text)(U0*,MCString*,F32,F32,I32);U0 (*rect)(U0*,F32,F32,F32,F32,U32);U0 (*action)(U0*,I32,I32);U0 (*updateText)(U0*,MCString*);};
U0 MC025_Rect(MCUI025 *h,F32 x,F32 y,F32 xx,F32 yy,U32 color){if(h && h->rect!=NULL)h->rect(h->ctx,x(F32),y(F32),xx(F32),yy(F32),color);}
U0 MC025_Text(MCUI025 *h,MCString *text,F32 x,F32 y,I32 color){if(h && h->text!=NULL)h->text(h->ctx,text,x(F32),y(F32),color);}
Bool MC025_Str(MCString *s,U8 *text){MCString a;MCString_FromC(&a,text);Bool ok=MCString_Equal(s,&a);MCString_Destroy(&a);return ok;}
U0 MC025_Append(MCString *s,U8 *text){MCString_AppendBytes017(s,text,strlen(text));}
I32 MC025_UTFCount(MCString *s){U8 *p=s->data;I32 n=0;while(p<s->data+s->size){if(MC024_UTF8(&p)<0)return -1;n++;}return n;}
U0 MC025_PopChar(MCString *s){if(!s->size)return;I32 n=s->size-1;while(n>0 && (s->data[n]&192)==128)n--;s->size=n;s->data[n]=0;}
U0 MC025_Bytes(MCVector *v,U8 *data,I32 n){MCVector_Reserve(v,n);if(n)memcpy(v->data,data,n);v->size=n;}
class MCTick025 {I32 x,y,z,id;I64 time;};
class MCTileEntity025 {I32 x,y,z;U0 *object;I32 kind;};

Bool MC025_Intersects(AABB *a,AABB *b){return a->maxX>b->minX && a->minX<b->maxX && a->maxY>b->minY && a->minY<b->maxY && a->maxZ>b->minZ && a->minZ<b->maxZ;}
