// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class Font {I32 charWidths[256];F32 charLength[256];U8 *glyphSizes;I32 lineHeight;};

U0 Font_Init(Font *s,U8 *atlas,I32 width,I32 height,U8 *glyphs);
I32 Font_charWidth(Font *s,I32 cp,Bool unicode);
I32 MC024_UTF8(U8 **p);
Bool Font_containsUnicodeChar(U8 *text);
I32 Font_width(Font *s,U8 *text);
F32 Font_getPixelLength(Font *s,U8 *text);
F32 Font_buildChar(Font *s,Tesselator *t,I32 cp,F32 x,F32 y,Bool unicode);
