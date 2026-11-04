// Port batch 001. Upstream: minecraftpe/impl/util/SharedConstants.cpp
// API: explicit self pointers; see docs/PORTING.md.
I32 SharedConstants_getVersionCode4(I32 a,I32 b,I32 c,I32 d) { return 100000*b+10000000*a+1000*c+d; }
I32 SharedConstants_getVersionCode() { return SharedConstants_getVersionCode4(0,8,1,0); }
Bool SharedConstants_isVersion(I32 a,I32 b,I32 c,I32 d) { if(a) return FALSE; if(b==8 && c==1) return d==0; return FALSE; }
