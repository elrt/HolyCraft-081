// Batch 002. Source: minecraftpe/headers/network/mco/LoginInformation.hpp
#ifndef MCPE_HEADERS_NETWORK_MCO_LOGININFORMATION_HPP
#define MCPE_HEADERS_NETWORK_MCO_LOGININFORMATION_HPP
class LoginInformation { MCString accessToken,clientId,profileId,profileName; };
U0 LoginInformation_Init(LoginInformation *self) { MCString_Init(&self->accessToken); MCString_Init(&self->clientId); MCString_Init(&self->profileId); MCString_Init(&self->profileName); }
U0 LoginInformation_Destroy(LoginInformation *self) { MCString_Destroy(&self->accessToken); MCString_Destroy(&self->clientId); MCString_Destroy(&self->profileId); MCString_Destroy(&self->profileName); }

#endif

