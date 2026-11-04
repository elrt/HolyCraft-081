// Batch 004. Source: minecraftpe/headers/compression.hpp
#ifndef MCPE_HEADERS_COMPRESSION_HPP
#define MCPE_HEADERS_COMPRESSION_HPP
I32 compression_gzip_compressFile(U0 *source,U0 *dest,I32 level);
I32 compression_gzip_decompressFile(U0 *source,U0 *dest);
Bool compression_gzip_compress(MCString *source,MCString *dest,I32 level);
Bool compression_gzip_decompress(MCString *source,MCString *dest);

#endif

