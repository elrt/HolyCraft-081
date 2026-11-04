// _types.h compatibility policy: use HolyC's fixed-width U8/I8/I32/U64/Bool built-ins.
// C++ attributes and Android debug-varargs macros do not have a HolyC binary ABI.
#define MC027_HOLYC_TYPES 1
Bool MC027_TypeSizes(){return sizeof(U8)==1 && sizeof(I16)==2 && sizeof(I32)==4 && sizeof(I64)==8 && sizeof(F32)==4;}
