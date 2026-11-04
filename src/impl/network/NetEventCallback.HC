// All default C++ packet overloads are no-ops, represented by one generic receiver.
U0 NetEventCallback_DefaultHandle(U0 *ctx,U64 guid,I32 id,Packet *packet) {}
U0 NetEventCallback_Init(NetEventCallback *s,MCNetHost021 *h) {s->host=h;s->receiver.context=s;s->receiver.handle=&NetEventCallback_DefaultHandle;}
MCNetPlayer021 *NetEventCallback_findPlayerGuid(NetEventCallback *s,U64 guid) {I64 i;for(i=0;i<s->host->players->size;i++){MCNetPlayer021 *p=s->host->players->data[i];if(p->guid==guid)return p;}return NULL;}
MCNetPlayer021 *NetEventCallback_findPlayerId(NetEventCallback *s,I32 id) {MCNetHost021 *h=s->host;MCNetPlayer021 *p=h->entity(h->ctx,id);if(!p)return NULL;if(!p->isPlayer){h->queryType(h->ctx,p);return NULL;}return p;}
MCNetPlayer021 *NetEventCallback_findPlayer(NetEventCallback *s,I32 id,U64 *guid) {MCNetPlayer021 *p=NULL;if(id!=-1)p=NetEventCallback_findPlayerId(s,id);if(p)return p;if(guid)return NetEventCallback_findPlayerGuid(s,*guid);return NULL;}
U0 NetEventCallback_handleRespawn(NetEventCallback *s,U64 guid,RespawnPacket *packet) {MCNetPlayer021 *p=NetEventCallback_findPlayer(s,packet->eid,NULL);if(!p)return;MCNetHost021 *h=s->host;h->move(h->ctx,p,(packet->x)(F32),(packet->y)(F32),(packet->z)(F32),(p->yaw)(F32),(p->pitch)(F32));h->reset(h->ctx,p);h->resetPos(h->ctx,p,TRUE);}
Bool NetEventCallback_allowIncomingPacketId(NetEventCallback *s,U64 guid,I32 id) {return FALSE;}
U0 NetEventCallback_event(NetEventCallback *s,I32 event,U0 *data) {}
