// Port of minecraftpe/headers/item/ClockItem.hpp
class ClockItem { MCItem009 base;TextureUVCoordinateSet icon,textures[64];I32 frames;U8 *itemTexture; };
U0 ClockItem_Init(ClockItem *,MCItemContext010 *,I32);TextureUVCoordinateSet *ClockItem_getIcon(ClockItem *,I32,Bool);I32 ClockItem_getAnimationFrameFor(ClockItem *,F32);
