#ifndef MCPE_BATCH009_PLACEMENT_SUPPORT
#define MCPE_BATCH009_PLACEMENT_SUPPORT
class MCPlaceTile009 { I32 id;Bool replaceable,isPlant;U8 *soundName;F32 soundVolume,soundPitch; };
class MCPlaceContext009 { U0 *host;Bool allowInteract;I32 leaves,sapling,torch,glowingObsidian,lightGem;
 MCPlaceTile009 *(*tileInfo)(U0 *host,I32 tileID);
 Bool (*mayPlace)(U0 *host,I32 block,I32 x,I32 y,I32 z,Bool ignoreEntities,I32 side);
 I32 (*placementData)(U0 *host,I32 block,I32 x,I32 y,I32 z,I32 side,F32 fx,F32 fy,F32 fz,I32 aux);
 Bool (*setTileAndData)(U0 *host,I32 x,I32 y,I32 z,I32 block,I32 data,I32 flags);
 TextureUVCoordinateSet *(*texture)(U0 *host,I32 tileID,I32 side,I32 aux,Bool carried);
 TextureUVCoordinateSet *(*itemTexture)(U0 *host,U8 *name,I32 index);
 U8 *(*description)(U0 *host,I32 tileID,MCPacketItem009 *item);
 U8 *(*typeDescription)(U0 *host,I32 tileID,I32 aux);
 U8 *(*translate)(U0 *host,U8 *key);
};
U0 MC009_joinStrings(MCString *out,U8 *a,U8 *b,U8 *c,U8 *d) { I64 n1=MC_StrLen(a),n2=MC_StrLen(b),n3=MC_StrLen(c),n4=MC_StrLen(d),n=n1+n2+n3+n4;U8 *buf=MC_Alloc(n+1);memcpy(buf,a,n1);memcpy(buf+n1,b,n2);memcpy(buf+n1+n2,c,n3);memcpy(buf+n1+n2+n3,d,n4);buf[n]=0;MCString_FromBytes(out,buf,n);free(buf); }
U0 MC009_placementSound(MCItemContext009 *c,MCPlaceTile009 *tile,I32 x,I32 y,I32 z) { F32 xx=x+0.5,yy=y+0.5,zz=z+0.5,v=(tile->soundVolume+1.0)*0.5,p=tile->soundPitch*0.8;c->soundAt(c->host,xx,yy,zz,tile->soundName,v,p); }
Bool MC009_isEmissive(MCPlaceContext009 *p,I32 id) { return id==p->torch || id==p->glowingObsidian || id==p->lightGem; }
#endif
