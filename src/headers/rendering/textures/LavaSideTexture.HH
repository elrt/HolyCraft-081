// Batch 003. Source: minecraftpe/headers/rendering/textures/LavaSideTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_LAVASIDETEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_LAVASIDETEXTURE_HPP
class LavaSideTexture : DynamicTexture { I32 field_28 , field_2C , field_30 ;
 F32 * field_34 , * field_38 , * field_3C , * field_40 ;
 };
U0 LavaSideTexture_Init(LavaSideTexture *self,TextureUVCoordinateSet *uv);
U0 LavaSideTexture_tick(DynamicTexture *base);
U0 LavaSideTexture_Destroy(LavaSideTexture *self);

#endif

