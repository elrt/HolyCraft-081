// Batch 003. Source: minecraftpe/headers/rendering/textures/WaterSideTexture.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTURES_WATERSIDETEXTURE_HPP
#define MCPE_HEADERS_RENDERING_TEXTURES_WATERSIDETEXTURE_HPP
class WaterSideTexture : DynamicTexture { I32 field_28 , field_2C , field_30 ;
 F32 * field_34 , * field_38 , * field_3C , * field_40 ;
 };
U0 WaterSideTexture_Init(WaterSideTexture *self);
U0 WaterSideTexture_tick(DynamicTexture *base);
U0 WaterSideTexture_Destroy(WaterSideTexture *self);

#endif

