// Inline implementation from ClothTileItem.hpp; ClothTileItem.cpp contains only #include.
U0 ClothTileItem_Init(ClothTileItem *s,MCItemContext010 *c,I32 id) { TileItem_Init(&s->base,c->items,c->place,id);s->base.base.maxDamage=0;s->base.base.stackedByData=TRUE;s->base.levelData=&ClothTileItem_getLevelDataForAuxValue;s->base.levelDataSelf=s;s->clothID=c->clothID; }
TextureUVCoordinateSet *ClothTileItem_getIcon(ClothTileItem *s,I32 aux) { return s->base.place->texture(s->base.place->host,s->clothID,2,aux,FALSE); }
I32 ClothTileItem_getLevelDataForAuxValue(U0 *s,I32 aux) { return aux; }
U0 ClothTileItem_getDescriptionId(ClothTileItem *s,MCPacketItem009 *it,MCString *out) { U8 *base=TileItem_getDescriptionId(&s->base,NULL);MC009_joinStrings(out,base,".",MC010_dyeColor((~it->aux)&15),""); }
U0 ClothTileItem_getName(ClothTileItem *s,MCPacketItem009 *it,MCString *out) { MCString desc,key;ClothTileItem_getDescriptionId(s,it,&desc);MC009_joinStrings(&key,MCString_CStr(&desc),".name","","");MCString_FromC(out,s->base.place->translate(s->base.place->host,MCString_CStr(&key)));MCString_Destroy(&desc);MCString_Destroy(&key); }
