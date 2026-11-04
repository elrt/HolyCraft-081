// Batch 005. Source: minecraftpe/impl/tile/BookshelfTile.cpp
U0 BookshelfTile_Init(BookshelfTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->uv=MCBlock_UV("planks",0); }
TextureUVCoordinateSet * BookshelfTile_getTexture(BookshelfTile *self,I32 side) { if(side>1)return &self->textureUV;return &self->uv; }
I32 BookshelfTile_getResource(BookshelfTile *self,I32 data,Random *r) { return MC_blocks.book; }
I32 BookshelfTile_getResourceCount(BookshelfTile *self,Random *r) { return 3; }
U0 BookshelfTile_Destroy(BookshelfTile *self) { MCBlock_Destroy(self); }

