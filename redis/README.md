## Setting up Redis Cluster

### Source: Github (Dev only)

```
docker run -d -p 6379:6379 --name my-redis-dev d11wtq/redis
```

### PROD - Redis Sentinel cluster on Kubernetes - Use rancher

https://docs.bitnami.com/tutorials/deploy-redis-sentinel-production-cluster/

### To create a redis-client pod for testing

```
kubectl run my-redis-prod-cluster-1-client --rm --tty -i --restart='Never' --env REDIS_PASSWORD=uXQYypxqe0l60TR --image docker.io/bitnami/redis:5.0.8-debian-10-r33 -- bash
```

###### To connect to master via headless service

```
redis-cli -h my-redis-prod-cluster-1-master-0.my-redis-prod-cluster-1-headless.infra-common -a $REDIS_PASSWORD
```

###### To set key Value

```
set testKey testing
```

###### To get key

```
get testKey
```