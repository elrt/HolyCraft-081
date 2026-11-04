// Batch 004. Source: minecraftpe/headers/ICreator.hpp
#ifndef MCPE_HEADERS_ICREATOR_HPP
#define MCPE_HEADERS_ICREATOR_HPP
class CreatorTileEvent { I32 field_0,field_4,field_8,field_C,field_10; };
class CreatorTimedEvent { I32 time; CreatorTileEvent event; };
class CreatorEventList { I32 field_0,count,field_8; CreatorTimedEvent *events; };
class ICreator { CreatorEventList *(*getEventList)(ICreator *self); U0 (*destroy)(ICreator *self); };
U0 CreatorTileEvent_write(CreatorTileEvent *self,MCString *out,IPosTranslator *translator) { I32 x=self->field_4,y=self->field_8,z=self->field_C;U8 s[100];IPosTranslator_toInt(translator,&x,&y,&z);snprintf(s,100,"%d,%d,%d,%d,%d",x,y,z,self->field_10,self->field_0);I64 n=MC_StrLen(s);U8 *joined=MC_Alloc(out->size+n+1);if(out->size)memcpy(joined,out->data,out->size);memcpy(joined+out->size,s,n+1);free(out->data);out->data=joined;out->size+=n; }
U0 CreatorEventList_write(CreatorEventList *self,MCString *out,IPosTranslator *translator,I32 clientTime) { I32 checked=0,index=self->field_0+1;while(checked<self->count) { if(index==self->count)index=0;if(self->events[index].time>=clientTime) { if(index>=0) { while(TRUE) { CreatorTileEvent_write(&self->events[index].event,out,translator);if(index==self->field_0)break;U8 *data=MC_Alloc(out->size+2);if(out->size)memcpy(data,out->data,out->size);data[out->size]='|';data[out->size+1]=0;free(out->data);out->data=data;out->size++;if(++index==self->count)index=0; } }break; }index++;checked++; } }

#endif

