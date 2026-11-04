// Batch031: pure HolyC platform layer (replaces platform/Native030.c + Audio030.c).
// Window, OpenGL context, input and audio go through SDL2; files go through libc. No C sources remain.
// The HolyC names/semantics of the old native ABI (hc028_*, hc029_*, hc030_*, hcgl028_*, hcgl029_*) are kept,
// so the game code is unchanged. GL names that the earlier port defines itself in HolyC (glEnable, glPushMatrix ...)
// are resolved with SDL_GL_GetProcAddress, everything else is linked directly from libGL.
#link <SDL2>
#link <GL>
extern "c" I32 fprintf(U0*,U8*,...);
extern "c" U0 rewind(U0*);
extern "c" I32 abs(I32);
extern "c" I32 atoi(U8*);
extern "c" F32 powf(F32,F32);
class MCNativeEvent028 {I32 kind,a,b,c;};

// ---- libc
_extern open I32 C31_open(U8*,I32,I32);
_extern close I32 C31_close(I32);
_extern read I64 C31_read(I32,U0*,U64);
_extern write I64 C31_write(I32,U0*,U64);
_extern flock I32 C31_flock(I32,I32);
_extern fsync I32 C31_fsync(I32);
_extern rename I32 C31_rename(U8*,U8*);
_extern mkdir I32 C31_mkdir(U8*,I32);
_extern mkdtemp U8 *C31_mkdtemp(U8*);
_extern unlink I32 C31_unlink(U8*);
_extern rmdir I32 C31_rmdir(U8*);
_extern getpid I32 C31_getpid();
_extern getenv U8 *C31_getenv(U8*);
_extern strerror U8 *C31_strerror(I32);
_extern __errno_location I32 *C31_errno();
_extern clock_gettime I32 C31_clock_gettime(I32,I64*);
_extern fflush I32 C31_fflush(U0*);
_extern malloc U0 *C31_malloc(U64);
_extern free U0 C31_free(U0*);
_extern strcmp I32 C31_strcmp(U8*,U8*);
_extern strncmp I32 C31_strncmp(U8*,U8*,U64);
_extern strlen U64 C31_strlen(U8*);
_extern memset U0 *C31_memset(U0*,I32,U64);
_extern memcpy U0 *C31_memcpy(U0*,U0*,U64);
_extern lseek I64 C31_lseek(I32,I64,I32);

// ---- SDL2
_extern SDL_Init I32 S31_Init(U32);
_extern SDL_InitSubSystem I32 S31_InitSub(U32);
_extern SDL_QuitSubSystem U0 S31_QuitSub(U32);
_extern SDL_GetError U8 *S31_GetError();
_extern SDL_CreateWindow U0 *S31_CreateWindow(U8*,I32,I32,I32,I32,U32);
_extern SDL_DestroyWindow U0 S31_DestroyWindow(U0*);
_extern SDL_SetWindowTitle U0 S31_SetTitle(U0*,U8*);
_extern SDL_SetWindowMinimumSize U0 S31_SetMinSize(U0*,I32,I32);
_extern SDL_GetWindowSize U0 S31_GetWindowSize(U0*,I32*,I32*);
_extern SDL_GL_SetAttribute I32 S31_GLAttr(I32,I32);
_extern SDL_GL_CreateContext U0 *S31_GLCreate(U0*);
_extern SDL_GL_DeleteContext U0 S31_GLDelete(U0*);
_extern SDL_GL_GetProcAddress U0 *S31_GLProc(U8*);
_extern SDL_GL_SwapWindow U0 S31_GLSwap(U0*);
_extern SDL_PollEvent I32 S31_PollEvent(U8*);
_extern SDL_SetRelativeMouseMode I32 S31_SetRelative(I32);
_extern SDL_GetDisplayDPI I32 S31_GetDPI(I32,F32*,F32*,F32*);
_extern SDL_SetHint I32 S31_SetHint(U8*,U8*);
_extern SDL_StartTextInput U0 S31_StartText();
_extern SDL_Delay U0 S31_Delay(U32);
_extern SDL_AudioInit I32 S31_AudioInit(U8*);
_extern SDL_GetCurrentAudioDriver U8 *S31_AudioDriver();
_extern SDL_OpenAudioDevice U32 S31_OpenAudio(U8*,I32,U8*,U8*,I32);
_extern SDL_CloseAudioDevice U0 S31_CloseAudio(U32);
_extern SDL_PauseAudioDevice U0 S31_PauseAudio(U32,I32);
_extern SDL_QueueAudio I32 S31_QueueAudio(U32,U0*,U32);
_extern SDL_GetQueuedAudioSize U32 S31_QueuedSize(U32);

