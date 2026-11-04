// Port batch 001. Upstream: minecraftpe/headers/ImageData.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_IMAGEDATA_HPP
#define MCPE_HEADERS_IMAGEDATA_HPP
class ImageData { I32 width, height; U8 *pixels; I32 field_C, field_10, lod; };
U0 ImageData_Init(ImageData *self, I32 lod=0) {
 self->width=0; self->height=0; self->pixels=NULL; self->field_C=0; self->field_10=0; self->lod=lod;
}
#endif

