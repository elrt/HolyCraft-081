// Batch 003. Source: minecraftpe/headers/rendering/textures/LavaTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_LAVATEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_LAVATEXTURE_HPP
class LavaTexture : DynamicTexture { I32 field_28 , field_2C ;
 F32 * field_30 , * field_34 , * field_38 , * field_3C ;
 };
U0 LavaTexture_Init(LavaTexture *self);
U0 LavaTexture_tick(DynamicTexture *base);
U0 LavaTexture_Destroy(LavaTexture *self);

#endif

