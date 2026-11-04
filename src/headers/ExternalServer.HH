// Port batch 001. Upstream: minecraftpe/headers/ExternalServer.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_EXTERNALSERVER_HPP
#define MCPE_HEADERS_EXTERNALSERVER_HPP
class ExternalServer { I32 id; MCString name,ip; I32 port; };
U0 ExternalServer_Init(ExternalServer *self) { MCString_Init(&self->name); MCString_Init(&self->ip); }
U0 ExternalServer_InitValues(ExternalServer *self,I32 id,MCString *name,MCString *ip,I32 port) {
 self->id=id; MCString_CopyInit(&self->name,name); MCString_CopyInit(&self->ip,ip); self->port=port;
}
U0 ExternalServer_CopyInit(ExternalServer *self,ExternalServer *other) {
 ExternalServer_InitValues(self,other->id,&other->name,&other->ip,other->port);
}
U0 ExternalServer_MoveInit(ExternalServer *self,ExternalServer *other) {
 self->id=other->id; self->port=other->port;
 MCString_MoveInit(&self->name,&other->name); MCString_MoveInit(&self->ip,&other->ip);
}
ExternalServer *ExternalServer_Assign(ExternalServer *self,ExternalServer *other) {
 self->id=other->id; self->port=other->port;
 MCString_Assign(&self->name,&other->name); MCString_Assign(&self->ip,&other->ip); return self;
}
U0 ExternalServer_Destroy(ExternalServer *self) { MCString_Destroy(&self->name); MCString_Destroy(&self->ip); }

#endif

