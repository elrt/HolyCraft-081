// Batch 003. Source: minecraftpe/headers/rendering/textures/DynamicTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_DYNAMICTEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_DYNAMICTEXTURE_HPP
class DynamicTexture { TextureUVCoordinateSet uv; I32 field_18; U8 *data;I32 dataLength; U0 (*tickFn)(DynamicTexture *self); };
U0 DynamicTexture_Init(DynamicTexture *self,TextureUVCoordinateSet *uv,I32 scale);
U0 DynamicTexture_Destroy(DynamicTexture *self);
U0 DynamicTexture_tick(DynamicTexture *self) { if(!self->tickFn) exit(82); self->tickFn(self); }
U0 DynamicTexture_bindTexture(DynamicTexture *self,MCTextureBinder *binder) { if(!binder || !binder->bind) exit(83);binder->bind(binder->context,"terrain-atlas.tga"); }

#endif

