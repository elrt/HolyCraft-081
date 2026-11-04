// Batch 005. Source: minecraftpe/headers/rendering/TextureAtlasTextureItem.hpp
#ifndef MCPE_HEADERS_RENDERING_TEXTUREATLASTEXTUREITEM_HPP
#define MCPE_HEADERS_RENDERING_TEXTUREATLASTEXTUREITEM_HPP
class TextureAtlasTextureItem { MCString name;TextureUVCoordinateSet uvCoords;MCVector uv;I32 uvCount; };
U0 TextureAtlasTextureItem_Init(TextureAtlasTextureItem *self);
U0 TextureAtlasTextureItem_InitValues(TextureAtlasTextureItem *self,MCString *name,TextureUVCoordinateSet *uv,MCVector *additional);
U0 TextureAtlasTextureItem_CopyInit(TextureAtlasTextureItem *self,TextureAtlasTextureItem *other);
TextureAtlasTextureItem *TextureAtlasTextureItem_Assign(TextureAtlasTextureItem *self,TextureAtlasTextureItem *other);
U0 TextureAtlasTextureItem_MoveInit(TextureAtlasTextureItem *self,TextureAtlasTextureItem *other);
U0 TextureAtlasTextureItem_getName(TextureAtlasTextureItem *self);
TextureUVCoordinateSet *TextureAtlasTextureItem_getUV(TextureAtlasTextureItem *self,I32 index);
I32 TextureAtlasTextureItem_getUVCount(TextureAtlasTextureItem *self);
U0 TextureAtlasTextureItem_Destroy(TextureAtlasTextureItem *self);

#endif

