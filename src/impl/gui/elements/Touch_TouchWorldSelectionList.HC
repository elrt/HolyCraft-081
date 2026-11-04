// Batch026; algorithms and omissions documented in docs/BATCH026.md.
U0 TouchWorldSelectionList_Init(TouchWorldSelectionList *s,I32 width,I32 height){memset(s,0,sizeof(TouchWorldSelectionList));WorldSelectionList_Init(&s->base,width,height);s->base.list.top=24;s->base.list.count=1;}
U0 TouchWorldSelectionList_commit(TouchWorldSelectionList *s){WorldSelectionList_commit(&s->base);s->base.list.count=s->base.items.size+1;}
I32 TouchWorldSelectionList_getNumberOfItems(TouchWorldSelectionList *s){return s->base.items.size+1;}
U0 TouchWorldSelectionList_step(TouchWorldSelectionList *s,I32 dir){WorldSelectionList *b=&s->base;if(dir<0 && b->selected<=0)return;if(dir>0 && (b->selected<0 || b->selected>=b->list.count))return;F32 pos=b->list.scroll;I32 width=b->list.slotWidth;b->from=pos;b->time=0;b->duration=8;b->tween=TRUE;F32 center=b->selected*width+(width-b->list.width)*0.5;b->to=pos+dir*width-(pos-center)(I32);WorldSelectionList_tweenInited(b);b->list.delta=0;}
U0 TouchWorldSelectionList_selectStart(TouchWorldSelectionList *s,I32 index){if(s->base.selected==s->base.items.size && index==s->base.selected)s->createPressed=TRUE;}
U0 TouchWorldSelectionList_selectCancel(TouchWorldSelectionList *s){s->createPressed=FALSE;}
U0 TouchWorldSelectionList_selectItem(TouchWorldSelectionList *s,I32 index,Bool ignored){WorldSelectionList *b=&s->base;if(b->selected<0)return;I32 delta=index-b->selected;if(delta==-1)TouchWorldSelectionList_step(s,-1);else if(delta==1)TouchWorldSelectionList_step(s,1);else if(!delta && !b->activated && index<=b->items.size){b->activation=index;b->activated=TRUE;if(index<b->items.size)LevelSummary_Assign(&b->chosen,MCVector_At(&b->items,index));}}
U0 TouchWorldSelectionList_tick(TouchWorldSelectionList *s,Bool down){WorldSelectionList_tick(&s->base,down);}
U0 TouchWorldSelectionList_Destroy(TouchWorldSelectionList *s){WorldSelectionList_Destroy(&s->base);}
