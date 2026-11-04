// Batch 003. Source: minecraftpe/headers/gui/NinePatchDescription.hpp
#ifndef MCPE_HEADERS_GUI_NINEPATCHDESCRIPTION_HPP
#define MCPE_HEADERS_GUI_NINEPATCHDESCRIPTION_HPP
class NinePatchDescription { F32 field_0,field_4,field_8,field_C,field_10,field_14,field_18,field_1C,field_20,field_24,field_28,field_2C;I32 width,height; };
U0 NinePatchDescription_Init(NinePatchDescription *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8,F32 a9,F32 a10,F32 a11,F32 a12,F32 a13);
U0 NinePatchDescription_transformUVForImageSize(NinePatchDescription *self,I32 w,I32 h);
U0 NinePatchDescription_transformUVForImage(NinePatchDescription *self,TextureData *texture) { NinePatchDescription_transformUVForImageSize(self,texture->image.width,texture->image.height); }
U0 NinePatchDescription_createSymmetrical(I32 w,I32 h,IntRectangle *rect,I32 bx,I32 by,NinePatchDescription *out) { NinePatchDescription_Init(out,rect->minX,rect->minY,bx,rect->width-bx,rect->width,by,rect->height-by,rect->height,bx,bx,by,by);if(w>0)NinePatchDescription_transformUVForImageSize(out,w,h); }

#endif

