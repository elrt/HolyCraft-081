// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class PathFinder {MCWorld024 *world;MCPtrVector nodes;BinaryHeap heap;Bool passDoors,openDoors,avoidWater,canFloat,limited;I32 maxNodes;};

U0 PathFinder_Init(PathFinder *s,MCWorld024 *world,Bool passDoors,Bool openDoors,Bool avoidWater,Bool canFloat);
U0 PathFinder_reset(PathFinder *s);
U0 PathFinder_Destroy(PathFinder *s);
Node *PathFinder_getNode(PathFinder *s,I32 x,I32 y,I32 z);
I32 PathFinder_isFree(PathFinder *s,MCBody023 *body,I32 x,I32 y,I32 z,Node *size);
Node *PathFinder_walkNode(PathFinder *s,MCBody023 *body,I32 x,I32 y,I32 z,Node *size,I32 step);
Path *PathFinder_reconstruct(Node *end);
Path *PathFinder_search(PathFinder *s,MCBody023 *body,Node *start,Node *goal,Node *size,F32 range);
Path *PathFinder_findPath(PathFinder *s,MCBody023 *body,F32 x,F32 y,F32 z,F32 range);
