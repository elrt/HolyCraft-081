// Batch 002. Source: minecraftpe/headers/network/ConnectedClient.hpp
#ifndef MCPE_HEADERS_NETWORK_CONNECTEDCLIENT_HPP
#define MCPE_HEADERS_NETWORK_CONNECTEDCLIENT_HPP
class ConnectedClient { I32 sock; MCString field_4; I32 time; };
U0 ConnectedClient_Init(ConnectedClient *self) { MCString_Init(&self->field_4); }
U0 ConnectedClient_Destroy(ConnectedClient *self) { MCString_Destroy(&self->field_4); }
U0 ConnectedClient_InitSocket(ConnectedClient *self,I32 socket) { MCString_Init(&self->field_4); self->sock=socket; self->time=0; }

#endif

