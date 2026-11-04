// Batch 002. Source: minecraftpe/headers/util/ImageDef.hpp
#ifndef MCPE_HEADERS_UTIL_IMAGEDEF_HPP
#define MCPE_HEADERS_UTIL_IMAGEDEF_HPP
class ImageDef { MCString texture; I32 xOff,yOff; F32 width,height; I32 texXStart,texYStart,texWidth,texHeight; Bool initialized; };
U0 ImageDef_Init(ImageDef *self) {
 MCString_Init(&self->texture); self->xOff=0; self->yOff=0; self->texXStart=0; self->texYStart=0;
 self->width=16; self->height=16; self->texWidth=1; self->texHeight=1; self->initialized=FALSE;
}
U0 ImageDef_InitSized(ImageDef *self,U8 *texture,I32 x,I32 y,F32 width,F32 height,I32 tx,I32 ty,I32 tw,I32 th) {
 MCString_FromBytes(&self->texture,texture,MC_StrLen(texture)); self->initialized=TRUE;
 self->xOff=x; self->yOff=y; self->width=width; self->height=height; self->texXStart=tx; self->texYStart=ty; self->texWidth=tw; self->texHeight=th;
}
U0 ImageDef_InitTexture(ImageDef *self,U8 *texture,I32 x,I32 y,I32 tx,I32 ty,I32 tw,I32 th) { ImageDef_InitSized(self,texture,x,y,16,16,tx,ty,tw,th); }
U0 ImageDef_Destroy(ImageDef *self) { MCString_Destroy(&self->texture); }

#endif

