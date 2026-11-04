// Partial stbi-compatible API: PNG via native libpng16, TGA/BMP paths in HolyC.
// NOT a complete HolyC translation of stb_image.c (JPEG/GIF/PSD/PIC/HDR absent).
#link <png16>
class MCPngImage027 {U0 *opaque;U32 version,width,height,format,flags,colormap_entries,warning_or_error;U8 message[64];};
extern "c" I32 png_image_begin_read_from_memory(MCPngImage027*,U0*,U64);
extern "c" I32 png_image_finish_read(MCPngImage027*,U0*,U0*,I32,U0*);
extern "c" U0 png_image_free(MCPngImage027*);
U8 *stbi_load_from_memory(U8 *data,I32 size,I32 *x,I32 *y,I32 *components,I32 requested);
U8 *stbi_load(U8 *path,I32 *x,I32 *y,I32 *components,I32 requested);
U0 stbi_image_free(U0 *pixels);U8 *stbi_failure_reason();
I32 stbi_info_from_memory(U8 *data,I32 size,I32 *x,I32 *y,I32 *components);
