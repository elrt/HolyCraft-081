// Port batch 001. Upstream: minecraftpe/headers/rendering/textures/TextureData.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_TEXTUREDATA_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_TEXTUREDATA_HPP
class MCImageVector { ImageData *data; I64 size,capacity; };
class TextureData { ImageData image; U8 field_18; U32 glTexId; MCImageVector images; };
U0 TextureData_Init(TextureData *self) {
 ImageData_Init(&self->image); self->field_18=0; self->glTexId=0;
 self->images.data=NULL; self->images.size=0; self->images.capacity=0;
}
U0 TextureData_Destroy(TextureData *self) {
 free(self->images.data); self->images.data=NULL; self->images.size=0; self->images.capacity=0;
}
// Vector push/copy are support API for future translated callers, not ImageData pixel ownership.
U0 MCImageVector_Push(MCImageVector *self,ImageData *value) {
 I64 cap; ImageData *p;
 if(self->size==self->capacity) {
  cap=self->capacity*2; if(cap<4) cap=4;
  p=MC_Alloc(cap*sizeof(ImageData));
  if(self->size) memcpy(p,self->data,self->size*sizeof(ImageData)); free(self->data);
  self->data=p; self->capacity=cap;
 }
 memcpy(&self->data[self->size],value,sizeof(ImageData)); self->size++;
}
#endif

