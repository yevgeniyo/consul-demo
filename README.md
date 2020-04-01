## Purpose

```
This repo was created for Consul POC
Once you run this setup, you will get:
 
- 3 consul servers
- 3 nginx servers with consul agents

1. Every Nginx server has ow tag and can be reached by <tag>.<service-name>.service.consul

    Example:
        nginx1.web.service.consul
        nginx2.web.service.consul
        nginx3.web.service.consul

2. Or all servers by load balancing to <service-name>.service.consul

    Example:
        web.service.consul

3. Service web has 2 healthchecks:
    a. port 80 accessible
    b. mem is low than 70%

Useful commands:
    - dig web.service.consul @127.0.0.1 SRV
    - dig web.service.consul @127.0.0.1 ANY
    - consul members
    - UI works on localhost:8600   
```

## Build and run

### Build

```
docker-compose build
```

### Run

```
docker-compose up
```

### Build and run in one command

```
docker-compose up --build -d
```