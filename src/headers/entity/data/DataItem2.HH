#ifndef MC021_ENTITY_DATA_DATAITEM2
#define MC021_ENTITY_DATA_DATAITEM2
class DataItem2: DataItem {I8 byteValue;I16 shortValue;I32 intValue;F32 floatValue;MCString stringValue;MCPacketItem009 itemValue;Pos posValue;};
U0 DataItem2_DestroyValue(DataItem *b);
DataItem2 *DataItem2_New(I32 type,I32 id);
DataItem2 *DataItem2_NewByte(I32 id,I8 v);
DataItem2 *DataItem2_NewShort(I32 id,I16 v);
DataItem2 *DataItem2_NewInt(I32 id,I32 v);
DataItem2 *DataItem2_NewFloat(I32 id,F32 v);
DataItem2 *DataItem2_NewString(I32 id,MCString *v);
DataItem2 *DataItem2_NewItem(I32 id,MCPacketItem009 *v);
DataItem2 *DataItem2_NewPos(I32 id,Pos *v);
Bool DataItem2_ValueEqual(DataItem2 *a,DataItem2 *b);
U0 DataItem2_CopyValue(DataItem2 *a,DataItem2 *b);
U0 DataItem2_Delete(DataItem2 *s);
U0 DataItem2_DeleteList(MCPtrVector *list);

U0 DataItem2_DestroyValue(DataItem *b) {DataItem2 *s=b;MCString_Destroy(&s->stringValue);}
DataItem2 *DataItem2_New(I32 type,I32 id) {if(type<0 || type>6)return NULL;DataItem2 *s=MC_Alloc(sizeof(DataItem2));memset(s,0,sizeof(DataItem2));DataItem_Init(s,type,id);s->destroyFn=&DataItem2_DestroyValue;MCString_Init(&s->stringValue);return s;}
DataItem2 *DataItem2_NewByte(I32 id,I8 v) {DataItem2 *s=DataItem2_New(0,id);s->byteValue=v;return s;}
DataItem2 *DataItem2_NewShort(I32 id,I16 v) {DataItem2 *s=DataItem2_New(1,id);s->shortValue=v;return s;}
DataItem2 *DataItem2_NewInt(I32 id,I32 v) {DataItem2 *s=DataItem2_New(2,id);s->intValue=v;return s;}
DataItem2 *DataItem2_NewFloat(I32 id,F32 v) {DataItem2 *s=DataItem2_New(3,id);s->floatValue=v;return s;}
DataItem2 *DataItem2_NewString(I32 id,MCString *v) {DataItem2 *s=DataItem2_New(4,id);MCString_Assign(&s->stringValue,v);return s;}
DataItem2 *DataItem2_NewItem(I32 id,MCPacketItem009 *v) {DataItem2 *s=DataItem2_New(5,id);s->itemValue=*v;return s;}
DataItem2 *DataItem2_NewPos(I32 id,Pos *v) {DataItem2 *s=DataItem2_New(6,id);s->posValue=*v;return s;}
Bool DataItem2_ValueEqual(DataItem2 *a,DataItem2 *b) {if(a->typeId!=b->typeId)return FALSE;switch(a->typeId){case 0:return a->byteValue==b->byteValue;case 1:return a->shortValue==b->shortValue;case 2:return a->intValue==b->intValue;case 3:return a->floatValue==b->floatValue;case 4:return MCString_Equal(&a->stringValue,&b->stringValue);case 5:return a->itemValue.id==b->itemValue.id && a->itemValue.count==b->itemValue.count && a->itemValue.aux==b->itemValue.aux;case 6:return Pos_Equal(&a->posValue,&b->posValue);}return FALSE;}
U0 DataItem2_CopyValue(DataItem2 *a,DataItem2 *b) {a->byteValue=b->byteValue;a->shortValue=b->shortValue;a->intValue=b->intValue;a->floatValue=b->floatValue;MCString_Assign(&a->stringValue,&b->stringValue);a->itemValue=b->itemValue;a->posValue=b->posValue;}
U0 DataItem2_Delete(DataItem2 *s) {if(s){DataItem_Destroy(s);free(s);}}
U0 DataItem2_DeleteList(MCPtrVector *list) {I64 i;for(i=0;i<list->size;i++)DataItem2_Delete(list->data[i]);MCPtrVector_Destroy(list);}

#endif
