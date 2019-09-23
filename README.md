## private testnet for wanchain

### build
```
docker build -t wanchain ./
```

### setup custom network
```
docker network create --subnet=172.18.0.0/16 mynetwork
```

### run validator1
```
docker run -it -d -p 58545:8545 --network mynetwork --ip 172.18.1.1 --name validator1 wanchain --etherbase 0xe7e614b0461c489f6f4afc4b6c13d0ccd040ad74 --unlock 0xe7e614b0461c489f6f4afc4b6c13d0ccd040ad74 --syncmode full
```

### get node id
```
$ gwan attach http://127.0.0.1:58545
Welcome to the gwan JavaScript console!

 modules: admin:1.0 eth:1.0 net:1.0 personal:1.0 pos:1.0 rpc:1.0 txpool:1.0 wan:1.0

> admin.nodeInfo.id
"11a1bd2b37c1b90416aeb3630be79d6ee3c3d6892f5aadc8fb686053f03bbaffac8de14b97d92173ffb15135d2c42315273aab9a77e20c494f94e74d069f5600"

> exit
```

### run validator2
```
docker run -it -d -p 58546:8545 --network mynetwork --ip 172.18.1.2 --name validator2 wanchain --etherbase 0x2ddddaf22E5A3FBAF4E8a154A736700BF6DFdADD --unlock 0x2ddddaf22E5A3FBAF4E8a154A736700BF6DFdADD --syncmode full
```

### add peer
```
$ gwan attach http://127.0.0.1:58546
Welcome to the gwan JavaScript console!

 modules: admin:1.0 eth:1.0 net:1.0 personal:1.0 pos:1.0 rpc:1.0 txpool:1.0 wan:1.0

> admin.addPeer("enode://<nodeid>@172.18.1.1:17717")
true
> exit
```

### logs
```
docker logs -f validator1
```

### rpc
```
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' http://127.0.0.1:58545
```

