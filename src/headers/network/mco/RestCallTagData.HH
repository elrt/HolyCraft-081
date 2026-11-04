// Batch 002. Source: minecraftpe/headers/network/mco/RestCallTagData.hpp
#ifndef MCPE_HEADERS_NETWORK_MCO_RESTCALLTAGDATA_HPP
#define MCPE_HEADERS_NETWORK_MCO_RESTCALLTAGDATA_HPP
class RestCallTagData { U64 guid_g; MCString str; };
U0 RestCallTagData_Init(RestCallTagData *self) { MCString_Init(&self->str); self->guid_g=0;}
U0 RestCallTagData_Destroy(RestCallTagData *self) { MCString_Destroy(&self->str); }
U0 RestCallTagData_InitGuid(RestCallTagData *self,U64 guid) { MCString_Init(&self->str); self->guid_g=guid; }

#endif

