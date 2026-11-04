// Batch029 GUI core: faithful re-implementation of the MCPE 0.8.1 Touch GUI drawing primitives
// (GuiComponent, Font, NinePatchLayer, Touch::TButton, Touch::THeader, ImageWithBackground,
// CategoryButton, ItemRenderer::renderGuiItemNew, Screen backgrounds) on top of the APK textures.
class MCTex029 {U32 id;I32 w,h;};
class MCPatch029 {MCTex029 *t;F32 u[4],v[4];F32 a,b;};
class MCButton029 {I32 id,kind,x,y,w,h;Bool active,visible,highlight;U8 text[64];MCTex029 *img;I32 iu,iv,iw,ih,dw,dh,xo,yo;MCPatch029 *normal,*down;};
MCTex029 g29_texGui,g29_texGui2,g29_texTouch,g29_texTouch2,g29_texSprite,g29_texTitle,g29_texBg,g29_texIcons,g29_texFrame,g29_texFont,g29_texItems,g29_texTerrain;
MCTex029 g29_texPano[6];
F32 g29_charLen[256];I32 g29_charW[256];
I32 g29_W=1280,g29_H=720,g29_gw=320,g29_gh=180,g29_scale=4;F32 g29_inv=0.25,g29_ppm=3.78,g29_density=3.78;
I32 g29_mx=-1000,g29_my=-1000,g29_pressId=-1;Bool g29_mouseDown=FALSE;
F32 g29_btnScale[64];
MCPatch029 g29_pBtn,g29_pBtnDown,g29_pFrame,g29_pSetBg,g29_pSetBgDown,g29_pTab,g29_pTabL,g29_pTab3,g29_pListBg,g29_pListRow;
MCButton029 g29_btn[48];I32 g29_btnN=0;
F64 g29_frameSec=0.016,g29_panoTime=0,g29_splashTime=0;

