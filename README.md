# ShioajiCpp4Tutorial

#### in this section we directly use Makefile to manage the command

### prepare the solclient library for later use

```
make prepare-solace-lib
```

### build our share library with static link to solclient

See the compiler change detail inside Makefile

```
make shioaji-static
```

### build our share library with dynamic link to solclient

```
make shioaji
```

### check the link of solclient
```
ldd libshioaji.so
```

### make simple without change
```
make clean
make
./simple
```