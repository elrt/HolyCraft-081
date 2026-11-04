// Port batch 001. Upstream: minecraftpe/impl/util/Common.cpp
// API: explicit self pointers; see docs/PORTING.md.
U0 Common_getGameVersionStringNet(MCString *out) { MCString_FromBytes(out,"0.8.1",5); }
U0 Common_getGameVersionString(MCString *out) { MCString_FromBytes(out,"v0.8.1 alpha",12); }