// ---- OpenGL (direct; none of these names is defined by HolyC code)
_extern glClearColor U0 G31_ClearColor(F32,F32,F32,F32);
_extern glClear U0 G31_Clear(U32);
_extern glViewport U0 G31_Viewport(I32,I32,I32,I32);
_extern glDepthMask U0 G31_DepthMask(I32);
_extern glDepthFunc U0 G31_DepthFunc(U32);
_extern glAlphaFunc U0 G31_AlphaFunc(U32,F32);
_extern glMatrixMode U0 G31_MatrixMode(U32);
_extern glLoadMatrixf U0 G31_LoadMatrixf(F32*);
_extern glLoadIdentity U0 G31_LoadIdentity();
_extern glOrtho U0 G31_Ortho(F64,F64,F64,F64,F64,F64);
_extern glTranslated U0 G31_Translated(F64,F64,F64);
_extern glRotated U0 G31_Rotated(F64,F64,F64,F64);
_extern glScaled U0 G31_Scaled(F64,F64,F64);
_extern glBegin U0 G31_Begin(U32);
_extern glEnd U0 G31_End();
_extern glColor4f U0 G31_Color4f(F32,F32,F32,F32);
_extern glColor4ub U0 G31_Color4ub(U8,U8,U8,U8);
_extern glVertex3f U0 G31_Vertex3f(F32,F32,F32);
_extern glVertex2f U0 G31_Vertex2f(F32,F32);
_extern glTexCoord2f U0 G31_TexCoord2f(F32,F32);
_extern glNormal3f U0 G31_Normal3f(F32,F32,F32);
_extern glBindTexture U0 G31_BindTexture(U32,U32);
_extern glGenTextures U0 G31_GenTextures(I32,U32*);
_extern glDeleteTextures U0 G31_DeleteTextures(I32,U32*);
_extern glTexParameteri U0 G31_TexParameteri(U32,U32,I32);
_extern glTexImage2D U0 G31_TexImage2D(U32,I32,I32,I32,I32,I32,U32,U32,U0*);
_extern glPixelStorei U0 G31_PixelStorei(U32,I32);
_extern glFogf U0 G31_Fogf(U32,F32);
_extern glFogfv U0 G31_Fogfv(U32,F32*);
_extern glFogi U0 G31_Fogi(U32,I32);
_extern glLineWidth U0 G31_LineWidth(F32);
_extern glGenLists U32 G31_GenLists(I32);
_extern glDeleteLists U0 G31_DeleteLists(U32,I32);
_extern glNewList U0 G31_NewList(U32,U32);
_extern glEndList U0 G31_EndList();
_extern glCallList U0 G31_CallList(U32);
_extern glCullFace U0 G31_CullFace(U32);
_extern glFrontFace U0 G31_FrontFace(U32);
_extern glTexEnvi U0 G31_TexEnvi(U32,U32,I32);
_extern glScissor U0 G31_Scissor(I32,I32,I32,I32);
_extern glReadPixels U0 G31_ReadPixels(I32,I32,I32,I32,U32,U32,U0*);
_extern glReadBuffer U0 G31_ReadBuffer(U32);
_extern glGetString U8 *G31_GetString(U32);
_extern glLightfv U0 G31_Lightfv(U32,U32,F32*);
_extern glLightModeli U0 G31_LightModeli(U32,I32);
_extern glStencilFunc U0 G31_StencilFunc(U32,I32,U32);
_extern glStencilOp U0 G31_StencilOp(U32,U32,U32);
_extern glColorMask U0 G31_ColorMask(I32,I32,I32,I32);
_extern glPolygonOffset U0 G31_PolygonOffset(F32,F32);

// GL entry points whose names the HolyC port already uses for its own wrappers (all integer/pointer args).
class MCGL031 {
 U0 (*Enable)(U32);
 U0 (*Disable)(U32);
 U0 (*BlendFunc)(U32,U32);
 U0 (*PushMatrix)();
 U0 (*PopMatrix)();
 U0 (*EnableClientState)(U32);
 U0 (*DisableClientState)(U32);
 U0 (*VertexPointer)(I32,U32,I32,U0*);
 U0 (*TexCoordPointer)(I32,U32,I32,U0*);
 U0 (*ColorPointer)(I32,U32,I32,U0*);
 U0 (*DrawElements)(U32,I32,U32,U0*);
 U32 (*GetError)();
};
MCGL031 g31gl;
Bool g31glReady=FALSE;

U8 g31_err[512];
// bounded concatenation (C varargs functions are avoided: HolyC passes variadic arguments differently)
I32 C31_Cat(U8 *out,I32 cap,U8 *a,U8 *b="",U8 *c="",U8 *d="")
{
 I64 la=C31_strlen(a),lb=C31_strlen(b),lc=C31_strlen(c),ld=C31_strlen(d);
 I64 n=la+lb+lc+ld;
 if(n>=cap){if(cap>0)out[0]=0;return -1;}
 C31_memcpy(out,a,la);C31_memcpy(out+la,b,lb);C31_memcpy(out+la+lb,c,lc);C31_memcpy(out+la+lb+lc,d,ld);out[n]=0;
 return n;
}
U0 C31_Dec(U8 *out,I64 v)
{
 U8 t[24];
 I32 n=0,i=0;
 if(v==0){out[0]='0';out[1]=0;return;}
 while(v>0){t[n]='0'+v%10;v/=10;n++;}
 while(i<n){out[i]=t[n-1-i];i++;}
 out[n]=0;
}

U0 *g31_win=NULL;
U0 *g31_ctx=NULL;
I32 g31_w=0,g31_h=0,g31_grabbed=0,g31_lockfd=-1,g31_bx=0,g31_by=0,g31_videoInit=0;
U8 g31_textq[64];
I32 g31_texthead=0,g31_textcount=0;
U8 g31_ev[64];

U0 C31_Fail(U8 *a,U8 *b=""){C31_Cat(g31_err,512,a,b);}
U0 C31_FailErr(U8 *a){C31_Cat(g31_err,512,a,": ",C31_strerror(*C31_errno()));}
U8 *hc028_error(){return g31_err;}
U64 hc028_clock_ns(){I64 t[2];C31_clock_gettime(1,t);return t[0](U64)*1000000000+t[1](U64);}
U0 hc028_sleep(I32 ms){if(ms>0)S31_Delay(ms);}
U0 hc028_flush(){C31_fflush(NULL);}
I32 hc029_button_x(){return g31_bx;}
I32 hc029_button_y(){return g31_by;}
I32 hc029_window_w(){return g31_w;}
I32 hc029_window_h(){return g31_h;}
I32 hc028_is_grabbed(){return g31_grabbed;}

