// Explicit injected bootstrap instead of launching an unsupported SDL/JNI application.
Bool MCMain027_Run(MCBoot027 *h,I32 maxTicks){if(!h || !h->init || !h->tick || !h->render || maxTicks<0)return FALSE;if(!h->init(h->context))return FALSE;I32 i;for(i=0;i<maxTicks;i++){if(!h->tick(h->context))break;h->render(h->context);}if(h->shutdown!=NULL)h->shutdown(h->context);return TRUE;}
