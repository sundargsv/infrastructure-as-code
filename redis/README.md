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

#### Everything on a single Helm command

```
helm install atlantis-qa-redis-sentinel bitnami/redis --set volumePermissions.enabled=true 

```


NAME: atlantis-qa-redis-sentinel
LAST DEPLOYED: Sun Dec 26 21:25:21 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: redis
CHART VERSION: 15.6.8
APP VERSION: 6.2.6

** Please be patient while the chart is being deployed **

Redis&trade; can be accessed on the following DNS names from within your cluster:

    atlantis-qa-redis-sentinel-master.default.svc.cluster.local for read/write operations (port 6379)
    atlantis-qa-redis-sentinel-replicas.default.svc.cluster.local for read-only operations (port 6379)



To get your password run:

    export REDIS_PASSWORD=$(kubectl get secret --namespace default atlantis-qa-redis-sentinel -o jsonpath="{.data.redis-password}" | base64 --decode)

To connect to your Redis&trade; server:

1. Run a Redis&trade; pod that you can use as a client:

   kubectl run --namespace default redis-client --restart='Never'  --env REDISCLI_AUTH=$REDIS_PASSWORD  --image docker.io/bitnami/redis:6.2.6-debian-10-r53 --command -- sleep infinity

   Use the following command to attach to the pod:

   kubectl exec --tty -i redis-client \
   --namespace default -- bash

2. Connect using the Redis&trade; CLI:
   REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h atlantis-qa-redis-sentinel-master
   REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h atlantis-qa-redis-sentinel-replicas

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace default svc/atlantis-qa-redis-sentinel-master 6379:6379 &
    REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h 127.0.0.1 -p 6379


    helm install redis-test --set persistence.storageClass=nfs-client,redis.replicas.persistence.storageClass=nfs-client bitnami/redis --set volumePermissions.enabled=true


    helm install atlantis-qa-redis-sentinel --set persistence.storageClass=nfs-client,redis.replicas.persistence.storageClass=nfs-client bitnami/redis --set volumePermissions.enabled=true



```
helm install atlantis-qa-redis-sentinel bitnami/redis --set volumePermissions.enabled=true --set auth.password=Welcome@123

```

worked scripts

```
helm install atlantis-qa-redis-sentinel --set master.persistence.storageClass=oci-bv,redis.replicas.persistence.storageClass=oci-bv bitnami/redis --set volumePermissions.enabled=true,auth.password=Welcome@123
```

```
kubectl run --namespace default atlantis-qa-redis-sentinel-client --restart='Never'  --env REDIS_PASSWORD=@LaNnTtiez#1  --image docker.io/bitnami/redis:6.2.5-debian-10-r63 --command -- sleep infinity
```

```
kubectl exec --tty -i atlantis-qa-redis-sentinel-client --namespace default -- bash
```

```
redis-cli -h atlantis-qa-redis-sentinel-master -a @LaNnTtiez#1
```

```
redis-cli -h atlantis-qa-redis-sentinel-replicas -a @LaNnTtiez#1
```