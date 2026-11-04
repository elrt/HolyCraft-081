// Batch 005. Source: minecraftpe/headers/util/Worker.hpp
#ifndef MCPE_HEADERS_UTIL_WORKER_HPP
#define MCPE_HEADERS_UTIL_WORKER_HPP
class Worker { ThreadCollection *threadCollection; };
U0 Worker_Init(Worker *self,ThreadCollection *pool);
U0 Worker_call(Worker *self);U0 *Worker_Entry(U0 *arg);

#endif

