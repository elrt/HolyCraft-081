// Batch029 screens (part 1): shared screen state, ScrollingPane-like drag lists, Touch TextBox,
// Options persistence (original option keys) and the local world list (LevelData of each save).
#define G29S_NONE 0
#define G29S_START 1
#define G29S_PLAY 2
#define G29S_CREATE 3
#define G29S_DELETE 4
#define G29S_PROGRESS 5
#define G29S_PAUSE 6
#define G29S_OPTIONS 7
#define G29S_DEATH 8
#define G29S_CREATIVE 9
#define G29S_SURVIVAL 10
#define G29S_CRAFT 11
#define G29S_CHAT 12
I32 g29_screen=G29S_START,g29_pending=-1,g29_deathTicks=0;
Bool g29_quit=FALSE,g29_screenPress=FALSE,g29_optFromWorld=FALSE;
// requests executed by the app layer (Batch029App.HC)
I32 g29_reqLoad=-1;Bool g29_reqCreate=FALSE,g29_reqQuitTitle=FALSE,g29_reqRespawn=FALSE,g29_reqDelete=FALSE,g29_reqResume=FALSE;
U8 g29_status[256];F64 g29_statusAt=-100;
U0 MC029_Go(I32 id){g29_pending=id;}
U0 MC029_Status(U8 *t){strncpy(g29_status,t,255);g29_status[255]=0;g29_statusAt=getTimeS();printf("STATUS029 %s\n",g29_status);}
U0 MC029_RenderStatus(){if(getTimeS()-g29_statusAt>6 || !g29_status[0])return;I32 w=MC029_Width(g29_status);MC029_Fill(0,g29_gh-12,g29_gw,g29_gh,0xA0000000);MC029_Shadow(g29_status,g29_gw/2-w/2,g29_gh-10,0xFFFF8080);}
// Screen::renderBackground: game behind -> translucent black, otherwise dirt.
U0 MC029_RenderBackground(Bool behind){if(behind)MC029_Fill(0,0,g29_gw,g29_gh,0x7f000000);else MC029_DirtBackground(0);MC029_White();}
U0 MC029_DrainText(){while(hc029_text()>=0){}}

// ---- Options (Options::save/load key names) ----
U0 MC029_OptDefaults(){memset(&g29_opt,0,sizeof(MCOptions029));strcpy(g29_opt.username,"Steve");g29_opt.difficulty=2;g29_opt.viewDistance=2;g29_opt.serverVisible=TRUE;g29_opt.useTouch=TRUE;g29_opt.fancy=TRUE;g29_opt.fancySkies=TRUE;g29_opt.animateWater=TRUE;g29_opt.sensitivity=0.5;F32 p=g29_ppm;if(p<3)p=3;if(p>12)p=12;g29_opt.pixelDensity=p;g29_opt.sound=1;}
U8 *MC029_B(Bool v){if(v)return "true";return "false";}
U0 MC029_OptSave(){U0 *f=fopen("options029.txt","wb");if(!f){MC029_Status("Could not write options029.txt");return;}
 fprintf(f,"mp_username:%s\ngame_difficulty:%d\ngame_thirdperson:%s\nmp_server_visible:%s\n",g29_opt.username,g29_opt.difficulty,MC029_B(g29_opt.thirdPerson),MC029_B(g29_opt.serverVisible));
 fprintf(f,"ctrl_sensitivity:%f\nctrl_invertmouse:%s\nctrl_islefthanded:%s\nctrl_usetouchscreen:%s\nctrl_usetouchjoypad:%s\ngfx_pixeldensity:%f\n",g29_opt.sensitivity,MC029_B(g29_opt.invertMouse),MC029_B(g29_opt.lefty),MC029_B(g29_opt.useTouch),MC029_B(g29_opt.splitControls),g29_opt.pixelDensity);
 fprintf(f,"gfx_renderdistance:%d\ngfx_fancygraphics:%s\ngfx_fancyskies:%s\ngfx_animatetextures:%s\ngfx_hidegui:%s\naudio_sound:%f\n",g29_opt.viewDistance,MC029_B(g29_opt.fancy),MC029_B(g29_opt.fancySkies),MC029_B(g29_opt.animateWater),MC029_B(g29_opt.hideGui),g29_opt.sound);fclose(f);}
