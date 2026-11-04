// Port batch 001. Upstream: minecraftpe/impl/util/Color4.cpp
// API: explicit self pointers; see docs/PORTING.md.
Color4 Color4_WHITE={1,1,1,1},Color4_GREY={0.5,0.5,0.5,1},Color4_BLACK={0,0,0,1};
Color4 Color4_RED={1,0,0,1},Color4_GREEN={0,1,0,1},Color4_BLUE={0,0,1,1},Color4_NIL={0,0,0,0};
U0 Color4_fromHSB(F32 h,F32 s,F32 b,Color4 *out) {
 F32 v7,v8,v9,v10,v11;
 if(s!=0) {
  v7=(h-floorf(h))*6.0; v8=floorf(v7);
  v9=b*(1.0-s*(v7-v8)); v10=b*(1.0-s); v11=b*(1.0-s*(1.0-(v7-v8)));
  switch(v7(I32)) {
   case 0: Color4_Init(out,b,v11,v10,1); return;
   case 1: Color4_Init(out,v9,b,v10,1); return;
   case 2: Color4_Init(out,v10,b,v11,1); return;
   case 3: Color4_Init(out,v10,v9,b,1); return;
   case 4: Color4_Init(out,v11,v10,b,1); return;
   case 5: Color4_Init(out,b,v10,v9,1); return;
   default: Color4_Init(out,0,0,0,0); return;
  }
 }
 Color4_Init(out,b,b,b,1);
}