U0 MC029_ScanFont(U8 *px,I32 w){I32 c,col,row,last,base;for(c=0;c<256;c++){base=8*(c%16)+w*8*(c/16);last=-1;for(col=7;col>=0;col--){for(row=0;row<8;row++)if(px[4*(base+col+row*w)])last=col;if(last>=0)break;}if(c==32)last=2;g29_charW[c]=last+2;g29_charLen[c]=last+2;}}
Bool MC029_LoadTex(MCTex029 *t,U8 *path,Bool repeat,Bool linear,Bool font){I32 w,h,n;U8 *px=stbi_load(path,&w,&h,&n,4);if(!px){printf("Texture load failed: %s\n",path);return FALSE;}if(font)MC029_ScanFont(px,w);U32 id;hcgl028_glGenTextures(1,&id);hcgl028_glBindTexture(0xDE1,id);I32 filter=0x2600;if(linear)filter=0x2601;hcgl028_glTexParameteri(0xDE1,0x2801,filter);hcgl028_glTexParameteri(0xDE1,0x2800,filter);I32 wrap=0x812F;if(repeat)wrap=0x2901;hcgl028_glTexParameteri(0xDE1,0x2802,wrap);hcgl028_glTexParameteri(0xDE1,0x2803,wrap);hcgl028_glPixelStorei(0xCF5,1);hcgl028_glTexImage2D(0xDE1,0,0x1908,w,h,0,0x1908,0x1401,px);stbi_image_free(px);t->id=id;t->w=w;t->h=h;return TRUE;}
U0 MC029_PatchInit(MCPatch029 *p,MCTex029 *t,I32 x,I32 y,I32 w,I32 h,I32 a,I32 b){p->t=t;F32 tw=t->w,th=t->h;if(tw<1)tw=1;if(th<1)th=1;p->u[0]=x/tw;p->u[1]=(x+a)/tw;p->u[2]=(x+w-a)/tw;p->u[3]=(x+w)/tw;p->v[0]=y/th;p->v[1]=(y+b)/th;p->v[2]=(y+h-b)/th;p->v[3]=(y+h)/th;p->a=a;p->b=b;}
Bool MC029_GuiInit(MCApp028 *s){Bool ok=TRUE;
 ok=ok && MC029_LoadTex(&g29_texGui,"assets/029/gui.png",FALSE,FALSE,FALSE);ok=ok && MC029_LoadTex(&g29_texGui2,"assets/029/gui2.png",FALSE,FALSE,FALSE);
 ok=ok && MC029_LoadTex(&g29_texTouch,"assets/029/touchgui.png",FALSE,FALSE,FALSE);ok=ok && MC029_LoadTex(&g29_texTouch2,"assets/029/touchgui2.png",FALSE,FALSE,FALSE);
 ok=ok && MC029_LoadTex(&g29_texSprite,"assets/029/spritesheet.png",FALSE,FALSE,FALSE);ok=ok && MC029_LoadTex(&g29_texTitle,"assets/029/title.png",FALSE,FALSE,FALSE);
 ok=ok && MC029_LoadTex(&g29_texBg,"assets/029/background.png",TRUE,FALSE,FALSE);ok=ok && MC029_LoadTex(&g29_texIcons,"assets/029/icons.png",FALSE,FALSE,FALSE);
 ok=ok && MC029_LoadTex(&g29_texFrame,"assets/029/itemframe.png",FALSE,FALSE,FALSE);ok=ok && MC029_LoadTex(&g29_texFont,"assets/029/default8.png",FALSE,FALSE,TRUE);
 U8 path[64];I32 i;for(i=0;i<6;i++){sprintf(path,"assets/029/panorama_%d.png",i);ok=ok && MC029_LoadTex(&g29_texPano[i],path,FALSE,TRUE,FALSE);}
 if(!ok)return FALSE;g29_texItems.id=s->itemTex;g29_texItems.w=256;g29_texItems.h=256;g29_texTerrain.id=s->terrainTex;g29_texTerrain.w=512;g29_texTerrain.h=256;
 MC029_PatchInit(&g29_pBtn,&g29_texSprite,8,32,8,8,2,2);MC029_PatchInit(&g29_pBtnDown,&g29_texSprite,0,32,8,8,2,2);MC029_PatchInit(&g29_pFrame,&g29_texSprite,34,43,14,14,3,3);
 MC029_PatchInit(&g29_pSetBg,&g29_texSprite,112,0,8,67,2,2);MC029_PatchInit(&g29_pSetBgDown,&g29_texSprite,120,0,8,67,2,2);MC029_PatchInit(&g29_pTab,&g29_texSprite,49,43,14,14,2,2);
 MC029_PatchInit(&g29_pTabL,&g29_texSprite,65,55,14,14,2,2);MC029_PatchInit(&g29_pTab3,&g29_texSprite,49,43,14,14,3,3);MC029_PatchInit(&g29_pListBg,&g29_texSprite,0,53,3,4,1,1);MC029_PatchInit(&g29_pListRow,&g29_texSprite,0,54,3,3,1,1);
 for(i=0;i<64;i++)g29_btnScale[i]=1;return hcgl028_glGetError()==0;}

