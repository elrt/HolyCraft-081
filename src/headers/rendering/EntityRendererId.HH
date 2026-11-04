// Port batch 001. Upstream: minecraftpe/headers/rendering/EntityRendererId.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_RENDERING_ENTITYRENDERERID_HPP
#define MCPE_HEADERS_RENDERING_ENTITYRENDERERID_HPP
// EntityRendererId: represented as I32, not a C++ enum type.
#define ER_NONE 0
#define UNKNOWN 1
#define TNT 2
#define HUMANOID 3
#define ITEM_ENTITY 4
#define TRIPOD_CAMERA 5
#define CHICKEN 6
#define COW 7
#define PIG 8
#define SHEEP 9
#define ZOMBIE 11
#define SKELETON 12
#define SPIDER 13
#define CREEPER 14
#define ARROW 15
#define PLAYER 16
#define THROWNEGG 17
#define THROWNSNOWBALL 18
#define PAINTING 19
#define FALLINGTILE 20
#define MINECART 21
#define LENGTH 22
#endif

