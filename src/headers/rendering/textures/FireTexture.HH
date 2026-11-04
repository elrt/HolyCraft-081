// Batch 003. Source: minecraftpe/headers/rendering/textures/FireTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_FIRETEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_FIRETEXTURE_HPP
class FireTexture : DynamicTexture { F32 * field_28 , * field_2C ;
 Random random ;
 };
U0 FireTexture_Init(FireTexture *self);
U0 FireTexture_tick(DynamicTexture *base);
U0 FireTexture_Destroy(FireTexture *self);

#endif

