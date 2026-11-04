// Batch 004. Source: minecraftpe/headers/Config.hpp
#ifndef MCPE_HEADERS_CONFIG_HPP
#define MCPE_HEADERS_CONFIG_HPP
class Config { I32 width,height; F32 guiScale,guiScaleNorm; I32 field_10,field_14; F32 field_18,field_1C,field_20,field_24; U0 *mc,*options; };
U0 createConfig(Config *out,U0 *mc,U0 *options,I32 width,I32 height,F32 guiScale,F32 pixelsPerMillimeter,F32 c88,F32 c8c,F32 c90);

#endif