U0 C31_GLSlot(U0 *slot,U8 *name)
{
 U0 **q=slot;
 *q=S31_GLProc(name);
 if(!*q){"Missing OpenGL entry: %s\n",name;C31_fflush(NULL);exit(81);}
}
U0 C31_GLLoad()
{
 if(g31glReady)return;
 C31_GLSlot(&g31gl.Enable,"glEnable");C31_GLSlot(&g31gl.Disable,"glDisable");C31_GLSlot(&g31gl.BlendFunc,"glBlendFunc");
 C31_GLSlot(&g31gl.PushMatrix,"glPushMatrix");C31_GLSlot(&g31gl.PopMatrix,"glPopMatrix");
 C31_GLSlot(&g31gl.EnableClientState,"glEnableClientState");C31_GLSlot(&g31gl.DisableClientState,"glDisableClientState");
 C31_GLSlot(&g31gl.VertexPointer,"glVertexPointer");C31_GLSlot(&g31gl.TexCoordPointer,"glTexCoordPointer");
 C31_GLSlot(&g31gl.ColorPointer,"glColorPointer");C31_GLSlot(&g31gl.DrawElements,"glDrawElements");C31_GLSlot(&g31gl.GetError,"glGetError");
 g31glReady=TRUE;
}

// ---- window / input
U0 hc028_title(U8 *t){if(g31_win)S31_SetTitle(g31_win,t);}
U0 hc028_grab(I32 on)
{
 if(!g31_win)return;
 if(on){if(!g31_grabbed){if(S31_SetRelative(1)==0)g31_grabbed=1;}}
 else{if(g31_grabbed){S31_SetRelative(0);g31_grabbed=0;}}
}
U0 hc028_close()
{
 if(g31_win){hc028_grab(0);}
 if(g31_ctx){S31_GLDelete(g31_ctx);g31_ctx=NULL;}
 if(g31_win){S31_DestroyWindow(g31_win);g31_win=NULL;}
 if(g31_videoInit){S31_QuitSub(0x20);g31_videoInit=0;}
 g31_grabbed=0;
}
I32 hc028_open(I32 w,I32 h,U8 *title)
{
 if(S31_InitSub(0x20)!=0){C31_Fail("Cannot open a display (SDL2 video). Use an X11/Wayland desktop; --self-test needs no display. SDL: ",S31_GetError());return 0;}
 g31_videoInit=1;
 S31_GLAttr(0,8);S31_GLAttr(1,8);S31_GLAttr(2,8);S31_GLAttr(5,1);S31_GLAttr(6,24);S31_GLAttr(7,8);
 g31_win=S31_CreateWindow(title,0x1FFF0000,0x1FFF0000,w,h,0x2|0x4|0x20);
 if(!g31_win){
  S31_GLAttr(7,0);
  g31_win=S31_CreateWindow(title,0x1FFF0000,0x1FFF0000,w,h,0x2|0x4|0x20);
 }
 if(!g31_win){C31_Fail("No compatible OpenGL window: ",S31_GetError());hc028_close();return 0;}
 g31_ctx=S31_GLCreate(g31_win);
 if(!g31_ctx){C31_Fail("OpenGL context creation failed: ",S31_GetError());hc028_close();return 0;}
 S31_SetMinSize(g31_win,480,300);
 S31_GetWindowSize(g31_win,&g31_w,&g31_h);
 if(g31_w<1)g31_w=w;
 if(g31_h<1)g31_h=h;
 S31_StartText();
 C31_GLLoad();
 "NATIVE029 OpenGL=%s renderer=%s\n",G31_GetString(0x1F02),G31_GetString(0x1F01);
 C31_fflush(NULL);
 return 1;
}
I32 C31_Key(I32 k)
{
 if(k>='a'){if(k<='z')return k-'a'+'A';}
 if(k>='0'){if(k<='9')return k;}
 if(k>=0x4000003A){if(k<=0x40000045)return 280+(k-0x4000003A);}
 if(k==27)return 27;
 if(k==13)return 13;
 if(k==0x40000058)return 13;
 if(k==32)return 32;
 if(k==8)return 8;
 if(k==9)return 9;
 if(k==0x400000E1)return 256;
 if(k==0x400000E5)return 256;
 if(k==0x400000E0)return 257;
 if(k==0x400000E4)return 257;
 if(k==0x40000052)return 300;
 if(k==0x40000051)return 301;
 if(k==0x40000050)return 302;
 if(k==0x4000004F)return 303;
 if(k=='/')return 47;
 return 0;
}
I32 C31_EvI(I32 off){I32 *p=g31_ev+off;return *p;}
U32 C31_EvU(I32 off){U32 *p=g31_ev+off;return *p;}
I32 hc028_poll(MCNativeEvent028 *out)
{
 if(!g31_win)return 0;
 while(S31_PollEvent(g31_ev)){
  U32 t=C31_EvU(0);
  out->kind=0;out->a=0;out->b=0;out->c=0;
  if(t==0x100){out->kind=6;return 1;}
  if(t==0x303){
   I32 i=12;
   while(i<44){
    U8 ch=g31_ev[i];
    if(!ch)break;
    if(ch>=32){if(ch<127){if(g31_textcount<64){g31_textq[(g31_texthead+g31_textcount)%64]=ch;g31_textcount++;}}}
    i++;
   }
  }
  if(t==0x300||t==0x301){
   out->kind=1;out->a=C31_Key(C31_EvI(20));out->b=t==0x300;out->c=C31_EvI(16);
   if(out->a){
    if(C31_getenv("HC028_TRACE_INPUT")){"INPUT028 key=%d down=%d\n",out->a,out->b;C31_fflush(NULL);}
    return 1;
   }
  }
  if(t==0x400){
   if(g31_grabbed){
    I32 dx=C31_EvI(28),dy=C31_EvI(32);
    if(dx||dy){out->kind=2;out->a=dx;out->b=dy;return 1;}
   }else{out->kind=8;out->a=C31_EvI(20);out->b=C31_EvI(24);return 1;}
  }
  if(t==0x401||t==0x402){
   g31_bx=C31_EvI(20);g31_by=C31_EvI(24);
   out->kind=3;out->a=g31_ev[16];out->b=t==0x401;out->c=g31_grabbed;return 1;
  }
  if(t==0x403){
   I32 wy=C31_EvI(20);
   if(C31_EvU(24)==1)wy=-wy;
   if(wy>0){out->kind=4;out->a=1;return 1;}
   if(wy<0){out->kind=4;out->a=-1;return 1;}
  }
  if(t==0x200){
   U8 we=g31_ev[12];
   if(we==6||we==5){
    I32 nw=C31_EvI(16),nh=C31_EvI(20);
    if(nw!=g31_w||nh!=g31_h){g31_w=nw;g31_h=nh;out->kind=5;out->a=nw;out->b=nh;return 1;}
   }
   if(we==13){
    if(C31_getenv("HC028_TRACE_INPUT")){"INPUT028 focus-out\n";C31_fflush(NULL);}
    hc028_grab(0);out->kind=7;out->a=0;return 1;
   }
   if(we==12){out->kind=7;out->a=1;return 1;}
  }
 }
 return 0;
}
I32 hc029_text()
{
 if(!g31_textcount)return -1;
 I32 ch=g31_textq[g31_texthead];
 g31_texthead=(g31_texthead+1)%64;g31_textcount--;
 return ch;
}
F64 hc029_ppm()
{
 F32 d=0.0,hd=0.0,vd=0.0;
 if(!g31_win)return 0.0;
 if(S31_GetDPI(0,&d,&hd,&vd)!=0)return 0.0;
 F64 p=hd;
 if(p<1.0)return 0.0;
 return p/25.4;
}