Bool MC029_ReadBool(U8 *v){return !strcmp(v,"true") || !strcmp(v,"YES") || !strcmp(v,"1");}
F32 MC029_ReadF(U8 *v){if(MC029_ReadBool(v))return 1;F32 r=0;if(sscanf(v,"%f",&r)!=1)return 0;return r;}
U0 MC029_OptLoad(){MC029_OptDefaults();U0 *f=fopen("options029.txt","rb");if(!f)return;U8 *buf=malloc(8192);I64 n=fread(buf,1,8191,f);fclose(f);if(n<0)n=0;buf[n]=0;I64 i=0;
 while(i<n){I64 st=i;while(i<n && buf[i]!=10 && buf[i]!=13)i++;I64 en=i;while(i<n && (buf[i]==10 || buf[i]==13))i++;buf[en]=0;I64 c=st;while(c<en && buf[c]!=':')c++;if(c>=en)continue;buf[c]=0;U8 *k=buf+st,*v=buf+c+1;
  if(!strcmp(k,"mp_username")){strncpy(g29_opt.username,v,16);g29_opt.username[16]=0;}
  else if(!strcmp(k,"game_difficulty"))g29_opt.difficulty=MC029_ReadF(v);
  else if(!strcmp(k,"game_thirdperson"))g29_opt.thirdPerson=MC029_ReadBool(v);
  else if(!strcmp(k,"mp_server_visible"))g29_opt.serverVisible=MC029_ReadBool(v);
  else if(!strcmp(k,"ctrl_sensitivity"))g29_opt.sensitivity=MC029_ReadF(v);
  else if(!strcmp(k,"ctrl_invertmouse"))g29_opt.invertMouse=MC029_ReadBool(v);
  else if(!strcmp(k,"ctrl_islefthanded"))g29_opt.lefty=MC029_ReadBool(v);
  else if(!strcmp(k,"ctrl_usetouchscreen"))g29_opt.useTouch=MC029_ReadBool(v);
  else if(!strcmp(k,"ctrl_usetouchjoypad"))g29_opt.splitControls=MC029_ReadBool(v);
  else if(!strcmp(k,"gfx_pixeldensity"))g29_opt.pixelDensity=MC029_ReadF(v);
  else if(!strcmp(k,"gfx_renderdistance"))g29_opt.viewDistance=MC029_ReadF(v);
  else if(!strcmp(k,"gfx_fancygraphics"))g29_opt.fancy=MC029_ReadBool(v);
  else if(!strcmp(k,"gfx_fancyskies"))g29_opt.fancySkies=MC029_ReadBool(v);
  else if(!strcmp(k,"gfx_animatetextures"))g29_opt.animateWater=MC029_ReadBool(v);
  else if(!strcmp(k,"gfx_hidegui"))g29_opt.hideGui=MC029_ReadBool(v);
  else if(!strcmp(k,"audio_sound"))g29_opt.sound=MC029_ReadF(v);}
 free(buf);if(g29_opt.pixelDensity<3)g29_opt.pixelDensity=3;if(g29_opt.pixelDensity>12)g29_opt.pixelDensity=12;if(g29_opt.viewDistance<0 || g29_opt.viewDistance>3)g29_opt.viewDistance=2;if(g29_opt.difficulty!=0 && g29_opt.difficulty!=2)g29_opt.difficulty=2;if(!g29_opt.username[0])strcpy(g29_opt.username,"Steve");}
// GameRenderer render distance table {192,128,64,32}; fog start = 0.7 * distance.
U0 MC029_ApplyViewDistance(){F32 t[4]={192,128,64,32};I32 v=g29_opt.viewDistance;if(v<0)v=0;if(v>3)v=3;g29_fogFar=t[v];I32 m[4]={7,5,3,2};g29_meshR=m[v];}

