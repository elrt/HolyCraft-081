// Batch 003. Source: minecraftpe/headers/network/mco/MCOServerListItem.hpp
#ifndef MCPE_HEADERS_NETWORK_MCO_MCOSERVERLISTITEM_HPP
#define MCPE_HEADERS_NETWORK_MCO_MCOSERVERLISTITEM_HPP
class MCOServerListItem { I64 serverId;MCString worldName;Bool open;MCString ownerName;Bool myWorld;I32 maxNrPlayers;MCString gamemodeName;MCVector playerNames,invited; };
U0 MCOServerListItem_Init(MCOServerListItem *self) { memset(self,0,sizeof(MCOServerListItem));MCString_FromC(&self->worldName,"My World");MCString_FromC(&self->gamemodeName,"creative");MCString_Init(&self->ownerName);MCStringVector_Init(&self->playerNames);MCStringVector_Init(&self->invited); }
U0 MCOServerListItem_Destroy(MCOServerListItem *self) { MCString_Destroy(&self->worldName);MCString_Destroy(&self->ownerName);MCString_Destroy(&self->gamemodeName);MCStringVector_Destroy(&self->playerNames);MCStringVector_Destroy(&self->invited); }
U0 MCOServerListItem_CopyInit(MCOServerListItem *self,MCOServerListItem *other) { self->serverId=other->serverId;self->open=other->open;self->myWorld=other->myWorld;self->maxNrPlayers=other->maxNrPlayers;MCString_CopyInit(&self->worldName,&other->worldName);MCString_CopyInit(&self->ownerName,&other->ownerName);MCString_CopyInit(&self->gamemodeName,&other->gamemodeName);MCStringVector_Copy(&self->playerNames,&other->playerNames);MCStringVector_Copy(&self->invited,&other->invited); }
MCOServerListItem *MCOServerListItem_Assign(MCOServerListItem *self,MCOServerListItem *other) { if(self!=other){MCOServerListItem_Destroy(self);MCOServerListItem_CopyInit(self,other);}return self; }
U0 MCOServerListItem_MoveInit(MCOServerListItem *self,MCOServerListItem *other) { *self=*other;memset(other,0,sizeof(MCOServerListItem));MCStringVector_Init(&other->playerNames);MCStringVector_Init(&other->invited); }
MCOServerListItem *MCOServerListItem_MoveAssign(MCOServerListItem *self,MCOServerListItem *other) { if(self!=other){MCOServerListItem_Destroy(self);MCOServerListItem_MoveInit(self,other);}return self; }
U0 MCOServerListItem_Invite(MCOServerListItem *self,MCString *name) { I64 i;for(i=0;i<self->invited.size;i++){MCString *current=MCVector_At(&self->invited,i);I32 cmp=MCString_Compare(name,current);if(cmp==0)return;if(cmp<0)break;}MCString copy;MCString_CopyInit(&copy,name);MCVector_Insert(&self->invited,i,&copy); }

#endif