// ---- GL forwarders (old ABI names)
U0 hcgl028_glClearColor(F32 a,F32 b,F32 c,F32 d){G31_ClearColor(a,b,c,d);}
U0 hcgl028_glClear(U32 a){G31_Clear(a);}
U0 hcgl028_glViewport(I32 a,I32 b,I32 c,I32 d){G31_Viewport(a,b,c,d);}
U0 hcgl028_glEnable(U32 a){g31gl.Enable(a);}
U0 hcgl028_glDisable(U32 a){g31gl.Disable(a);}
U0 hcgl028_glDepthMask(I32 a){G31_DepthMask(a);}
U0 hcgl028_glDepthFunc(U32 a){G31_DepthFunc(a);}
U0 hcgl028_glBlendFunc(U32 a,U32 b){g31gl.BlendFunc(a,b);}
U0 hcgl028_glAlphaFunc(U32 a,F32 b){G31_AlphaFunc(a,b);}
U0 hcgl028_glMatrixMode(U32 a){G31_MatrixMode(a);}
U0 hcgl028_glLoadMatrixf(F32 *a){G31_LoadMatrixf(a);}
U0 hcgl028_glLoadIdentity(){G31_LoadIdentity();}
U0 hcgl028_glOrtho(F64 a,F64 b,F64 c,F64 d,F64 e,F64 f){G31_Ortho(a,b,c,d,e,f);}
U0 hcgl028_glPushMatrix(){g31gl.PushMatrix();}
U0 hcgl028_glPopMatrix(){g31gl.PopMatrix();}
U0 hcgl028_glTranslatef(F32 a,F32 b,F32 c){F64 x=a,y=b,z=c;G31_Translated(x,y,z);}
U0 hcgl028_glRotatef(F32 a,F32 b,F32 c,F32 d){F64 x=a,y=b,z=c,w=d;G31_Rotated(x,y,z,w);}
U0 hcgl028_glScalef(F32 a,F32 b,F32 c){F64 x=a,y=b,z=c;G31_Scaled(x,y,z);}
U0 hcgl028_glBegin(U32 a){G31_Begin(a);}
U0 hcgl028_glEnd(){G31_End();}
U0 hcgl028_glColor4f(F32 a,F32 b,F32 c,F32 d){G31_Color4f(a,b,c,d);}
U0 hcgl028_glColor4ub(U8 a,U8 b,U8 c,U8 d){G31_Color4ub(a,b,c,d);}
U0 hcgl028_glVertex3f(F32 a,F32 b,F32 c){G31_Vertex3f(a,b,c);}
U0 hcgl028_glVertex2f(F32 a,F32 b){G31_Vertex2f(a,b);}
U0 hcgl028_glTexCoord2f(F32 a,F32 b){G31_TexCoord2f(a,b);}
U0 hcgl028_glBindTexture(U32 a,U32 b){G31_BindTexture(a,b);}
U0 hcgl028_glGenTextures(I32 a,U32 *b){G31_GenTextures(a,b);}
U0 hcgl028_glDeleteTextures(I32 a,U32 *b){G31_DeleteTextures(a,b);}
U0 hcgl028_glTexParameteri(U32 a,U32 b,I32 c){G31_TexParameteri(a,b,c);}
U0 hcgl028_glTexImage2D(U32 a,I32 b,I32 c,I32 d,I32 e,I32 f,U32 g,U32 h,U0 *p){G31_TexImage2D(a,b,c,d,e,f,g,h,p);}
U0 hcgl028_glPixelStorei(U32 a,I32 b){G31_PixelStorei(a,b);}
U0 hcgl028_glFogf(U32 a,F32 b){G31_Fogf(a,b);}
U0 hcgl028_glFogfv(U32 a,F32 *b){G31_Fogfv(a,b);}
U0 hcgl028_glFogi(U32 a,I32 b){G31_Fogi(a,b);}
U0 hcgl028_glLineWidth(F32 a){G31_LineWidth(a);}
U0 hcgl028_glEnableClientState(U32 a){g31gl.EnableClientState(a);}
U0 hcgl028_glDisableClientState(U32 a){g31gl.DisableClientState(a);}
U0 hcgl028_glVertexPointer(I32 a,U32 b,I32 c,U0 *d){g31gl.VertexPointer(a,b,c,d);}
U0 hcgl028_glTexCoordPointer(I32 a,U32 b,I32 c,U0 *d){g31gl.TexCoordPointer(a,b,c,d);}
U0 hcgl028_glColorPointer(I32 a,U32 b,I32 c,U0 *d){g31gl.ColorPointer(a,b,c,d);}
U0 hcgl028_glDrawElements(U32 a,I32 b,U32 c,U0 *d){g31gl.DrawElements(a,b,c,d);}
U32 hcgl028_glGenLists(I32 a){return G31_GenLists(a);}
U0 hcgl028_glDeleteLists(U32 a,I32 b){G31_DeleteLists(a,b);}
U0 hcgl028_glNewList(U32 a,U32 b){G31_NewList(a,b);}
U0 hcgl028_glEndList(){G31_EndList();}
U0 hcgl028_glCallList(U32 a){G31_CallList(a);}
U32 hcgl028_glGetError(){return g31gl.GetError();}
U0 hcgl029_glCullFace(U32 a){G31_CullFace(a);}
U0 hcgl029_glFrontFace(U32 a){G31_FrontFace(a);}
U0 hcgl029_glTexEnvi(U32 a,U32 b,I32 c){G31_TexEnvi(a,b,c);}
U0 hc029_scissor(I32 on,I32 x,I32 y,I32 w,I32 h)
{
 if(on){if(w<0)w=0;if(h<0)h=0;G31_Scissor(x,y,w,h);g31gl.Enable(0xC11);}
 else g31gl.Disable(0xC11);
}

