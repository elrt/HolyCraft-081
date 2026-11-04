#ifndef MCPE_BATCH017_SUPPORT
#define MCPE_BATCH017_SUPPORT
// Batch 017 runtime support. Platform/ABI choice: plain C++ char follows the
// Android ARMv7 target ABI (unsigned char). Host classes below are explicit
// boundaries for systems that are still not ported; they are not replacements.
extern "c" F64 sin(F64 x);
extern "c" F64 floor(F64 x);
// Exact transcription of utf8proc_iterate (minecraftpe/impl/utf8proc/utf8proc.c).
// utf8proc.c itself is not mapped yet; only this function is needed by Util.
I32 MC_utf8proc_iterate017(U8 *str,I64 strlen,I32 *dst){I32 length,i,uc=-1;U8 c=0;*dst=-1;if(!strlen)return 0;c=str[0];if(c<0x80)length=1;else if(c<0xC0)length=0;else if(c<0xE0)length=2;else if(c<0xF0)length=3;else if(c<0xF8)length=4;else length=0;if(!length)return -3;if(strlen>=0&&length>strlen)return -3;for(i=1;i<length;i++){if((str[i]&0xC0)!=0x80)return -3;}switch(length){case 1:uc=str[0];break;case 2:uc=((str[0]&0x1F)<<6)+(str[1]&0x3F);if(uc<0x80)uc=-1;break;case 3:uc=((str[0]&0x0F)<<12)+((str[1]&0x3F)<<6)+(str[2]&0x3F);if(uc<0x800||(uc>=0xD800&&uc<0xE000)||(uc>=0xFDD0&&uc<0xFDF0))uc=-1;break;case 4:uc=((str[0]&0x07)<<18)+((str[1]&0x3F)<<12)+((str[2]&0x3F)<<6)+(str[3]&0x3F);if(uc<0x10000||uc>=0x110000)uc=-1;break;}if(uc<0||((uc&0xFFFF)>=0xFFFE))return -3;*dst=uc;return length;}
// Small std::string helpers with libstdc++ semantics used by the ports below.
U0 MCString_Sub017(MCString *out,MCString *s,I64 pos,I64 count){if(pos>s->size){printf("std::out_of_range: substr\n");exit(117);}if(count<0||count>s->size-pos)count=s->size-pos;MCString_FromBytes(out,s->data+pos,count);}
I64 MCString_Find017(MCString *s,MCString *needle,I64 from){I64 i;if(from>s->size)return -1;if(needle->size==0)return from;for(i=from;i+needle->size<=s->size;i++)if(!memcmp(s->data+i,needle->data,needle->size))return i;return -1;}
I64 MCString_FindChar017(MCString *s,U8 c,I64 from){I64 i;for(i=from;i<s->size;i++)if(s->data[i]==c)return i;return -1;}
I64 MCString_RFindChar017(MCString *s,U8 c){I64 i;for(i=s->size-1;i>=0;i--)if(s->data[i]==c)return i;return -1;}
U0 MCString_AppendBytes017(MCString *s,U8 *b,I64 n){U8 *d=MC_Alloc(s->size+n+1);if(s->size)memcpy(d,s->data,s->size);if(n)memcpy(d+s->size,b,n);d[s->size+n]=0;free(s->data);s->data=d;s->size+=n;}
U0 MCString_AppendChar017(MCString *s,U8 c){MCString_AppendBytes017(s,&c,1);}
U0 MCString_AppendStr017(MCString *s,MCString *o){MCString_AppendBytes017(s,o->data,o->size);}
U0 MCString_Replace017(MCString *s,I64 pos,I64 count,MCString *with){MCString r;if(pos>s->size){printf("std::out_of_range: replace\n");exit(117);}if(count>s->size-pos)count=s->size-pos;MCString_FromBytes(&r,s->data,pos);MCString_AppendStr017(&r,with);MCString_AppendBytes017(&r,s->data+pos+count,s->size-pos-count);MCString_Destroy(s);*s=r;}
U8 MC_tolower017(U8 c){if(c>='A'&&c<='Z')return c+32;return c;}
#endif
