// Batch 005. Source: minecraftpe/headers/tile/BookshelfTile.hpp
#ifndef MCPE_HEADERS_TILE_BOOKSHELFTILE_HPP
#define MCPE_HEADERS_TILE_BOOKSHELFTILE_HPP
class BookshelfTile: MCBlockState { TextureUVCoordinateSet uv; };
U0 BookshelfTile_Init(BookshelfTile *self,I32 id,MCString *name,Material *mat);
TextureUVCoordinateSet * BookshelfTile_getTexture(BookshelfTile *self,I32 side);
I32 BookshelfTile_getResource(BookshelfTile *self,I32 data,Random *r);
I32 BookshelfTile_getResourceCount(BookshelfTile *self,Random *r);
U0 BookshelfTile_Destroy(BookshelfTile *self);

#endif

