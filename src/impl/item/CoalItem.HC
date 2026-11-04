// Batch 009: minecraftpe/impl/item/CoalItem.cpp includes the header only.
U0 CoalItem_Init(CoalItem *s,MCItemContext009 *c,MCPlaceContext009 *p,I32 id,TextureUVCoordinateSet *baseIcon) { TextureUVCoordinateSet *charcoal;MCItem009_Init(&s->base,c,id);s->base.stackedByData=TRUE;s->base.maxDamage=0;s->iconUV=*baseIcon;charcoal=p->itemTexture(p->host,"charcoal",0);if(!charcoal) { printf("CoalItem: missing charcoal texture\n");exit(97); }s->charcoal=*charcoal; }
TextureUVCoordinateSet *CoalItem_getIcon(CoalItem *s,I32 aux,I32 unused,Bool use) { if(aux==1)return &s->charcoal;return &s->iconUV; }
U8 *CoalItem_getDescriptionId(CoalItem *s,MCPacketItem009 *it) { if(it->aux==1)return "item.charcoal";return "item.coal"; }
