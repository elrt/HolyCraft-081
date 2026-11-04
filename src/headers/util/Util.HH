// Batch 017. Source: minecraftpe/headers/util/Util.hpp
// std::string -> MCString (caller-owned outputs); std::vector<std::string> -> MCVector of MCString;
// std::function callback -> function pointer plus context.
#ifndef MCPE_HEADERS_UTIL_UTIL_HPP
#define MCPE_HEADERS_UTIL_UTIL_HPP
MCString Util_EMPTY_STRING;
Bool Util_startsWith(MCString *a1,MCString *a2);
U0 Util_getExtension(MCString *out,MCString *a2);
Bool Util_endsWith(MCString *str,MCString *end);
MCString *Util_stringReplace(MCString *a1,MCString *a2,MCString *a3,I32 a4);
I32 Util_hashCode(MCString *s);
U0 Util_removeAll(MCString *a1,U8 **a2,I32 a3);
I32 Util_utf8len(MCString *a1);
U0 Util_utf8substring(MCString *out,MCString *a2,I32 start,I32 end);
U0 Util_simpleFormat(MCString *out,MCString *a2,MCVector *a3);
U0 Util_toStringInt(MCString *out,I32 i);
U0 Util_toStringFloat(MCString *out,F32 i);
U0 Util_toLower(MCString *out,MCString *s);
Bool Util_compareNoCase(MCString *a,MCString *b);
U0 Util_stringSplit(MCString *s,I32 a2,F32 *a3,U0 *ctx,U0 (*onSplit)(U0 *ctx,MCString *part,F32 width));
U0 Util_stringTrimWith(MCString *out,MCString *a2,MCString *a3,Bool a4,Bool a5);
U0 Util_stringTrim(MCString *out,MCString *a2);
#endif
