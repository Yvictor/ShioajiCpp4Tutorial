#include <unistd.h>
#include "solClient.h"
#include "shioaji.h"

void expose_api_func(){
    solClient_initialize(SOLCLIENT_LOG_DEFAULT_FILTER, NULL);
    std::cout << "user our library expose function.\n"
    "inside this library use solclient library.\n";
}