class GuiElement {Bool active,visible;I32 x,y,width,height;U32 color;U0 *patch;F32 zLayer;MCGuiHost011 *host;};
U0 GuiElement_Init(GuiElement *,MCGuiHost011 *,Bool,Bool,I32,I32,I32,I32);U0 GuiElement_clearBackground(GuiElement *);U0 GuiElement_setActiveAndVisibility(GuiElement *,Bool,Bool);U0 GuiElement_setBackground(GuiElement *,U8 *,IntRectangle *,I32,I32);U0 GuiElement_setBackgroundColor(GuiElement *,U32);U0 GuiElement_setVisible(GuiElement *,Bool);Bool GuiElement_pointInside(GuiElement *,I32,I32);U0 GuiElement_render(GuiElement *);U0 GuiElement_Destroy(GuiElement *);

U0 GuiElement_setActiveAndVisibilityBoth(GuiElement *,Bool);
