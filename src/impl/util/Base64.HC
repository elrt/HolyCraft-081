// Batch 002. Source: minecraftpe/impl/util/Base64.cpp
U8 Base64_b64_table[65]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
U0 Base64_base64Encode(MCString *input,MCString *out) {
 I64 length=input->size,pos=0,i; I32 bits=0; U32 accumulator=0;
 if(length<0 || length>6148914691236517200) { MCString_FromBytes(out,"Converting too large a string to base64.",39); return; }
 out->size=((length+2)/3)*4; out->data=MC_Alloc(out->size+1); MemSet(out->data,61,out->size); out->data[out->size]=0;
 for(i=0;i<length;i++) {
  accumulator=(accumulator<<8)|input->data[i]; bits+=8;
  while(bits>=6) { bits-=6; out->data[pos++]=Base64_b64_table[(accumulator>>bits)&63]; }
 }
 if(bits>0) { accumulator<<=6-bits; out->data[pos++]=Base64_b64_table[accumulator&63]; }
}
U0 Base64_base64Decode(MCString *input,MCString *out) {
 I64 i,pos=0; I32 bits=0,c,value; U32 accumulator=0;
 out->data=MC_Alloc(input->size+1); out->size=0;
 for(i=0;i<input->size;i++) {
  c=input->data[i]; if(c==61 || c==32 || (c>=9 && c<=13)) continue;
  value=64; if(c>=65 && c<=90) value=c-65; else if(c>=97 && c<=122) value=c-97+26;
  else if(c>=48 && c<=57) value=c-48+52; else if(c==43) value=62; else if(c==47) value=63;
  if(value>63) { free(out->data); MCString_Init(out); return; }
  accumulator=(accumulator<<6)|value; bits+=6; if(bits>=8) { bits-=8; out->data[pos++]=(accumulator>>bits)&255; }
 }
 out->size=pos; out->data[pos]=0;
}

