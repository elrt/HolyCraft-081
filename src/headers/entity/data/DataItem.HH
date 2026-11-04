// Port batch 001. Upstream: minecraftpe/headers/entity/data/DataItem.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_ENTITY_DATA_DATAITEM_HPP
#define MCPE_HEADERS_ENTITY_DATA_DATAITEM_HPP
class DataItem {
 I32 typeId,dataId; Bool dirty;
 Bool (*equalFn)(DataItem *self,DataItem *other);
 U0 (*destroyFn)(DataItem *self);
};
Bool DataItem_DefaultEqual(DataItem *self,DataItem *other) { return self->dataId==other->dataId; }
U0 DataItem_DefaultDestroy(DataItem *self) {}
U0 DataItem_Init(DataItem *self,I32 type,I32 data) {
 self->typeId=type; self->dataId=data; self->dirty=TRUE;
 self->equalFn=&DataItem_DefaultEqual; self->destroyFn=&DataItem_DefaultDestroy;
}
Bool DataItem_isDataEqual(DataItem *self,DataItem *other) { return self->equalFn(self,other); }
U0 DataItem_Destroy(DataItem *self) { self->destroyFn(self); }

#endif

