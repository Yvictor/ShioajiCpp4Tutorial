CPPFLAGS=-std=c++11 -Wall
CPPFLAGS_SHARED=$(CPPFLAGS) -shared -fPIC
SOLCLIENT_FOLDER=$(shell pwd)/solclient-7.14.0.8/
CPPFLAGS_SOL=-I $(SOLCLIENT_FOLDER)include/solclient -L $(SOLCLIENT_FOLDER)lib -lsolclient -lstdc++ -lpthread
CPPFLAGS_SOL_STATIC_LINK=-I $(SOLCLIENT_FOLDER)include/solclient $(SOLCLIENT_FOLDER)lib/libsolclient.a -lstdc++ -lpthread -lrt


all: shioaji simple

prepare-solace-lib:
	curl -L https://products.solace.com/download/C_API_LINUX64 -o solclient.tar.gz
	tar xvzf solclient.tar.gz

simple:
	g++ $(CPPFLAGS) main.cpp -I include -L . -lshioaji -Wl,-rpath='$$ORIGIN' -o simple


shioaji: src/shioaji.cpp
	g++ $^ $(CPPFLAGS_SHARED) $(CPPFLAGS_SOL) -Wl,-rpath='$$ORIGIN:solclient-7.14.0.8/lib/' -I include -o libshioaji.so


shioaji-static: src/shioaji.cpp
	g++ $^ $(CPPFLAGS_SHARED) $(CPPFLAGS_SOL_STATIC_LINK) -I include -o libshioaji.so


clean:
	- rm simple
	- rm libshioaji.so*