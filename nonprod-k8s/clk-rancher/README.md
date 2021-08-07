## Setting up Rancher (GUI for Kubernetes management)

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher-test.api.com \
  --set ingress.tls.source=secret


#### Ingress tls secrets

```
kubectl edit ing rancher -n cattle-system
```

Edit tls.host and secretName

#### Login Admin

username: admin
password: AbCd7!


#### Reference
https://rancher.com/docs/rancher/v2.x/en/installation/install-rancher-on-k8s/