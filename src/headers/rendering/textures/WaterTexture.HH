// Batch 003. Source: minecraftpe/headers/rendering/textures/WaterTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_WATERTEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_WATERTEXTURE_HPP
class WaterTexture : DynamicTexture { I32 field_28 , field_2C ;
 F32 * field_30 , * field_34 , * field_38 , * field_3C ;
 };
U0 WaterTexture_Init(WaterTexture *self,TextureUVCoordinateSet *uv);
U0 WaterTexture_tick(DynamicTexture *base);
U0 WaterTexture_Destroy(WaterTexture *self);

#endif

