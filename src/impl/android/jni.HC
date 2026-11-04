// Source JNI event/lifecycle intent through an explicit host ABI; NOT loadable JNI exports.
U0 MCNative027_Init(MCNative027 *s){memset(s,0,sizeof(MCNative027));s->width=854;s->height=480;MCString_FromC(&s->nativeUtf8Input,"");}
U0 MCNative027_Destroy(MCNative027 *s){MCString_Destroy(&s->nativeUtf8Input);}
Bool MCNative027_Text(MCNative027 *s,U8 *text){U8 *n=utf8proc_NFC(text);if(!n)return FALSE;MC027_SetC(&s->nativeUtf8Input,n);free(n);return TRUE;}
U0 MCNative027_Resize(MCNative027 *s,I32 w,I32 h){if(w<=0 || h<=0)return;s->width=w;s->height=h;s->contextWasLost=TRUE;if(s->event!=NULL)s->event(s->context,3,w,h,0,0);}
U0 MCNative027_Input(MCNative027 *s,I32 kind,I32 x,I32 y,I32 id,I32 value){if(id<0 || id>11)return;if(s->event!=NULL)s->event(s->context,kind,x,y,id,value);}
