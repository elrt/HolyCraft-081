// Batch022: gui/GuiComponent; explicit host ABI, see docs/BATCH022.md.
class GuiComponent022 {F32 zLayer;MC022DrawHost *host;};
U0 GuiComponent022_Init(GuiComponent022*,MC022DrawHost*);
U0 GuiComponent022_blit(GuiComponent022*,F32,F32,I32,I32,F32,F32,I32,I32);
U0 GuiComponent022_fill(GuiComponent022*,F32,F32,F32,F32,U32);
U0 GuiComponent022_gradient(GuiComponent022*,F32,F32,F32,F32,U32,U32,Bool);
U0 GuiComponent022_drawRect(GuiComponent022*,I32,I32,I32,I32,U32,U32,U32,U32,I32);

U0 MC022_V(MC022Vertex*,F32,F32,F32,F32,F32,U32);
