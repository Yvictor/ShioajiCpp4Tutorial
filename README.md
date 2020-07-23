# ShioajiCpp4Tutorial


### build the share library

```
g++ -shared -fPIC -I include src/shioaji.cpp -o libshioaji.so
```

### use share library in excutable

```
g++ main.cpp -I include -L . -lshioaji -o simple
```

### put it into Makefile
```
make clean
make
./simple
```