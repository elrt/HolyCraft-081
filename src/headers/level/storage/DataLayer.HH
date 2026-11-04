// Batch 002. Source: minecraftpe/headers/level/storage/DataLayer.hpp
#ifndef MCPE_HEADERS_LEVEL_STORAGE_DATALAYER_HPP
#define MCPE_HEADERS_LEVEL_STORAGE_DATALAYER_HPP
class DataLayer { I32 layerSize; U8 *data; I32 layerSize2; };
U0 DataLayer_Init(DataLayer *self,I32 size) {
 self->layerSize=size>>1; self->data=MC_Alloc(self->layerSize); MemSet(self->data,0,self->layerSize); self->layerSize2=self->layerSize;
}
I32 DataLayer_get(DataLayer *self,I32 x,I32 y,I32 z) {
 I32 index=y|(x<<11)|(z<<7); U8 value=self->data[index>>1]; if(index&1) return value>>4; return value&15;
}
U0 DataLayer_set(DataLayer *self,I32 x,I32 y,I32 z,I32 value) {
 I32 index=y|(x<<11)|(z<<7); U8 byte=self->data[index>>1];
 if(index&1) byte=(byte&15)|(16*value); else byte=(value&15)|(byte&240); self->data[index>>1]=byte;
}
U0 DataLayer_Destroy(DataLayer *self) { free(self->data); self->data=NULL; }

#endif