// ---- ScrollingPane (drag + inertia + fading scroll bar), vertical only ----
class MCScroll029 {F32 off,vel,max,bar;Bool active,drag;I32 x,y,w,h,downX,downY,lastY;F32 startOff;};
U0 MC029_ScrollSet(MCScroll029 *p,I32 x,I32 y,I32 w,I32 h,F32 content){p->x=x;p->y=y;p->w=w;p->h=h;p->max=content-h;if(p->max<0)p->max=0;if(p->off>p->max)p->off=p->max;if(p->off<0)p->off=0;}
U0 MC029_ScrollZero(MCScroll029 *p){p->off=0;p->vel=0;p->active=FALSE;p->drag=FALSE;p->bar=0;}
Bool MC029_ScrollPress(MCScroll029 *p){if(!MC029_Inside(p->x,p->y,p->w,p->h))return FALSE;p->active=TRUE;p->drag=FALSE;p->downX=g29_mx;p->downY=g29_my;p->lastY=g29_my;p->startOff=p->off;p->vel=0;return TRUE;}
U0 MC029_ScrollMove(MCScroll029 *p){if(!p->active)return;I32 d=g29_my-p->downY,dx=g29_mx-p->downX;if(!p->drag && (d>4 || d< -4 || dx>8 || dx< -8))p->drag=TRUE;if(p->drag && p->max>0){F32 o=p->startOff-d;if(o<0)o=0;if(o>p->max)o=p->max;p->off=o;p->bar=1;}}
U0 MC029_ScrollRelease(MCScroll029 *p){p->active=FALSE;}
U0 MC029_ScrollWheel(MCScroll029 *p,I32 a){if(p->max<=0)return;p->off-=a*20;p->vel=0;if(p->off<0)p->off=0;if(p->off>p->max)p->off=p->max;p->bar=1;}
U0 MC029_ScrollFrame(MCScroll029 *p){if(p->active && p->drag){p->vel=p->lastY-g29_my;p->lastY=g29_my;p->bar=1;}else if(!p->active){if(p->vel>0.3 || p->vel< -0.3){p->off+=p->vel;p->vel*=0.9;p->bar=1;if(p->off<0){p->off=0;p->vel=0;}if(p->off>p->max){p->off=p->max;p->vel=0;}}else{p->vel=0;p->bar-=0.04;if(p->bar<0)p->bar=0;}}}
U0 MC029_ScrollBar(MCScroll029 *p,U32 rgb){if(p->max<=0 || p->bar<=0)return;F32 bh=p->h*p->h/(p->h+p->max);if(bh<8)bh=8;F32 by=p->y+(p->h-bh)*p->off/p->max;I32 a=p->bar*255;if(a>255)a=255;MC029_Fill(p->x+p->w-2,by,p->x+p->w,by+bh,(a<<24)|rgb);MC029_White();}

