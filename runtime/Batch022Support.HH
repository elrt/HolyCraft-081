extern "c" I64 strtoll(U8*,U8**,I32);
// Owned strings/vectors; host pointers and callback payloads are borrowed unless documented.
U0 MC022_Set(MCString *s,U8 *v) {MCString t;MCString_FromC(&t,v);MCString_Assign(s,&t);MCString_Destroy(&t);}
U0 MC022_Join(MCString *out,MCString *a,MCString *b) {MCString_CopyInit(out,a);MCString_AppendStr017(out,b);}
Bool MC022_Str(MCString *s,U8 *v) {return s->size==MC_StrLen(v) && memcmp(s->data,v,s->size)==0;}
F32 MC022_Clamp(F32 x) {if(x>1.0)return 1.0;if(x<0.0)return 0.0;return x;}
class MC022Box {I32 x,y,w,h;Bool active,visible,pressed;};
U0 MC022_Box(MC022Box *b,I32 x,I32 y,I32 w,I32 h) {b->x=x;b->y=y;b->w=w;b->h=h;b->active=TRUE;b->visible=TRUE;b->pressed=FALSE;}
Bool MC022_Hit(MC022Box *b,I32 x,I32 y) {return b->active && b->visible && x>=b->x && x<b->x+b->w && y>=b->y && y<b->y+b->h;}
class MC022Vertex {F32 x,y,z,u,v;U32 color;};
class MC022DrawHost {
 U0 *ctx;U0 (*quad)(U0*,MC022Vertex*,Bool);U0 (*text)(U0*,U8*,I32,I32,U32,Bool);I32 (*textWidth)(U0*,U8*);
 U0 (*texture)(U0*,U8*);U0 (*clip)(U0*,Bool,I32,I32,I32,I32);U0 (*event)(U0*,I32,I64,U0*);
};
// Event values are explicit projection commands, not original ScreenChooser enum values.
#define MC022_START 1
#define MC022_PLAY 2
#define MC022_OPTIONS 3
#define MC022_CLOSE 4
#define MC022_LEAVE 5
#define MC022_JOIN 6
#define MC022_CANCEL_LOCATE 7
#define MC022_LOCATE 8
#define MC022_SELECT_WORLD 9
#define MC022_BUY 10
#define MC022_QUIT 11
#define MC022_INVALID_LICENSE 12
#define MC022_DISCONNECT 13
#define MC022_LOGIN_WINDOW 14
#define MC022_STATUS_REQUEST 15
#define MC022_STATUS_CHANGED 16
#define MC022_SAVE_LOGIN 17
#define MC022_ADD_SERVER 18
#define MC022_REMOVE_FRIEND 19
#define MC022_MANAGE_SERVER 20
#define MC022_ITEM_SELECTED 21
U0 MC022_Event(MC022DrawHost *h,I32 op,I64 arg,U0 *data) {if(h && (h->event!=NULL))h->event(h->ctx,op,arg,data);}
I32 MC022_TextWidth(MC022DrawHost *h,U8 *s) {if(h && (h->textWidth!=NULL))return h->textWidth(h->ctx,s);return MC_StrLen(s)*6;}
U0 MC022_Text(MC022DrawHost *h,U8 *s,I32 x,I32 y,U32 c,Bool shadow) {if(h && (h->text!=NULL))h->text(h->ctx,s,x,y,c,shadow);}
U0 MC022_Center(MC022DrawHost *h,U8 *s,I32 x,I32 y,U32 c) {MC022_Text(h,s,x-MC022_TextWidth(h,s)/2,y,c,TRUE);}
U0 MC022_Texture(MC022DrawHost *h,U8 *s) {if(h && (h->texture!=NULL))h->texture(h->ctx,s);}
U0 MC022_Clip(MC022DrawHost *h,Bool on,I32 x,I32 y,I32 w,I32 ht) {if(h && (h->clip!=NULL))h->clip(h->ctx,on,x,y,w,ht);}
// JSON owned tree, supports escaped UTF-16 surrogate pairs. Limits depth and total nodes.
class MC022Json {I32 type;MCString value,key;MCPtrVector children;};
class MC022JsonReader {U8 *s;I64 n,p,nodes;Bool ok;};
MC022Json *MC022_JsonNew(I32 type) {MC022Json *v=MC_Alloc(sizeof(MC022Json));v->type=type;MCString_Init(&v->value);MCString_Init(&v->key);MCPtrVector_Init(&v->children);return v;}
U0 MC022_JsonFree(MC022Json *v) {if(!v)return;I64 i;for(i=0;i<v->children.size;i++)MC022_JsonFree(v->children.data[i]);MCPtrVector_Destroy(&v->children);MCString_Destroy(&v->key);MCString_Destroy(&v->value);free(v);}
U0 MC022_Space(MC022JsonReader *r) {while(r->p<r->n && (r->s[r->p]==32 || r->s[r->p]==9 || r->s[r->p]==10 || r->s[r->p]==13))r->p++;}
I32 MC022_Hex(U8 c) {if(c>='0' && c<='9')return c-'0';if(c>='a' && c<='f')return c-'a'+10;if(c>='A' && c<='F')return c-'A'+10;return -1;}
I32 MC022_U16(MC022JsonReader *r) {I32 i,v=0,a;for(i=0;i<4;i++){if(r->p>=r->n){r->ok=FALSE;return 0;}a=MC022_Hex(r->s[r->p++]);if(a<0)r->ok=FALSE;v=v*16+a;}return v;}
U0 MC022_UTF8(MCString *s,I32 c) {if(c<128)MCString_AppendChar017(s,c);else if(c<2048){MCString_AppendChar017(s,192|(c>>6));MCString_AppendChar017(s,128|(c&63));}else if(c<65536){MCString_AppendChar017(s,224|(c>>12));MCString_AppendChar017(s,128|((c>>6)&63));MCString_AppendChar017(s,128|(c&63));}else{MCString_AppendChar017(s,240|(c>>18));MCString_AppendChar017(s,128|((c>>12)&63));MCString_AppendChar017(s,128|((c>>6)&63));MCString_AppendChar017(s,128|(c&63));}}
Bool MC022_JsonString(MC022JsonReader *r,MCString *out) {if(r->p>=r->n || r->s[r->p++]!='"')return FALSE;U8 c;I32 a,b;while(r->p<r->n){c=r->s[r->p++];if(c=='"')return r->ok;if(c<32)return FALSE;if(c=='\\'){if(r->p>=r->n)return FALSE;c=r->s[r->p++];if(c=='u'){a=MC022_U16(r);if(a>=0xD800 && a<=0xDBFF){if(r->p+2>r->n || r->s[r->p++]!='\\' || r->s[r->p++]!='u')return FALSE;b=MC022_U16(r);if(b<0xDC00 || b>0xDFFF)return FALSE;a=65536+((a-0xD800)<<10)+b-0xDC00;}else if(a>=0xDC00 && a<=0xDFFF)return FALSE;MC022_UTF8(out,a);continue;}if(c=='n')c=10;else if(c=='r')c=13;else if(c=='t')c=9;else if(c=='b')c=8;else if(c=='f')c=12;else if(c!='"' && c!='\\' && c!='/')return FALSE;}MCString_AppendChar017(out,c);}return FALSE;}
MC022Json *MC022_JsonRead(MC022JsonReader *r,I32 depth) {MC022_Space(r);if(depth>64 || ++r->nodes>100000 || r->p>=r->n){r->ok=FALSE;return NULL;}U8 c=r->s[r->p],end;MC022Json *v,*child;I64 start;MCString key;v=MC022_JsonNew(0);if(c=='{' || c=='['){v->type=1;if(c=='[')v->type=2;end='}';if(c=='[')end=']';r->p++;MC022_Space(r);if(r->p<r->n && r->s[r->p]==end){r->p++;return v;}while(r->ok){MCString_Init(&key);if(v->type==1){if(!MC022_JsonString(r,&key))r->ok=FALSE;MC022_Space(r);if(r->p>=r->n || r->s[r->p++]!=':')r->ok=FALSE;}child=NULL;if(r->ok)child=MC022_JsonRead(r,depth+1);if(child){MCString_Assign(&child->key,&key);MCPtrVector_Push(&v->children,child);}MCString_Destroy(&key);if(!r->ok)break;MC022_Space(r);if(r->p>=r->n){r->ok=FALSE;break;}c=r->s[r->p++];if(c==end)return v;if(c!=','){r->ok=FALSE;break;}MC022_Space(r);}}else if(c=='"'){v->type=3;r->ok=MC022_JsonString(r,&v->value);return v;}else{start=r->p;if(c=='-' || (c>='0' && c<='9')){v->type=4;if(c=='-')r->p++;if(r->p>=r->n)r->ok=FALSE;else if(r->s[r->p]=='0')r->p++;else{if(r->s[r->p]<'1' || r->s[r->p]>'9')r->ok=FALSE;while(r->p<r->n && r->s[r->p]>='0' && r->s[r->p]<='9')r->p++;}if(r->p<r->n && r->s[r->p]=='.'){r->p++;I64 before=r->p;while(r->p<r->n && r->s[r->p]>='0' && r->s[r->p]<='9')r->p++;if(before==r->p)r->ok=FALSE;}if(r->p<r->n && (r->s[r->p]=='e' || r->s[r->p]=='E')){r->p++;if(r->p<r->n && (r->s[r->p]=='+' || r->s[r->p]=='-'))r->p++;I64 beforeExp=r->p;while(r->p<r->n && r->s[r->p]>='0' && r->s[r->p]<='9')r->p++;if(beforeExp==r->p)r->ok=FALSE;}}else if(r->p+4<=r->n && !memcmp(r->s+r->p,"true",4)){v->type=5;r->p+=4;}else if(r->p+5<=r->n && !memcmp(r->s+r->p,"false",5)){v->type=5;r->p+=5;}else if(r->p+4<=r->n && !memcmp(r->s+r->p,"null",4))r->p+=4;else r->ok=FALSE;if(r->ok){MCString_FromBytes(&v->value,r->s+start,r->p-start);return v;}}r->ok=FALSE;MC022_JsonFree(v);return NULL;}
MC022Json *MC022_JsonParse(MCString *s) {MC022JsonReader r;r.s=s->data;r.n=s->size;r.p=0;r.nodes=0;r.ok=TRUE;MC022Json *v=MC022_JsonRead(&r,0);MC022_Space(&r);if(!r.ok || r.p!=r.n){MC022_JsonFree(v);return NULL;}return v;}
MC022Json *MC022_Get(MC022Json *v,U8 *key) {if(!v || v->type!=1)return NULL;I64 i;MC022Json *c,*found=NULL;for(i=0;i<v->children.size;i++){c=v->children.data[i];if(MC022_Str(&c->key,key))found=c;}return found;}
U0 MC022_JsonText(MCString *out,MC022Json *v,U8 *def) {MCString_FromC(out,def);if(v && v->type==0)MC022_Set(out,"");else if(v && v->type==3){I64 len=0;while(len<v->value.size && v->value.data[len])len++;MCString_Destroy(out);MCString_FromBytes(out,v->value.data,len);}else if(v && v->type==4)MCString_Assign(out,&v->value);else if(v && v->type==5)MCString_Assign(out,&v->value);}
I64 MC022_JsonInt(MC022Json *v,I64 def) {if(!v || v->type==0)return def;if(v->type==5)return MC022_Str(&v->value,"true");if(v->type!=4)return def;return strtoll(MCString_CStr(&v->value),NULL,10);}
Bool MC022_JsonBool(MC022Json *v) {if(!v)return FALSE;if(v->type==5)return MC022_Str(&v->value,"true");if(v->type==4)return MC022_JsonInt(v,0)!=0;return FALSE;}

