// Batch 002. Source: minecraftpe/impl/perf/StopwatchHandler.cpp
U0 StopwatchHandler_clear(StopwatchHandler *self,MCString *name) {
 I64 i; for(i=0;i<self->entries.size;i++) { StopwatchEntry *entry=MCVector_At(&self->entries,i);
  if(MCString_Equal(&entry->name,name)) { if(entry->watch) { Stopwatch_Destroy(entry->watch); free(entry->watch); } MCString_Destroy(&entry->name); MCVector_Erase(&self->entries,i); return; }
 }
}
U0 StopwatchHandler_clearAll(StopwatchHandler *self) {
 I64 i; for(i=0;i<self->entries.size;i++) { StopwatchEntry *entry=MCVector_At(&self->entries,i); if(entry->watch) { Stopwatch_Destroy(entry->watch); free(entry->watch); } MCString_Destroy(&entry->name); } self->entries.size=0;
}
Stopwatch *StopwatchHandler_get(StopwatchHandler *self,MCString *name) {
 I64 i; for(i=0;i<self->entries.size;i++) { StopwatchEntry *entry=MCVector_At(&self->entries,i); if(MCString_Equal(&entry->name,name)) return entry->watch; }
 StopwatchEntry entry; MCString_CopyInit(&entry.name,name); entry.watch=MC_Alloc(sizeof(Stopwatch)); Stopwatch_Init(entry.watch);
 I64 pos=0; while(pos<self->entries.size) { StopwatchEntry *other=MCVector_At(&self->entries,pos); if(MCString_Compare(&other->name,name)>0) break; pos++; }
 MCVector_Insert(&self->entries,pos,&entry); return entry.watch;
}
U0 StopwatchHandler_print(StopwatchHandler *self) { I64 i; for(i=0;i<self->entries.size;i++) { StopwatchEntry *entry=MCVector_At(&self->entries,i); Stopwatch_print(entry->watch,&entry->name); } }
U0 StopwatchHandler_printEvery(StopwatchHandler *self,I32 every) { I32 next=self->field_18+1; if(next>=every) { self->field_18=0; StopwatchHandler_print(self); } else self->field_18=next; }

