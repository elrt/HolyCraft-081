// libpng is an explicit Linux decoder dependency, not disguised as a ported stb PNG algorithm.
U8 *MC027_ImageError="No failure";
I32 MC027_LE16(U8 *p){return p[0]+(p[1]<<8);}
U32 MC027_LE32(U8 *p){return p[0]+(p[1]<<8)+(p[2]<<16)+(p[3]<<24);}
Bool MC027_ImageSize(I32 w,I32 h){return w>0 && h>0 && w<=8192 && h<=8192 && (w(I64))*h<=33554432;}
U8 *MC027_ConvertImage(U8 *rgba,I32 count,I32 n){if(n==4)return rgba;U8 *out=MC_Alloc(count(I64)*n);I32 i;for(i=0;i<count;i++){U8 *p=rgba+i*4,*q=out+i*n;I32 gray=(p[0]*77+p[1]*150+p[2]*29)>>8;if(n<3){q[0]=gray;if(n==2)q[1]=p[3];}else{q[0]=p[0];q[1]=p[1];q[2]=p[2];}}free(rgba);return out;}
U0 stbi_image_free(U0 *p){free(p);}
U8 *stbi_failure_reason(){return MC027_ImageError;}
U8 *stbi_load_from_memory(U8 *d,I32 n,I32 *x,I32 *y,I32 *comp,I32 req){MC027_ImageError="Unsupported or malformed image";if(!d || n<3 || req<0 || req>4)return NULL;I32 w=0,h=0,c=0,outChannels=req;U8 *pixels=NULL;
 if(n>=8 && d[0]==137 && d[1]=='P' && d[2]=='N' && d[3]=='G'){
  MCPngImage027 image;memset(&image,0,sizeof(image));image.version=1;
  if(!png_image_begin_read_from_memory(&image,d,n)){png_image_free(&image);return NULL;}w=image.width;h=image.height;c=1;if(image.format&2)c=3;if(image.format&1)c++;
  if(!MC027_ImageSize(w,h)){png_image_free(&image);return NULL;}image.format=3;pixels=MC_Alloc(w(I64)*h*4);
  if(!png_image_finish_read(&image,NULL,pixels,0,NULL)){free(pixels);png_image_free(&image);return NULL;}png_image_free(&image);
 }else if(n>=54 && d[0]=='B' && d[1]=='M'){
  I32 offset=MC027_LE32(d+10),header=MC027_LE32(d+14),bits=MC027_LE16(d+28),compression=MC027_LE32(d+30);w=MC027_LE32(d+18);h=MC027_LE32(d+22);Bool top=h<0;if(top)h=-h;
  if(header<40 || bits!=24 || compression!=0 || !MC027_ImageSize(w,h))return NULL;I64 stride=((w(I64)*3+3)/4)*4;if(offset<54 || offset(I64)+stride*h>n)return NULL;c=3;pixels=MC_Alloc(w(I64)*h*4);I32 yy,xx;
  for(yy=0;yy<h;yy++)for(xx=0;xx<w;xx++){I32 sy=h-1-yy;if(top)sy=yy;U8 *p=d+offset+stride*sy+xx*3,*q=pixels+(yy*w+xx)*4;q[0]=p[2];q[1]=p[1];q[2]=p[0];q[3]=255;}
 }else if(n>=18){
  I32 type=d[2],bits=d[16],bytes=bits/8,offset=18+d[0];w=MC027_LE16(d+12);h=MC027_LE16(d+14);Bool gray=type==3 || type==11,rle=type==10 || type==11;
  if(d[1]!=0 || (type!=2 && type!=3 && type!=10 && type!=11) || !MC027_ImageSize(w,h) || offset>n)return NULL;
  if((gray && bits!=8) || (!gray && bits!=24 && bits!=32))return NULL;c=bytes;pixels=MC_Alloc(w(I64)*h*4);I32 total=w*h,i=0,remaining=0;Bool repeated=FALSE;U8 value[4];
  while(i<total){if(!remaining){remaining=1;repeated=FALSE;if(rle){if(offset>=n){free(pixels);return NULL;}I32 packet=d[offset++];remaining=(packet&127)+1;repeated=(packet&128)!=0;}if(remaining>total-i){free(pixels);return NULL;}if(repeated){if(offset+bytes>n){free(pixels);return NULL;}memcpy(value,d+offset,bytes);offset+=bytes;}}
   U8 *p=value;if(!repeated){if(offset+bytes>n){free(pixels);return NULL;}p=d+offset;offset+=bytes;}
   I32 xx=i%w,yy=i/w;if(!(d[17]&32))yy=h-1-yy;if(d[17]&16)xx=w-1-xx;U8 *q=pixels+(yy*w+xx)*4;
   if(gray){q[0]=p[0];q[1]=p[0];q[2]=p[0];q[3]=255;}else{q[0]=p[2];q[1]=p[1];q[2]=p[0];q[3]=255;if(bytes==4)q[3]=p[3];}i++;remaining--;}
 }else return NULL;
 if(!pixels)return NULL;if(!outChannels)outChannels=c;pixels=MC027_ConvertImage(pixels,w*h,outChannels);if(x)*x=w;if(y)*y=h;if(comp)*comp=c;MC027_ImageError="No failure";return pixels;
}
U8 *stbi_load(U8 *path,I32 *x,I32 *y,I32 *comp,I32 req){MCVector bytes;MC024_BytesInit(&bytes);if(!MC024_ReadFile(path,&bytes)){MCVector_Destroy(&bytes);MC027_ImageError="Cannot read file";return NULL;}U8 *p=stbi_load_from_memory(bytes.data,bytes.size,x,y,comp,req);MCVector_Destroy(&bytes);return p;}
I32 stbi_info_from_memory(U8 *data,I32 n,I32 *x,I32 *y,I32 *comp){I32 w,h,c;U8 *p=stbi_load_from_memory(data,n,&w,&h,&c,4);if(!p)return 0;free(p);if(x)*x=w;if(y)*y=h;if(comp)*comp=c;return 1;}
