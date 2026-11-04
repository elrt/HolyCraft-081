// Port of minecraftpe/headers/item/CompassItem.hpp
class CompassItem { MCItem009 base;TextureUVCoordinateSet icon,textures[32];I32 frames;U8 *itemTexture; };
U0 CompassItem_Init(CompassItem *,MCItemContext010 *,I32);TextureUVCoordinateSet *CompassItem_getIcon(CompassItem *,I32,Bool);I32 CompassItem_getAnimationFrameFor(CompassItem *,MCItemContext010 *);
