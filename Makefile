all: shioaji simple

simple:
	g++ main.cpp -I include -L . -lshioaji -o simple

shioaji:
	g++ -shared -fPIC -I include src/shioaji.cpp -o libshioaji.so

clean:
	- rm simple
	- rm libshioaji.so*