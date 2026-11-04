U0 GuiElementContainer_Init(GuiElementContainer *s,MCGuiHost011 *h,Bool active,Bool visible,I32 x,I32 y,I32 w,I32 height){GuiElement_Init(&s->base,h,active,visible,x,y,w,height);MCPtrVector_Init(&s->children);s->oldX=x;s->oldY=y;}
U0 GuiElementContainer_addChild(GuiElementContainer *s,MCGuiChild011 *c){c->element->x+=s->base.x;c->element->y+=s->base.y;c->retain(c->context);MCPtrVector_Push(&s->children,c);}
U0 GuiElementContainer_removeChild(GuiElementContainer *s,MCGuiChild011 *c){I64 i,j;for(i=0;i<s->children.size;i++)if(s->children.data[i]==c){for(j=i;j+1<s->children.size;j++)s->children.data[j]=s->children.data[j+1];s->children.size--;c->release(c->context);return;}}
U0 GuiElementContainer_clearAll(GuiElementContainer *s){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->release(c->context);}s->children.size=0;}
U0 GuiElementContainer_Destroy(GuiElementContainer *s){GuiElementContainer_clearAll(s);MCPtrVector_Destroy(&s->children);GuiElement_Destroy(&s->base);}
U0 GuiElementContainer_tick(GuiElementContainer *s){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->tick(c->context);}}
U0 GuiElementContainer_render(GuiElementContainer *s,I32 x,I32 y){I64 i;MCGuiChild011 *c;GuiElement_render(&s->base);for(i=0;i<s->children.size;i++){c=s->children.data[i];c->render(c->context,x,y);}}
U0 GuiElementContainer_topRender(GuiElementContainer *s,I32 x,I32 y){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->topRender(c->context,x,y);}}
U0 GuiElementContainer_setupPositions(GuiElementContainer *s){I64 i;MCGuiChild011 *c;I32 dx=s->base.x-s->oldX,dy=s->base.y-s->oldY;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->element->x+=dx;c->element->y+=dy;c->setup(c->context);}s->oldX=s->base.x;s->oldY=s->base.y;}
U0 GuiElementContainer_mouseClicked(GuiElementContainer *s,I32 x,I32 y,I32 b){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->mouseClicked(c->context,x,y,b);}}
U0 GuiElementContainer_mouseReleased(GuiElementContainer *s,I32 x,I32 y,I32 b){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->mouseReleased(c->context,x,y,b);}}
U0 GuiElementContainer_focusuedMouseClicked(GuiElementContainer *s,I32 x,I32 y,I32 b){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->focusedClicked(c->context,x,y,b);}}
U0 GuiElementContainer_focusuedMouseReleased(GuiElementContainer *s,I32 x,I32 y,I32 b){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->focusedReleased(c->context,x,y,b);}}
U0 GuiElementContainer_keyPressed(GuiElementContainer *s,I32 key){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->keyPressed(c->context,key);}}
U0 GuiElementContainer_keyboardNewChar(GuiElementContainer *s,U8 *text,Bool b){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->newChar(c->context,text,b);}}
Bool GuiElementContainer_backPressed(GuiElementContainer *s,Bool b){I64 i;MCGuiChild011 *c;Bool result=FALSE;for(i=0;i<s->children.size;i++){c=s->children.data[i];if(c->back(c->context,b))result=TRUE;}return result;}
Bool GuiElementContainer_suppressOtherGUI(GuiElementContainer *s){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];if(c->suppress(c->context))return TRUE;}return FALSE;}
U0 GuiElementContainer_setTextboxText(GuiElementContainer *s,U8 *text){I64 i;MCGuiChild011 *c;for(i=0;i<s->children.size;i++){c=s->children.data[i];c->setText(c->context,text);}}