// ---- GuiComponent ----
U0 MC029_Color(U32 c){hcgl028_glColor4ub((c>>16)&255,(c>>8)&255,c&255,(c>>24)&255);}
U0 MC029_White(){hcgl028_glColor4f(1,1,1,1);}
U0 MC029_Bind(MCTex029 *t){hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,t->id);}
U0 MC029_Fill(F32 x0,F32 y0,F32 x1,F32 y1,U32 c){hcgl028_glDisable(0xDE1);MC029_Color(c);hcgl028_glBegin(7);hcgl028_glVertex3f(x0,y1,0);hcgl028_glVertex3f(x1,y1,0);hcgl028_glVertex3f(x1,y0,0);hcgl028_glVertex3f(x0,y0,0);hcgl028_glEnd();hcgl028_glEnable(0xDE1);}
U0 MC029_Gradient(F32 x0,F32 y0,F32 x1,F32 y1,U32 a,U32 b){hcgl028_glDisable(0xDE1);hcgl028_glBegin(7);MC029_Color(a);hcgl028_glVertex3f(x1,y0,0);hcgl028_glVertex3f(x0,y0,0);MC029_Color(b);hcgl028_glVertex3f(x0,y1,0);hcgl028_glVertex3f(x1,y1,0);hcgl028_glEnd();hcgl028_glEnable(0xDE1);}
U0 MC029_DrawRect(F32 x0,F32 y0,F32 x1,F32 y1,U32 c,F32 t){MC029_Fill(x0,y0,x1,y0+t,c);MC029_Fill(x0,y1-t,x1,y1,c);MC029_Fill(x0,y0,x0+t,y1,c);MC029_Fill(x1-t,y0,x1,y1,c);}
// GuiComponent::blit: UV always divided by 256 (0.0039062); uw/vh==0 means same as w/h.
U0 MC029_Blit(MCTex029 *t,F32 x,F32 y,F32 u,F32 v,F32 w,F32 h,F32 uw,F32 vh){if(uw==0)uw=w;if(vh==0)vh=h;MC029_Bind(t);F32 u0=u*0.0039062,u1=(u+uw)*0.0039062,v0=v*0.0039062,v1=(v+vh)*0.0039062;hcgl028_glBegin(7);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(x,y+h,0);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(x+w,y+h,0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(x+w,y,0);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(x,y,0);hcgl028_glEnd();}
U0 MC029_BlitUV(MCTex029 *t,F32 x,F32 y,F32 w,F32 h,F32 u0,F32 v0,F32 u1,F32 v1){MC029_Bind(t);hcgl028_glBegin(7);hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(x,y+h,0);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(x+w,y+h,0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(x+w,y,0);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(x,y,0);hcgl028_glEnd();}
U0 MC029_Patch(MCPatch029 *p,F32 x,F32 y,F32 w,F32 h){MC029_Bind(p->t);F32 xs[4],ys[4];xs[0]=x;xs[1]=x+p->a;xs[2]=x+w-p->a;xs[3]=x+w;ys[0]=y;ys[1]=y+p->b;ys[2]=y+h-p->b;ys[3]=y+h;I32 r,c;hcgl028_glBegin(7);for(r=0;r<3;r++)for(c=0;c<3;c++){hcgl028_glTexCoord2f(p->u[c],p->v[r+1]);hcgl028_glVertex3f(xs[c],ys[r+1],0);hcgl028_glTexCoord2f(p->u[c+1],p->v[r+1]);hcgl028_glVertex3f(xs[c+1],ys[r+1],0);hcgl028_glTexCoord2f(p->u[c+1],p->v[r]);hcgl028_glVertex3f(xs[c+1],ys[r],0);hcgl028_glTexCoord2f(p->u[c],p->v[r]);hcgl028_glVertex3f(xs[c],ys[r],0);}hcgl028_glEnd();}

// ---- Font (images/font/default8.png, widths from the R channel exactly like Font::init) ----
I32 MC029_Utf8(U8 *s,I32 *i){I32 c=s[*i];if(c<0x80){*i+=1;return c;}if((c&0xE0)==0xC0 && s[*i+1]!=0){I32 r=((c&31)<<6)|(s[*i+1]&63);*i+=2;return r;}if((c&0xF0)==0xE0 && s[*i+1]!=0 && s[*i+2]!=0){*i+=3;return 0x3F;}*i+=1;return 0x3F;}
I32 MC029_Width(U8 *s){I32 best=0,cur=0,i=0;while(s[i]){I32 c=MC029_Utf8(s,&i);if(c==10){if(best<cur)best=cur;cur=0;continue;}if(c==32)cur+=4;else if(c<256)cur+=g29_charW[c];}if(cur<best)return best;return cur;}
F32 MC029_PixelLength(U8 *s){F32 r=0;I32 i;for(i=0;s[i];i++)r+=g29_charLen[s[i]];return r;}
U0 MC029_DrawText(U8 *s,F32 x,F32 y,U32 col,Bool shadow){if(!s)return;if(shadow)col=(col&0xff000000)+((col&0xfcfcfc)>>2);I32 alpha=(col>>24)&255;if(!alpha)alpha=255;MC029_Bind(&g29_texFont);hcgl028_glColor4ub((col>>16)&255,(col>>8)&255,col&255,alpha);hcgl028_glBegin(7);F32 cx=0,cy=0;I32 i=0;
 while(s[i]){I32 c=MC029_Utf8(s,&i);if(c==10){cx=0;cy+=10;continue;}if(c==32){cx+=4;continue;}if(c>255)c=0x3F;F32 u0=(16*(c&15))*0.0039062,u1=(16*(c&15)+15.99)*0.0039062,v0=(c&0xf0)*0.0039062,v1=((c&0xf0)+15.99)*0.0039062,x0=x+floorf(cx),x1=x+floorf(cx+8);
  hcgl028_glTexCoord2f(u0,v1);hcgl028_glVertex3f(x0,y+cy+8,0);hcgl028_glTexCoord2f(u1,v1);hcgl028_glVertex3f(x1,y+cy+8,0);hcgl028_glTexCoord2f(u1,v0);hcgl028_glVertex3f(x1,y+cy,0);hcgl028_glTexCoord2f(u0,v0);hcgl028_glVertex3f(x0,y+cy,0);cx+=g29_charLen[c];}
 hcgl028_glEnd();}
U0 MC029_Shadow(U8 *s,F32 x,F32 y,U32 col){MC029_DrawText(s,x+1,y+1,col,TRUE);MC029_DrawText(s,x,y,col,FALSE);}
U0 MC029_Centered(U8 *s,I32 x,I32 y,U32 col){I32 w=MC029_Width(s);MC029_Shadow(s,x-w/2,y,col);}
U0 MC029_Transformed(U8 *s,F32 x,F32 y,U32 col,F32 rot,F32 scale,Bool centered,F32 maxW){F32 len=MC029_PixelLength(s);if(len>maxW)scale*=maxW/len;hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,0);hcgl028_glScalef(scale,scale,scale);hcgl028_glRotatef(rot,0,0,1);if(centered)hcgl028_glTranslatef(-len*0.5,0,0);MC029_DrawText(s,1,1,col,TRUE);MC029_DrawText(s,0,0,col,FALSE);hcgl028_glPopMatrix();}
// Util::stringSplit + Font::drawWordWrap. Returns number of lines; draws when draw==TRUE.
I32 MC029_Wrap(U8 *s,F32 x,F32 y,I32 wrap,U32 col,Bool shadow,Bool draw){I32 n=strlen(s),start=0,space=-1,i,lines=0;F32 acc=0;U8 line[512];
 for(i=0;i<n;i++){I32 c=s[i];acc+=g29_charLen[c];if(c==32 || c==9)space=i;if(acc<=wrap && c!=10)continue;I32 len;if(c!=10){if(space>=start)i=space;else{i--;if(i<start)i=start;}len=i-start+1;}else len=i-start;if(len<0)len=0;if(len>511)len=511;memcpy(line,s+start,len);line[len]=0;if(draw && len){if(shadow)MC029_Shadow(line,x,y+lines*10,col);else MC029_DrawText(line,x,y+lines*10,col,FALSE);}lines++;start=i+1;space=-1;acc=0;}
 I32 len=n-start;if(len>511)len=511;if(len>0){memcpy(line,s+start,len);line[len]=0;if(draw){if(shadow)MC029_Shadow(line,x,y+lines*10,col);else MC029_DrawText(line,x,y+lines*10,col,FALSE);}lines++;}return lines;}

// ---- Buttons (Screen::mouseClicked/mouseReleased semantics: press inside -> pressed; release inside -> click) ----
Bool MC029_Inside(I32 x,I32 y,I32 w,I32 h){return g29_mx>=x && g29_my>=y && g29_mx<x+w && g29_my<y+h;}
MCButton029 *MC029_Add(I32 id,I32 kind,I32 x,I32 y,I32 w,I32 h,U8 *text){if(g29_btnN>=48)return &g29_btn[47];MCButton029 *b=&g29_btn[g29_btnN++];memset(b,0,sizeof(MCButton029));b->id=id;b->kind=kind;b->x=x;b->y=y;b->w=w;b->h=h;b->active=TRUE;b->visible=TRUE;if(text){strncpy(b->text,text,63);b->text[63]=0;}b->normal=&g29_pBtn;b->down=&g29_pBtnDown;return b;}
U0 MC029_SetImage(MCButton029 *b,MCTex029 *t,I32 u,I32 v,I32 uw,I32 vh,I32 dw,I32 dh){b->img=t;b->iu=u;b->iv=v;b->iw=uw;b->ih=vh;b->dw=dw;b->dh=dh;}
Bool MC029_BtnDown(MCButton029 *b){return b->active && g29_pressId==b->id && g29_mouseDown && MC029_Inside(b->x,b->y,b->w,b->h);}
U0 MC029_Header(I32 x,I32 y,I32 w,I32 h,U8 *text){MC029_White();MC029_Blit(&g29_texTouch,x,y,150,26,2,h-1,2,25);MC029_Blit(&g29_texTouch,x+2,y,153,26,w-3,h-1,8,25);MC029_Blit(&g29_texTouch,x+w-2,y,162,26,2,h-1,2,25);MC029_Blit(&g29_texTouch,x,y+h-1,153,52,w,3,8,3);MC029_Centered(text,x+w/2,y+(h-8)/2,0xe0e0e0);}
U0 MC029_RenderButton(MCButton029 *b){if(!b->visible || b->kind==6)return;Bool down=MC029_BtnDown(b);MC029_White();
 if(b->kind==2){MC029_Header(b->x,b->y,b->w,b->h,b->text);return;}
 if(b->kind==5){I32 yi=0;if(b->active){yi=1;if(down || b->highlight)yi=2;}I32 v=46+20*yi;MC029_Blit(&g29_texGui,b->x,b->y,0,v,b->w/2,b->h,0,20);MC029_Blit(&g29_texGui,b->x+b->w/2,b->y,200-b->w/2,v,b->w/2,b->h,0,20);U32 c=0xE0E0E0;if(!b->active)c=0xFFA0A0A0;else if(down || b->highlight)c=0xFFFFA0;MC029_Centered(b->text,b->x+b->w/2,b->y+(b->h-8)/2,c);return;}
 if(b->kind==1){if(down)MC029_Patch(b->down,b->x,b->y,b->w,b->h);else MC029_Patch(b->normal,b->x,b->y,b->w,b->h);U32 c=0xE0E0E0;if(!b->active)c=0xFFA0A0A0;else if(down || b->highlight)c=0xFFFFA0;MC029_Centered(b->text,b->x+b->w/2,b->y+(b->h-8)/2,c);return;}
 // kinds 3 (ImageWithBackground) and 4 (CategoryButton)
 if(down || b->highlight)MC029_Patch(b->down,b->x,b->y,b->w,b->h);else MC029_Patch(b->normal,b->x,b->y,b->w,b->h);
 if(b->img){I32 k=b->id&63;F32 sc=g29_btnScale[k];if(down){sc-=0.025;if(sc<=0.95)sc=0.95;}else{sc+=0.025;if(sc>=1)sc=1;}g29_btnScale[k]=sc;F32 cx=b->x+b->xo+b->dw*0.5+(b->w-b->dw)*0.5,cy=b->y+b->yo+b->dh*0.5+(b->h-b->dh)*0.5,hw=b->dw*0.5*sc,hh=b->dh*0.5*sc;
  if(b->active)MC029_White();else MC029_Color(0xff808080);F32 tw=b->img->w,th=b->img->h;MC029_BlitUV(b->img,cx-hw,cy-hh,hw*2,hh*2,b->iu/tw+0.001,b->iv/th+0.001,(b->iu+b->iw)/tw-0.001,(b->iv+b->ih)/th-0.001);}
 if(b->text[0]){I32 ty=b->y+(b->h-8)/2;if(!b->active)MC029_Centered(b->text,b->x+b->w/2,ty,0xFFA0A0A0);else if(down || b->highlight)MC029_Centered(b->text,b->x+b->w/2,ty,0xffffa0);else MC029_Centered(b->text,b->x+b->w/2,ty,0xe0e0e0);}}
U0 MC029_RenderButtons(){I32 i;for(i=0;i<g29_btnN;i++)MC029_RenderButton(&g29_btn[i]);}
I32 MC029_ButtonAt(){I32 i;for(i=g29_btnN-1;i>=0;i--){MCButton029 *b=&g29_btn[i];if(b->visible && b->active && b->kind!=2 && MC029_Inside(b->x,b->y,b->w,b->h))return b->id;}return -1;}
MCButton029 *MC029_Find(I32 id){I32 i;for(i=0;i<g29_btnN;i++)if(g29_btn[i].id==id)return &g29_btn[i];return NULL;}

// ---- Screen backgrounds ----
U0 MC029_DirtBackground(I32 vo){MC029_Bind(&g29_texBg);hcgl028_glColor4ub(0x40,0x40,0x40,255);F32 w=g29_gw,h=g29_gh,v=vo;hcgl028_glBegin(7);hcgl028_glTexCoord2f(0,v+h*0.03125);hcgl028_glVertex3f(0,h,0);hcgl028_glTexCoord2f(w*0.03125,v+h*0.03125);hcgl028_glVertex3f(w,h,0);hcgl028_glTexCoord2f(w*0.03125,v);hcgl028_glVertex3f(w,0,0);hcgl028_glTexCoord2f(0,v);hcgl028_glVertex3f(0,0,0);hcgl028_glEnd();MC029_White();}
U0 MC029_Perspective(F32 fovy,F32 aspect,F32 n,F32 f){F32 m[16];memset(m,0,sizeof(m));F32 t=1/tan(fovy*3.14159265/360);m[0]=t/aspect;m[5]=t;m[10]=(f+n)/(n-f);m[11]=-1;m[14]=2*f*n/(n-f);hcgl028_glLoadMatrixf(m);}
U0 MC029_MenuBackground(){g29_panoTime+=g29_frameSec*30;F32 t=g29_panoTime;hcgl028_glDisable(0xBE2);hcgl028_glDisable(0xB44);hcgl028_glDisable(0xB71);hcgl028_glMatrixMode(0x1701);hcgl028_glPushMatrix();MC029_Perspective(120,1,0.05,10);hcgl028_glMatrixMode(0x1700);hcgl028_glPushMatrix();hcgl028_glLoadIdentity();MC029_White();
 hcgl028_glRotatef(180,1,0,0);hcgl028_glRotatef(sinf(t/400)*25+20,1,0,0);hcgl028_glRotatef(-t*0.1,0,1,0);I32 i;
 for(i=0;i<6;i++){hcgl028_glPushMatrix();if(i==1)hcgl028_glRotatef(90,0,1,0);if(i==2)hcgl028_glRotatef(180,0,1,0);if(i==3)hcgl028_glRotatef(-90,0,1,0);if(i==4)hcgl028_glRotatef(90,1,0,0);if(i==5)hcgl028_glRotatef(-90,1,0,0);MC029_Bind(&g29_texPano[i]);hcgl028_glBegin(7);hcgl028_glTexCoord2f(0,0);hcgl028_glVertex3f(-1,-1,1);hcgl028_glTexCoord2f(1,0);hcgl028_glVertex3f(1,-1,1);hcgl028_glTexCoord2f(1,1);hcgl028_glVertex3f(1,1,1);hcgl028_glTexCoord2f(0,1);hcgl028_glVertex3f(-1,1,1);hcgl028_glEnd();hcgl028_glPopMatrix();}
 hcgl028_glMatrixMode(0x1701);hcgl028_glPopMatrix();hcgl028_glMatrixMode(0x1700);hcgl028_glPopMatrix();hcgl028_glEnable(0xBE2);MC029_Gradient(0,0,g29_gw,g29_gh,0x59FFFFFF,0x59000000);}

// ---- GUI coordinate setup (GameRenderer::setupGuiScreen) ----
U0 MC029_ComputeScale(){F32 ppm=g29_ppm;if(g29_W>=1000){if(ppm<=15)g29_scale=4;else g29_scale=6;}else if(g29_W>=800)g29_scale=3;else if(g29_W>=400)g29_scale=2;else g29_scale=1;g29_inv=1.0/g29_scale;g29_gw=g29_W*g29_inv;g29_gh=g29_H*g29_inv;}
U0 MC029_GuiBegin(){hcgl028_glViewport(0,0,g29_W,g29_H);hcgl028_glClear(0x100);hcgl028_glDisable(0xB71);hcgl028_glDisable(0xB60);hcgl028_glDisable(0xB44);hcgl028_glDepthMask(1);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.0);hcgl028_glEnable(0xDE1);hcgl028_glMatrixMode(0x1701);hcgl028_glLoadIdentity();hcgl028_glOrtho(0,g29_gw,g29_gh,0,2000,3000);hcgl028_glMatrixMode(0x1700);hcgl028_glLoadIdentity();hcgl028_glTranslatef(0,0,-2000);MC029_White();}
U0 MC029_Scissor(Bool on,F32 x,F32 y,F32 w,F32 h){if(!on){hc029_scissor(0,0,0,0,0);return;}F32 sx=g29_W/(g29_gw(F32)),sy=g29_H/(g29_gh(F32));hc029_scissor(1,x*sx,g29_H-(y+h)*sy,w*sx,h*sy);}
