// Batch 018: source minecraftpe/headers/network/mco/MCOPayloadPacker.hpp.
#ifndef MCPE_MCO_PAYLOAD_PACKER_HH
#define MCPE_MCO_PAYLOAD_PACKER_HH
class MCOPayloadPacker { Random *random; };
U0 MCOPayloadPacker_Init(MCOPayloadPacker *self,Random *rng);
Bool MCOPayloadPacker_readControlPackage(ControllerData *out,U8 *src,U32 count);
U0 MCOPayloadPacker_writeBitStream(MCOPayloadPacker *self,MCString *out,I64 value,MCString *payload);
U0 MCOPayloadPacker_writeControllPackage(MCString *out,ControllerData *data);
#endif
