#ifndef MCPE_BATCH003_FILE_ABI
#define MCPE_BATCH003_FILE_ABI
extern "c" U0 *fopen(U8 *path,U8 *mode);
extern "c" I32 fclose(U0 *file);
extern "c" I64 ftell(U0 *file);
extern "c" I32 fseek(U0 *file,I64 offset,I32 whence);
extern "c" I32 access(U8 *path,I32 mode);
extern "c" I32 mkdir(U8 *path,U32 mode);
extern "c" I32 *__errno_location();
extern "c" U8 *fgets(U8 *line,I32 size,U0 *file);
extern "c" I32 fputs(U8 *line,U0 *file);
extern "c" I64 strtol(U8 *str,U8 **end,I32 base);
#endif
