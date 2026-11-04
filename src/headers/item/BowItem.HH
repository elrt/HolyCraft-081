// Port of minecraftpe/headers/item/BowItem.hpp
class BowItem { MCItem009 base;TextureUVCoordinateSet icon,textures[3];I32 frames; };
U0 BowItem_Init(BowItem *,MCItemContext010 *,I32); F32 BowItem_getLaunchPower(BowItem *,I32);TextureUVCoordinateSet *BowItem_getIcon(BowItem *,I32,Bool);MCPacketItem009 *BowItem_use(BowItem *,MCItemContext010 *,MCPacketItem009 *);I32 BowItem_getMaxUseDuration(BowItem *);I32 BowItem_getUseAnimation(BowItem *);U0 BowItem_releaseUsing(BowItem *,MCItemContext010 *,MCPacketItem009 *,I32);I32 BowItem_getAnimationFrameFor(BowItem *,I32);
