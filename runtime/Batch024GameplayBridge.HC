
// Explicit copy bridge, not binary reinterpretation of the two inventory layouts.
U0 MC024_ImportInventory(FillingContainer *dst,Inventory *src){FillingContainer_Init(dst,src->registry,src->size,9,64,src->creative);I32 i;for(i=9;i<src->size;i++)FillingContainer_setItem(dst,i,src->items[i]);for(i=0;i<9;i++)dst->links[i]=src->links[i];}
Bool MC024_CommitInventory(Inventory *dst,FillingContainer *src){if(src->size!=dst->size || src->linkedCount!=9 || src->registry!=dst->registry)return FALSE;I32 i;ItemInstance *copies[96];memset(copies,0,sizeof(copies));if(src->size>96)return FALSE;for(i=9;i<src->size;i++)copies[i]=ItemInstance_clone(src->items[i]);for(i=9;i<src->size;i++){free(dst->items[i]);dst->items[i]=copies[i];}for(i=0;i<9;i++)dst->links[i]=src->links[i];return TRUE;}
