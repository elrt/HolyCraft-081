// Batch 002. Source: minecraftpe/headers/nbt/NbtIo.hpp
#ifndef MCPE_HEADERS_NBT_NBTIO_HPP
#define MCPE_HEADERS_NBT_NBTIO_HPP
Tag *NbtIo_read(IDataInput *input) { Tag *tag=Tag_readNamedTag(input); if(!tag || Tag_getId(tag)!=10) { Tag_DeleteDeep(tag); return NULL; } return tag; }

#endif