// ---- files: managed world snapshots (same layout/protocol as batch028..030)
U8 *g31_snapFiles[9]={"chunks.dat","level.dat","level.dat_old","runtime028.dat","entities031.dat","tiles032.dat","world034.dat","world035.dat","entities.dat"};
I32 C31_Join(U8 *out,I32 cap,U8 *dir,U8 *file)
{
 I32 n=C31_Cat(out,cap,dir,"/",file);
 if(n<0){C31_Fail("World path too long");return 0;}
 return 1;
}
I32 C31_MkDir(U8 *p)
{
 if(C31_mkdir(p,0x1C0)!=0){if(*C31_errno()!=17){C31_FailErr("mkdir");return 0;}}
 return 1;
}
I32 C31_MkDirs(U8 *path)
{
 U8 p[4096];
 if(C31_strlen(path)>=4096){C31_Fail("World path too long");return 0;}
 StrCpy(p,path);
 I32 i=1;
 while(p[i]){
  if(p[i]=='/'){p[i]=0;if(!C31_MkDir(p))return 0;p[i]='/';}
  i++;
 }
 return C31_MkDir(p);
}
I32 hc028_lock(U8 *root)
{
 if(g31_lockfd>=0){C31_Fail("A world is already locked by this application");return 0;}
 if(!C31_MkDirs(root))return 0;
 U8 path[4096];
 if(!C31_Join(path,4096,root,"LOCK"))return 0;
 I32 f=C31_open(path,0x40|2|0x80000,0x180);
 if(f<0){C31_FailErr("World lock");return 0;}
 if(C31_flock(f,2|4)!=0){C31_close(f);C31_Fail("This world is already open in another game instance");return 0;}
 g31_lockfd=f;return 1;
}
U0 hc028_unlock(){if(g31_lockfd>=0){C31_flock(g31_lockfd,8);C31_close(g31_lockfd);g31_lockfd=-1;}}
I32 C31_ReadName(U8 *root,U8 *file,U8 *name)
{
 U8 p[4096],buf[260];
 if(!C31_Join(p,4096,root,file))return -1;
 I32 f=C31_open(p,0x80000,0);
 if(f<0){if(*C31_errno()==2)return 0;C31_FailErr("Read save pointer");return -1;}
 I64 n=C31_read(f,buf,256);
 C31_close(f);
 if(n<=0){C31_Fail("Empty save pointer");return -1;}
 I64 i=0,len=-1;
 while(i<n){if(buf[i]=='\n'){len=i;break;}i++;}
 if(len<0){if(n>=128){C31_Fail("Invalid save pointer; refusing to overwrite the world");return -1;}len=n;}
 else{if(len+1!=n){C31_Fail("Invalid save pointer; refusing to overwrite the world");return -1;}}
 i=0;
 while(i<len){if(buf[i]=='\r'){len=i;break;}i++;}
 if(len<6||len>=128){C31_Fail("Invalid save pointer; refusing to overwrite the world");return -1;}
 if(C31_strncmp(buf,"snap-",5)!=0){C31_Fail("Invalid save pointer; refusing to overwrite the world");return -1;}
 i=5;
 while(i<len){
  U8 c=buf[i];
  Bool ok=FALSE;
  if(c>='0'){if(c<='9')ok=TRUE;}
  if(c>='a'){if(c<='f')ok=TRUE;}
  if(c=='-')ok=TRUE;
  if(!ok){C31_Fail("Unsafe save pointer");return -1;}
  i++;
 }
 C31_memcpy(name,buf,len);name[len]=0;
 return 1;
}
I32 hc028_active(U8 *root,U8 *out,I32 cap)
{
 U8 name[128];
 I32 r=C31_ReadName(root,"CURRENT",name);
 if(r==0){
  // Batch035: a plain MCPE 0.8.1 world folder (level.dat + chunks.dat, no snapshots yet) is opened read-only;
  // the first save creates a snapshot next to it, the original PE files stay untouched.
  U8 lp[4096],cp[4096];
  if(!C31_Join(lp,4096,root,"level.dat"))return 0;
  if(!C31_Join(cp,4096,root,"chunks.dat"))return 0;
  I32 lf=C31_open(lp,0x80000,0);if(lf<0)return 0;C31_close(lf);
  I32 cf=C31_open(cp,0x80000,0);if(cf<0)return 0;C31_close(cf);
  if(C31_strlen(root)+1>cap)return -1;
  C31_Cat(out,cap,root,"");
  return 2;
 }
 if(r!=1)return r;
 if(!C31_Join(out,cap,root,name))return -1;
 I32 f=C31_open(out,0x10000|0x80000,0);
 if(f<0){C31_Fail("Committed snapshot directory is missing");return -1;}
 C31_close(f);
 return 1;
}
I32 C31_CopyFile(U8 *from,U8 *to)
{
 I32 in=C31_open(from,0x80000,0);
 if(in<0){C31_FailErr("Read previous snapshot");return 0;}
 I32 out=C31_open(to,1|0x40|0x80|0x80000,0x180);
 if(out<0){C31_close(in);C31_FailErr("Create snapshot");return 0;}
 U8 *b=C31_malloc(65536);
 I32 ok=1;
 I64 n=C31_read(in,b,65536);
 while(n>0){
  I64 done=0;
  while(done<n){I64 k=C31_write(out,b+done,n-done);if(k<=0){ok=0;break;}done+=k;}
  if(!ok)break;
  n=C31_read(in,b,65536);
 }
 if(n<0)ok=0;
 C31_free(b);
 if(C31_close(in)!=0)ok=0;
 if(C31_close(out)!=0)ok=0;
 if(!ok)C31_FailErr("Snapshot copy failed");
 return ok;
}
U0 C31_RemoveSnap(U8 *dir)
{
 U8 p[4096];
 I32 i;
 for(i=0;i<9;i++){if(C31_Join(p,4096,dir,g31_snapFiles[i]))C31_unlink(p);}
 C31_rmdir(dir);
}
U0 hc028_abort(U8 *stage)
{
 I64 n=C31_strlen(stage),i=n-1;
 while(i>=0){if(stage[i]=='/')break;i--;}
 if(i<0)return;
 if(C31_strncmp(stage+i+1,".stage-",7)!=0)return;
 C31_RemoveSnap(stage);
}
I32 hc028_begin(U8 *root,U8 *stage,I32 cap)
{
 if(g31_lockfd<0){C31_Fail("World save attempted without a process lock");return 0;}
 U8 current[4096],from[4096],to[4096];
 I32 active=hc028_active(root,current,4096);
 if(active<0)return 0;
 if(!C31_Join(stage,cap,root,".stage-XXXXXX"))return 0;
 if(!C31_mkdtemp(stage)){C31_FailErr("Create staging directory");return 0;}
 if(active){
  if(!C31_Join(from,4096,current,"chunks.dat")){hc028_abort(stage);return 0;}
  if(!C31_Join(to,4096,stage,"chunks.dat")){hc028_abort(stage);return 0;}
  if(!C31_CopyFile(from,to)){hc028_abort(stage);return 0;}
 }
 return 1;
}
I32 C31_SyncFile(U8 *dir,U8 *file,Bool optional)
{
 U8 p[4096];
 if(!C31_Join(p,4096,dir,file))return 0;
 I32 f=C31_open(p,0x80000,0);
 if(f<0){if(optional)return 1;C31_Fail("Incomplete snapshot: ",file);return 0;}
 I32 ok=C31_fsync(f)==0;
 C31_close(f);
 if(!ok)C31_FailErr("Snapshot fsync failed");
 return ok;
}
I32 C31_SyncDir(U8 *dir)
{
 I32 f=C31_open(dir,0x10000|0x80000,0);
 if(f<0)return 0;
 I32 ok=C31_fsync(f)==0;
 C31_close(f);
 return ok;
}
I32 C31_WritePointer(U8 *root,U8 *file,U8 *name)
{
 U8 p[4096],tmp[4096];
 if(!C31_Join(p,4096,root,file))return 0;
 if(C31_Cat(tmp,4096,p,".new")<0)return 0;
 I32 f=C31_open(tmp,1|0x40|0x200|0x80000,0x180);
 if(f<0)return 0;
 I64 n=C31_strlen(name);
 I32 ok=1;
 if(C31_write(f,name,n)!=n)ok=0;
 if(ok){if(C31_write(f,"\n",1)!=1)ok=0;}
 if(ok){if(C31_fsync(f)!=0)ok=0;}
 if(C31_close(f)!=0)ok=0;
 if(ok){if(C31_rename(tmp,p)!=0)ok=0;}
 if(!ok)C31_unlink(tmp);
 return ok;
}
U0 C31_Hex(U8 *out,U64 v,I32 digits)
{
 I32 i;
 for(i=digits-1;i>=0;i--){out[i]="0123456789abcdef"[v&15];v>>=4;}
 out[digits]=0;
}
I32 hc028_commit(U8 *root,U8 *stage)
{
 if(g31_lockfd<0)return 0;
 U8 prefix[4096];
 if(!C31_Join(prefix,4096,root,".stage-"))return 0;
 if(C31_strncmp(stage,prefix,C31_strlen(prefix))!=0){C31_Fail("Staging directory is not owned by this world");return 0;}
 if(!C31_SyncFile(stage,"chunks.dat",FALSE))return 0;
 if(!C31_SyncFile(stage,"level.dat",FALSE))return 0;
 if(!C31_SyncFile(stage,"runtime028.dat",FALSE))return 0;
 if(!C31_SyncFile(stage,"entities031.dat",TRUE))return 0;
 if(!C31_SyncFile(stage,"tiles032.dat",TRUE))return 0;
 if(!C31_SyncFile(stage,"world034.dat",TRUE))return 0;
 if(!C31_SyncFile(stage,"world035.dat",TRUE))return 0;
 if(!C31_SyncFile(stage,"entities.dat",TRUE))return 0;
 if(!C31_SyncDir(stage))return 0;
 U8 prior[128],older[128],name[128],dest[4096],h1[20],h2[12];
 prior[0]=0;older[0]=0;
 I32 r=C31_ReadName(root,"CURRENT",prior);
 if(r<0)return 0;
 I32 ro=C31_ReadName(root,"PREVIOUS",older);
 if(ro!=1)older[0]=0;
 C31_Hex(h1,hc028_clock_ns(),16);C31_Hex(h2,C31_getpid()(U32),8);
 C31_Cat(name,128,"snap-",h1,"-",h2);
 if(!C31_Join(dest,4096,root,name))return 0;
 if(C31_rename(stage,dest)!=0){C31_FailErr("Snapshot rename failed");return 0;}
 if(!C31_SyncDir(root)){C31_Fail("Commit pointer failed; previous save retained");return 0;}
 if(!C31_WritePointer(root,"CURRENT",name)){C31_Fail("Commit pointer failed; previous save retained");return 0;}
 if(!C31_SyncDir(root))"WARNING028: directory durability could not be confirmed\n";
 if(r==1){if(C31_strcmp(prior,name)!=0)C31_WritePointer(root,"PREVIOUS",prior);}
 if(older[0]){
  if(C31_strcmp(older,prior)!=0){
   if(C31_strcmp(older,name)!=0){
    U8 old[4096];
    if(C31_Join(old,4096,root,older))C31_RemoveSnap(old);
   }
  }
 }
 return 1;
}
I32 C31_WriteAll(I32 f,U8 *p,I64 n)
{
 I64 done=0;
 while(done<n){I64 k=C31_write(f,p+done,n-done);if(k<=0)return 0;done+=k;}
 return 1;
}
I32 hc028_capture(U8 *path,I32 w,I32 h)
{
 if(w<1||h<1||w>8192||h>8192)return 0;
 I64 stride=w*3;
 U8 *px=C31_malloc(stride*h);
 if(!px)return 0;
 G31_PixelStorei(0xD05,1);G31_ReadBuffer(0x405);G31_ReadPixels(0,0,w,h,0x1907,0x1401,px);
 I32 f=C31_open(path,1|0x40|0x200|0x80000,0x1A4);
 I32 ok=0;
 if(f>=0){
  U8 hd[64];
  U8 dw[24],dh[24];C31_Dec(dw,w);C31_Dec(dh,h);
  U8 hd2[64];C31_Cat(hd2,64,"P6\n",dw," ",dh);I32 hn=C31_Cat(hd,64,hd2,"\n255\n");
  ok=C31_WriteAll(f,hd,hn);
  I32 y=h-1;
  while(ok&&y>=0){ok=C31_WriteAll(f,px+y*stride,stride);y--;}
  if(C31_close(f)!=0)ok=0;
 }
 C31_free(px);
 return ok;
}
I32 hc028_shot_path(U8 *out,I32 cap)
{
 if(!C31_MkDirs("screenshots"))return 0;
 U8 hx[20];
 C31_Hex(hx,hc028_clock_ns(),16);
 I32 n=C31_Cat(out,cap,"screenshots/shot028-",hx,".ppm");
 if(n<=0)return 0;
 return 1;
}
U0 hc028_swap();

