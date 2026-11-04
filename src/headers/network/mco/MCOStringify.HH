// Batch 018, minecraftpe/headers/network/mco/MCOStringify.hpp.
#ifndef MCPE_MCO_STRINGIFY_HH
#define MCPE_MCO_STRINGIFY_HH
U0 MCOStringify_authenticate(MCString *out,MCString *username,MCString *password,MCString *version);
U0 MCOStringify_refresh(MCString *out,MCString *accessToken,MCString *clientToken,MCString *ignored,MCString *version);
U0 MCOStringify_signOut(MCString *out,MCString *accessToken,MCString *clientToken);
#endif
