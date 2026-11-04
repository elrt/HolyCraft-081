// Batch 004. Source: minecraftpe/impl/Config.cpp
U0 createConfig(Config *out,U0 *mc,U0 *options,I32 width,I32 height,F32 guiScale,F32 pixelsPerMillimeter,F32 c88,F32 c8c,F32 c90) { out->width=width;out->height=height;out->guiScale=guiScale;out->guiScaleNorm=1.0/guiScale;out->mc=mc;out->options=options;out->field_18=pixelsPerMillimeter;out->field_1C=c88;out->field_20=c8c;out->field_24=c90;out->field_10=width*height;out->field_14=height*out->guiScaleNorm; }

