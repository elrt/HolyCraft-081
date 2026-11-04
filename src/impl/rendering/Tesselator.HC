// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
U0 Tesselator_Init(Tesselator *s,MCGeometry024 *host){memset(s,0,sizeof(Tesselator));MCVector_Init(&s->vertices,sizeof(MCVertex024));MCVector_Init(&s->indices,sizeof(U16));s->host=host;s->scale1=s->scale2=s->scale3=1;}
U0 Tesselator_Destroy(Tesselator *s){MCVector_Destroy(&s->vertices);MCVector_Destroy(&s->indices);}
U0 Tesselator_begin(Tesselator *s,I32 mode){if(s->drawing)return;s->vertices.size=s->indices.size=0;s->mode=mode;s->drawing=TRUE;s->noColor=FALSE;}
I32 MC024_ColorClamp(I32 v){if(v<0)return 0;if(v>255)return 255;return v;}
U0 Tesselator_color(Tesselator *s,I32 r,I32 g,I32 b,I32 a){if(!s->noColor)s->color=MC024_ColorClamp(r)|(MC024_ColorClamp(g)<<8)|(MC024_ColorClamp(b)<<16)|(MC024_ColorClamp(a)<<24);}
U0 Tesselator_normal(Tesselator *s,F32 x,F32 y,F32 z){s->nx=(x*127)(I32);s->ny=(y*127)(I32);s->nz=(z*127)(I32);}
U0 Tesselator_offset(Tesselator *s,F32 x,F32 y,F32 z){s->offsetX=x;s->offsetY=y;s->offsetZ=z;}
Bool Tesselator_vertex(Tesselator *s,F32 x,F32 y,F32 z){if(!s->drawing || s->vertices.size>=65536)return FALSE;MCVertex024 v;memset(&v,0,sizeof(v));v.x=s->scale2*(s->offsetX+x*s->scale3);v.y=s->scale1*(s->offsetY+y*s->scale3);v.z=s->offsetZ+z*s->scale3;v.u=s->u;v.v=s->v;v.color=s->color;v.nx=s->nx;v.ny=s->ny;v.nz=s->nz;MCVector_Push(&s->vertices,&v);return TRUE;}
Bool Tesselator_vertexUV(Tesselator *s,F32 x,F32 y,F32 z,F32 u,F32 v){s->u=u;s->v=v;return Tesselator_vertex(s,x,y,z);}
U0 Tesselator_quad(Tesselator *s,I32 base,Bool reverse){U16 a=base,b=base+1,c=base+2,d=base+3;if(reverse){a=base+3;b=base+2;c=base+1;d=base;}MCVector_Push(&s->indices,&a);MCVector_Push(&s->indices,&b);MCVector_Push(&s->indices,&c);MCVector_Push(&s->indices,&d);MCVector_Push(&s->indices,&a);MCVector_Push(&s->indices,&c);}
U0 Tesselator_end(Tesselator *s){if(!s->drawing)return;s->drawing=FALSE;if(s->mode==7){I32 i;for(i=0;i+3<s->vertices.size;i+=4)Tesselator_quad(s,i,FALSE);s->mode=4;}}
U0 Tesselator_draw(Tesselator *s){Tesselator_end(s);if(s->vertices.size && s->host && s->host->draw!=NULL)s->host->draw(s->host->ctx,s->vertices.data(MCVertex024*),s->vertices.size,s->indices.data(U16*),s->indices.size,s->mode);}
