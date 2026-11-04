/*
 *  Copyright (c) 2009 Public Software Group e. V., Berlin, Germany
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.
 */


// HolyC source translation; Unicode 1.1.5 tables from this archive, not system Unicode.
#define UTF8PROC_H
#define UTF8PROC_NULLTERM  (1<<0)
#define UTF8PROC_STABLE    (1<<1)
#define UTF8PROC_COMPAT    (1<<2)
#define UTF8PROC_COMPOSE   (1<<3)
#define UTF8PROC_DECOMPOSE (1<<4)
#define UTF8PROC_IGNORE    (1<<5)
#define UTF8PROC_REJECTNA  (1<<6)
#define UTF8PROC_NLF2LS    (1<<7)
#define UTF8PROC_NLF2PS    (1<<8)
#define UTF8PROC_NLF2LF    (UTF8PROC_NLF2LS | UTF8PROC_NLF2PS)
#define UTF8PROC_STRIPCC   (1<<9)
#define UTF8PROC_CASEFOLD  (1<<10)
#define UTF8PROC_CHARBOUND (1<<11)
#define UTF8PROC_LUMP      (1<<12)
#define UTF8PROC_STRIPMARK (1<<13)
#define UTF8PROC_ERROR_NOMEM -1
#define UTF8PROC_ERROR_OVERFLOW -2
#define UTF8PROC_ERROR_INVALIDUTF8 -3
#define UTF8PROC_ERROR_NOTASSIGNED -4
#define UTF8PROC_ERROR_INVALIDOPTS -5
#define UTF8PROC_CATEGORY_LU  1
#define UTF8PROC_CATEGORY_LL  2
#define UTF8PROC_CATEGORY_LT  3
#define UTF8PROC_CATEGORY_LM  4
#define UTF8PROC_CATEGORY_LO  5
#define UTF8PROC_CATEGORY_MN  6
#define UTF8PROC_CATEGORY_MC  7
#define UTF8PROC_CATEGORY_ME  8
#define UTF8PROC_CATEGORY_ND  9
#define UTF8PROC_CATEGORY_NL 10
#define UTF8PROC_CATEGORY_NO 11
#define UTF8PROC_CATEGORY_PC 12
#define UTF8PROC_CATEGORY_PD 13
#define UTF8PROC_CATEGORY_PS 14
#define UTF8PROC_CATEGORY_PE 15
#define UTF8PROC_CATEGORY_PI 16
#define UTF8PROC_CATEGORY_PF 17
#define UTF8PROC_CATEGORY_PO 18
#define UTF8PROC_CATEGORY_SM 19
#define UTF8PROC_CATEGORY_SC 20
#define UTF8PROC_CATEGORY_SK 21
#define UTF8PROC_CATEGORY_SO 22
#define UTF8PROC_CATEGORY_ZS 23
#define UTF8PROC_CATEGORY_ZL 24
#define UTF8PROC_CATEGORY_ZP 25
#define UTF8PROC_CATEGORY_CC 26
#define UTF8PROC_CATEGORY_CF 27
#define UTF8PROC_CATEGORY_CS 28
#define UTF8PROC_CATEGORY_CO 29
#define UTF8PROC_CATEGORY_CN 30
#define UTF8PROC_BIDI_CLASS_L    1
#define UTF8PROC_BIDI_CLASS_LRE  2
#define UTF8PROC_BIDI_CLASS_LRO  3
#define UTF8PROC_BIDI_CLASS_R    4
#define UTF8PROC_BIDI_CLASS_AL   5
#define UTF8PROC_BIDI_CLASS_RLE  6
#define UTF8PROC_BIDI_CLASS_RLO  7
#define UTF8PROC_BIDI_CLASS_PDF  8
#define UTF8PROC_BIDI_CLASS_EN   9
#define UTF8PROC_BIDI_CLASS_ES  10
#define UTF8PROC_BIDI_CLASS_ET  11
#define UTF8PROC_BIDI_CLASS_AN  12
#define UTF8PROC_BIDI_CLASS_CS  13
#define UTF8PROC_BIDI_CLASS_NSM 14
#define UTF8PROC_BIDI_CLASS_BN  15
#define UTF8PROC_BIDI_CLASS_B   16
#define UTF8PROC_BIDI_CLASS_S   17
#define UTF8PROC_BIDI_CLASS_WS  18
#define UTF8PROC_BIDI_CLASS_ON  19
#define UTF8PROC_DECOMP_TYPE_FONT      1
#define UTF8PROC_DECOMP_TYPE_NOBREAK   2
#define UTF8PROC_DECOMP_TYPE_INITIAL   3
#define UTF8PROC_DECOMP_TYPE_MEDIAL    4
#define UTF8PROC_DECOMP_TYPE_FINAL     5
#define UTF8PROC_DECOMP_TYPE_ISOLATED  6
#define UTF8PROC_DECOMP_TYPE_CIRCLE    7
#define UTF8PROC_DECOMP_TYPE_SUPER     8
#define UTF8PROC_DECOMP_TYPE_SUB       9
#define UTF8PROC_DECOMP_TYPE_VERTICAL 10
#define UTF8PROC_DECOMP_TYPE_WIDE     11
#define UTF8PROC_DECOMP_TYPE_NARROW   12
#define UTF8PROC_DECOMP_TYPE_SMALL    13
#define UTF8PROC_DECOMP_TYPE_SQUARE   14
#define UTF8PROC_DECOMP_TYPE_FRACTION 15
#define UTF8PROC_DECOMP_TYPE_COMPAT   16
#define SSIZE_MAX 0x7FFFFFFFFFFFFFFF
class utf8proc_property_t {I16 category,combining_class,bidi_class,decomp_type;I32 *decomp_mapping;U32 bidi_mirrored;I32 uppercase_mapping,lowercase_mapping,titlecase_mapping,comb1st_index,comb2nd_index;U32 comp_exclusion,ignorable,control_boundary,extend;I32 *casefold_mapping;};
U8 *utf8proc_version();U8 *utf8proc_errmsg(I64 errcode);I64 utf8proc_iterate(U8 *str,I64 length,I32 *dst);Bool utf8proc_codepoint_valid(I32 uc);I64 utf8proc_encode_char(I32 uc,U8 *dst);utf8proc_property_t *utf8proc_get_property(I32 uc);I64 utf8proc_decompose_char(I32 uc,I32 *dst,I64 size,I32 options,I32 *last);I64 utf8proc_decompose(U8 *str,I64 length,I32 *dst,I64 size,I32 options);I64 utf8proc_reencode(I32 *buffer,I64 length,I32 options);I64 utf8proc_map(U8 *str,I64 length,U8 **dst,I32 options);U8 *utf8proc_NFD(U8*);U8 *utf8proc_NFC(U8*);U8 *utf8proc_NFKD(U8*);U8 *utf8proc_NFKC(U8*);

extern "c" U0 *realloc(U0 *pointer,U64 size);
