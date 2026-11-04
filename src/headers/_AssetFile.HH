// Batch 002. Source: minecraftpe/headers/_AssetFile.hpp
#ifndef MCPE_HEADERS__ASSETFILE_HPP
#define MCPE_HEADERS__ASSETFILE_HPP
class AssetFile { U8 *bytes; I32 length; };
U0 AssetFile_Init(AssetFile *self,U8 *bytes,I32 length) { self->bytes=bytes; self->length=length; }

#endif