// ---- Touch TextBox (TextBox::render / topRender) ----
class MCTextBox029 {I32 x,y,w,h,max,doneH;U8 text[176];U8 title[64];Bool focus,pressed,ascii;};
MCTextBox029 *g29_focus=NULL;MCButton029 g29_done;
U0 MC029_TextBoxInit(MCTextBox029 *t,U8 *title,I32 max,I32 doneH){memset(t,0,sizeof(MCTextBox029));strncpy(t->title,title,63);t->max=max;t->doneH=doneH;t->h=18;}
U0 MC029_TextBoxRender(MCTextBox029 *t){MC029_Fill(t->x,t->y,t->x+t->w,t->y+t->h,0xFF373535);MC029_DrawRect(t->x,t->y,t->x+t->w,t->y+t->h,0xFF676060,1);MC029_DrawText(t->text,t->x+5,t->y+5,0xFFFFFFFF,FALSE);MC029_White();}
U0 MC029_DoneSetup(MCTextBox029 *t){memset(&g29_done,0,sizeof(MCButton029));g29_done.id=90;g29_done.kind=1;g29_done.w=66;g29_done.h=t->doneH;g29_done.x=g29_gw-66;g29_done.y=0;g29_done.active=TRUE;g29_done.visible=TRUE;strcpy(g29_done.text,"Done");g29_done.normal=&g29_pBtn;g29_done.down=&g29_pBtnDown;}
U0 MC029_TextBoxTop(){MCTextBox029 *t=g29_focus;if(!t)return;MC029_DoneSetup(t);MC029_Fill(0,0,g29_gw,g29_gh,0xFF000000);MC029_DrawText(t->title,5,5,0xFFCCCCCC,FALSE);MC029_DrawRect(5,20,g29_gw-66-5,37,0xFFFFFFFF,1);U8 buf[192];strcpy(buf,t->text);if(getEpochTimeS()&1)strcat(buf,"_");MC029_DrawText(buf,10,25,0xFFFFFFFF,FALSE);MC029_RenderButton(&g29_done);MC029_White();}
Bool MC029_TextBoxPress(MCTextBox029 *t){t->pressed=MC029_Inside(t->x,t->y,t->w,t->h);return t->pressed;}
Bool MC029_TextBoxRelease(MCTextBox029 *t){Bool hit=t->pressed && MC029_Inside(t->x,t->y,t->w,t->h);t->pressed=FALSE;if(hit){g29_focus=t;MC029_DrainText();}return hit;}
Bool MC029_ValidChar(MCTextBox029 *t,I32 c){if(c<32 || c>126)return FALSE;if(!t->ascii)return TRUE;U8 *ok="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890?^~'-_.,;<>!\"#&()=` []{}";I32 i;for(i=0;ok[i];i++)if(ok[i]==c)return TRUE;return FALSE;}
U0 MC029_TextBoxChars(){MCTextBox029 *t=g29_focus;I32 c;while((c=hc029_text())>=0){if(!t)continue;I32 n=strlen(t->text);if(n<t->max && MC029_ValidChar(t,c)){t->text[n]=c;t->text[n+1]=0;}}}
// returns TRUE when the key was consumed by a focused text box
Bool MC029_TextBoxKey(I32 key){MCTextBox029 *t=g29_focus;if(!t)return FALSE;if(key==8){I32 n=strlen(t->text);if(n>0)t->text[n-1]=0;return TRUE;}if(key==13 || key==27){g29_focus=NULL;return TRUE;}return TRUE;}

// ---- Local world list (LocalServerListItemElement data from each world's level.dat) ----
class MCWorld029 {U8 dir[256];U8 name[64];I32 seed,gameType,lastPlayed;};
MCWorld029 g29_world[64];I32 g29_worldN=0;
U0 MC029_ScanWorlds(){g29_worldN=0;mkdir("worlds",493);U0 *d=opendir("worlds");if(!d)return;MCNativeDirent *e;
 while(g29_worldN<64){e=readdir(d);if(!e)break;if(e->name[0]=='.')continue;if(e->type!=4 && e->type!=0)continue;U8 path[512];snprintf(path,512,"worlds/%s",e->name);U8 act[4096];if(hc028_active(path,act,4096)<1)continue;LevelData ld;LevelData_Init(&ld);
  if(ExternalFileLevelStorage_readLevelData(act,&ld)){MCWorld029 *w=&g29_world[g29_worldN++];strncpy(w->dir,e->name,255);w->dir[255]=0;w->name[0]=0;if(ld.levelName.data){strncpy(w->name,ld.levelName.data,63);w->name[63]=0;}if(!w->name[0])strncpy(w->name,e->name,63);w->seed=ld.seed;w->gameType=ld.gameType;w->lastPlayed=ld.lastPlayed;}LevelData_Destroy(&ld);}
 closedir(d);I32 i,j;for(i=1;i<g29_worldN;i++){MCWorld029 v=g29_world[i];j=i;while(j>0 && g29_world[j-1].lastPlayed<v.lastPlayed){g29_world[j]=g29_world[j-1];j--;}g29_world[j]=v;}}
Bool MC029_DirExists(U8 *path){U0 *d=opendir(path);if(!d)return FALSE;closedir(d);return TRUE;}
