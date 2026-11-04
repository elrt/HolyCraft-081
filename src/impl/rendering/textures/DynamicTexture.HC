// Batch 003. Source: minecraftpe/impl/rendering/textures/DynamicTexture.cpp
U0 DynamicTexture_Init(DynamicTexture *self,TextureUVCoordinateSet *uv,I32 scale) { if(scale<=0 || scale>1024) exit(84);self->uv=*uv;self->field_18=scale;self->dataLength=(scale*scale)<<10;self->data=MC_Alloc(self->dataLength);memset(self->data,0,self->dataLength);self->tickFn=NULL; }
U0 DynamicTexture_Destroy(DynamicTexture *self) { free(self->data);self->data=NULL;self->dataLength=0; }

