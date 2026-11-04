#ifndef MCPE_BATCH004_NATIVE
#define MCPE_BATCH004_NATIVE
#link <z>
extern "c" I32 usleep(U32 usec);
extern "c" I64 time(I64 *out);
extern "c" I32 remove(U8 *path);
extern "c" U0 *opendir(U8 *path);
extern "c" U0 *readdir(U0 *directory);
extern "c" I32 closedir(U0 *directory);
extern "c" I32 snprintf(U8 *out,U64 size,U8 *format,...);
extern "c" U64 fread(U0 *out,U64 size,U64 count,U0 *file);
extern "c" U64 fwrite(U0 *data,U64 size,U64 count,U0 *file);
extern "c" I32 feof(U0 *file);
extern "c" I32 ferror(U0 *file);
class MCNativeDirent { U64 ino;I64 offset;U16 recordLength;U8 type;U8 name[256]; };
// z_stream layout for x86_64 glibc; ABI sizes/offsets verified by native probe.
class MCZStream { U8 *next_in;U32 avail_in;U64 total_in;U8 *next_out;U32 avail_out;U64 total_out;U8 *msg;U0 *state,*zalloc,*zfree,*opaque;I32 data_type;U64 adler,reserved; };
extern "c" U8 *zlibVersion();
extern "c" I32 deflateInit_(MCZStream *stream,I32 level,U8 *version,I32 size);
extern "c" I32 deflate(MCZStream *stream,I32 flush);
extern "c" I32 deflateEnd(MCZStream *stream);
extern "c" I32 inflateInit_(MCZStream *stream,U8 *version,I32 size);
extern "c" I32 inflate(MCZStream *stream,I32 flush);
extern "c" I32 inflateEnd(MCZStream *stream);
#endif
