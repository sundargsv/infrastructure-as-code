## Setting up Kong (API Gateway) in Kubernetes connecting with external PostgresSQL database

First timer
installCRDs: true


```
helm repo add kong https://charts.konghq.com
```

```
helm repo update
```

```
helm install my-gateway kong/kong --namespace my-auth -f new-values.yaml
```

```
NAME: my-gateway
LAST DEPLOYED: Tue Mar  9 10:43:32 2021
NAMESPACE: my-auth
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
To connect to Kong, please execute the following commands:

HOST=$(kubectl get svc --namespace my-auth my-gateway-kong-proxy -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
PORT=$(kubectl get svc --namespace my-auth my-gateway-kong-proxy -o jsonpath='{.spec.ports[0].port}')
export PROXY_IP=${HOST}:${PORT}
curl $PROXY_IP

Once installed, please follow along the getting started guide to start using
Kong: https://bit.ly/k4k8s-get-started
```


#### Uninstall

```
helm delete my-kong-gateway -n my-auth
```


#### Reference
https://medium.com/@harsh.manvar111/kong-api-gateway-with-konga-dashboard-ae95b6d1fec7https://github.com/pantsel/konga/tree/master/charts/konga
https://medium.com/@loschi.pablo/konga-in-kubernetes-cd9c31e71c75
