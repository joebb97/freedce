# A free implementation of DCE RPC

With a mostly working debian container

# Doing things in a container

## Build it

`docker build -t joey/freedce:latest .`

## Run it

`docker run --rm -it joey/freedce:latest`

## Start the daemon

```bash
root@0b19264c9ed7:/freedce/freedce# /opt/dce/bin/rpcd
(rpcd) initializing database
(rpcd) endpoint database object id: 5c1892e8-2c99-11ee-9f52-0242ac110002
(rpcd) got bindings:
    ncacn_ip_tcp:127.0.0.1[135]
    ncacn_ip_tcp:172.17.0.2[135]
    ncadg_ip_udp:127.0.0.1[135]
    ncadg_ip_udp:172.17.0.2[135]
(rpcd) listening...
```

## Start the server

```bash
~> docker exec -it 0b19264c9ed7 bash
Registering server....
registered.
Preparing binding handle...
registering bindings with endpoint mapper
registered.
Server's communications endpoints are:
	ncacn_ip_tcp:127.0.0.1[60000]
	ncacn_ip_tcp:172.17.0.2[60000]
	ncadg_ip_udp:127.0.0.1[60000]
	ncadg_ip_udp:172.17.0.2[60000]
listening for calls....
```

## Run the client

```bash
~> docker exec -it 0b19264c9ed7 bash
root@0b19264c9ed7:/freedce/freedce# /opt/dce/bin/echo_client -h localhost
fully resolving binding for server is: ncacn_ip_tcp:127.0.0.1[60000]
enter stuff:    ^D on an empty line when done


hey there friend!
calling server
got response from server. results:
	[0]: !dneirf ereht yeh

===================================
```

then the server prints
```
ReverseIt() called by client: ncacn_ip_tcp:127.0.0.1[39929]


Function ReverseIt() -- input argments
	[arg 0]: hey there friend!

=========================================
```
