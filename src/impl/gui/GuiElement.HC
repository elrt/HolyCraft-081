U0 GuiElement_Init(GuiElement *s,MCGuiHost011 *h,Bool active,Bool visible,I32 x,I32 y,I32 w,I32 height){memset(s,0,sizeof(GuiElement));s->host=h;s->active=active;s->visible=visible;s->x=x;s->y=y;s->width=w;s->height=height;}
U0 GuiElement_clearBackground(GuiElement *s){if(s->patch)s->host->patchDestroy(s->host->host,s->patch);s->patch=NULL;s->color=0;}
U0 GuiElement_setActiveAndVisibility(GuiElement *s,Bool active,Bool visible){s->active=active;s->visible=visible;}
U0 GuiElement_setBackground(GuiElement *s,U8 *path,IntRectangle *rect,I32 a,I32 b){GuiElement_clearBackground(s);s->patch=s->host->patchCreate(s->host->host,path,rect,a,b,s->width,s->height);}
U0 GuiElement_setBackgroundColor(GuiElement *s,U32 color){GuiElement_clearBackground(s);s->color=color;}U0 GuiElement_setVisible(GuiElement *s,Bool visible){s->visible=visible;}
Bool GuiElement_pointInside(GuiElement *s,I32 x,I32 y){return x>=s->x && x<=s->x+s->width && y>=s->y && y<s->y+s->height;}
U0 GuiElement_render(GuiElement *s){MCGuiHost011 *h=s->host;if(s->color)h->fill(h->host,s->x,s->y,s->x+s->width,s->y+s->height,s->color);else if(s->patch){h->patchSize(h->host,s->patch,s->width,s->height);h->patchDraw(h->host,s->patch,s->x,s->y);}}
U0 GuiElement_Destroy(GuiElement *s){GuiElement_clearBackground(s);}

U0 GuiElement_setActiveAndVisibilityBoth(GuiElement *s,Bool b){GuiElement_setActiveAndVisibility(s,b,b);}
