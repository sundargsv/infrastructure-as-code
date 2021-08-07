#### Setting up a RBAC in Kubernetes Permission manager

```
kubectl create namespace permission-manager
```

```
apiVersion: v1
kind: Secret
metadata:
  name: permission-manager
  namespace: permission-manager
type: Opaque
stringData:
  PORT: "4000" # port where server is exposed
  CLUSTER_NAME: "my-cluster" # name of the cluster to use in the generated kubeconfig file
  CONTROL_PLANE_ADDRESS: "https://172.17.0.3:6443" # full address of the control plane to use in the generated kubeconfig file
  BASIC_AUTH_PASSWORD: "changeMe" # password used by basic auth (username is `admin`)
```

##### Reference
https://github.com/sighupio/permission-manager/blob/master/docs/installation.md