// ---- audio: SDL2 queued output; mixing in HolyC (SoundSystemSL rules: max 4 voices, gain 10^(v-1), PCM as-is)
class MCSnd031 {U8 *data;I32 channels,bps,rate,frames;};
class MCVoice031 {MCSnd031 *s;F64 pos,step;F32 gain;};
MCSnd031 g31_snd[256];
MCVoice031 g31_voice[4];
I32 g31_sndCount=0,g31_playing=0,g31_played=0,g31_dropped=0,g31_audioStarted=0,g31_audioRunning=0;
U32 g31_dev=0;
I32 g31_wav=-1;
U32 g31_wavBytes=0;
U64 g31_wavT0=0,g31_wavFrames=0;
U8 g31_backend[64];
I16 g31_mixOut[1024];
F32 g31_acc[1024];

U0 C31_Put32(U8 *p,U32 v){U32 *q=p;*q=v;}
U0 C31_Put16(U8 *p,U16 v){U16 *q=p;*q=v;}
U0 C31_WavHeader()
{
 U8 h[44];
 C31_memcpy(h,"RIFF",4);C31_Put32(h+4,36+g31_wavBytes);C31_memcpy(h+8,"WAVEfmt ",8);C31_Put32(h+16,16);
 C31_Put16(h+20,1);C31_Put16(h+22,2);C31_Put32(h+24,44100);C31_Put32(h+28,44100*4);C31_Put16(h+32,4);C31_Put16(h+34,16);
 C31_memcpy(h+36,"data",4);C31_Put32(h+40,g31_wavBytes);
 C31_lseek(g31_wav,0,0);C31_WriteAll(g31_wav,h,44);C31_lseek(g31_wav,0,2);
}
F32 C31_Sample(MCSnd031 *s,I32 frame,I32 ch)
{
 if(frame>=s->frames)return 0.0;
 I32 c=0;
 if(s->channels==2)c=ch;
 I64 idx=frame(I64)*s->channels+c;
 if(s->bps==2){I16 *q=s->data+idx*2;F32 r=*q;return r;}
 I32 b=s->data[idx];
 F32 r8=(b-128)*256;
 return r8;
}
U0 C31_Mix(I32 frames)
{
 I32 i,v=0;
 for(i=0;i<frames*2;i++)g31_acc[i]=0.0;
 while(v<g31_playing){
  MCVoice031 *p=&g31_voice[v];
  for(i=0;i<frames;i++){
   I32 f=p->pos(I32);
   if(f>=p->s->frames)break;
   F32 t=p->pos-f;
   g31_acc[i*2]+=p->gain*(C31_Sample(p->s,f,0)*(1.0-t)+C31_Sample(p->s,f+1,0)*t);
   g31_acc[i*2+1]+=p->gain*(C31_Sample(p->s,f,1)*(1.0-t)+C31_Sample(p->s,f+1,1)*t);
   p->pos+=p->step;
  }
  if(p->pos(I32)>=p->s->frames){g31_playing--;g31_voice[v]=g31_voice[g31_playing];}
  else v++;
 }
 for(i=0;i<frames*2;i++){
  F32 x=g31_acc[i];
  I32 o=x(I32);
  if(x>32767.0)o=32767;
  if(x<-32768.0)o=-32768;
  g31_mixOut[i]=o;
 }
}
U0 C31_AudioPump()
{
 if(!g31_audioRunning)return;
 if(g31_dev){
  I32 guard=0;
  while(S31_QueuedSize(g31_dev)<10584&&guard<64){C31_Mix(512);S31_QueueAudio(g31_dev,g31_mixOut,2048);guard++;}
  return;
 }
 if(g31_wav>=0){
  U64 due=(hc028_clock_ns()-g31_wavT0)*441/10000000;
  I32 guard=0;
  while(g31_wavFrames<due&&guard<256){C31_Mix(512);C31_WriteAll(g31_wav,g31_mixOut,2048);g31_wavBytes+=2048;g31_wavFrames+=512;guard++;}
 }
}
I32 hc030_audio_open()
{
 if(!g31_backend[0])StrCpy(g31_backend,"none");
 if(g31_audioStarted)return g31_audioRunning;
 g31_audioStarted=1;
 U8 *want=C31_getenv("MCPE_AUDIO");
 if(want){
  if(C31_strncmp(want,"wav:",4)==0){
   g31_wav=C31_open(want+4,1|0x40|0x200|0x80000,0x1A4);
   if(g31_wav<0)return 0;
   C31_WavHeader();StrCpy(g31_backend,"wav");g31_wavT0=hc028_clock_ns();g31_audioRunning=1;return 1;
  }
  if(C31_strcmp(want,"none")==0)return 0;
 }
 if(S31_InitSub(0x10)!=0)return 0;
 if(want){if(S31_AudioInit(want)!=0)return 0;}
 U8 spec[32],have[32];
 C31_memset(spec,0,32);C31_memset(have,0,32);
 C31_Put32(spec,44100);C31_Put16(spec+4,0x8010);spec[6]=2;C31_Put16(spec+8,512);
 g31_dev=S31_OpenAudio(NULL,0,spec,have,0);
 if(!g31_dev)return 0;
 U8 *drv=S31_AudioDriver();
 if(!drv)drv="?";
 C31_Cat(g31_backend,64,"sdl:",drv);
 g31_audioRunning=1;
 C31_AudioPump;
 S31_PauseAudio(g31_dev,0);
 return 1;
}
U8 *hc030_audio_backend(){if(!g31_backend[0])StrCpy(g31_backend,"none");return g31_backend;}
I32 hc030_snd_load(U8 *path)
{
 if(g31_sndCount>=256)return -1;
 I32 f=C31_open(path,0x80000,0);
 if(f<0)return -1;
 I32 h[4];
 if(C31_read(f,h,16)!=16){C31_close(f);return -1;}
 Bool bad=FALSE;
 if(h[0]!=1){if(h[0]!=2)bad=TRUE;}
 if(h[1]!=1){if(h[1]!=2)bad=TRUE;}
 if(h[2]<4000||h[2]>96000||h[3]<=0||h[3]>10000000)bad=TRUE;
 if(bad){C31_close(f);return -1;}
 I64 n=h[0](I64)*h[1]*h[3];
 U8 *d=C31_malloc(n+8);
 if(!d){C31_close(f);return -1;}
 I64 got=0;
 while(got<n){I64 k=C31_read(f,d+got,n-got);if(k<=0)break;got+=k;}
 C31_close(f);
 if(got!=n){C31_free(d);return -1;}
 C31_memset(d+n,0,8);
 MCSnd031 *s=&g31_snd[g31_sndCount];
 s->data=d;s->channels=h[0];s->bps=h[1];s->rate=h[2];s->frames=h[3];
 g31_sndCount++;
 return g31_sndCount-1;
}
I32 hc030_snd_play(I32 id,F32 volume)
{
 if(id<0||id>=g31_sndCount||!g31_audioRunning)return 0;
 if(volume>1.0)volume=1.0;
 if(g31_playing<4){
  MCVoice031 *v=&g31_voice[g31_playing];
  g31_playing++;
  v->s=&g31_snd[id];v->pos=0.0;v->step=g31_snd[id].rate/44100.0;v->gain=powf(10.0,volume-1.0);
  g31_played++;
  return 1;
 }
 g31_dropped++;
 return 0;
}
I32 hc030_snd_playing(){return g31_playing;}
I32 hc030_snd_stats(I32 which){if(which==0)return g31_played;if(which==1)return g31_dropped;return g31_sndCount;}
U0 hc030_audio_close()
{
 if(g31_dev){S31_CloseAudio(g31_dev);g31_dev=0;}
 if(g31_wav>=0){C31_AudioPump;C31_WavHeader();C31_close(g31_wav);g31_wav=-1;}
 g31_audioRunning=0;
}
U0 hc028_swap(){if(g31_win)S31_GLSwap(g31_win);C31_AudioPump;}
