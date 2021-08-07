## Setting up GCR (For Docker Image Registry)


```
kubectl create secret docker-registry gcr-json-key --docker-server=asia.gcr.io --docker-username=_json_key --docker-password="$(cat key.json)" --docker-email=gsundar93@gmail.com
```

## To Copy the secret resource from default namespace to other

```
kubectl get secret gcr-json-key --namespace=default --export -o yaml | kubectl apply --namespace=dev-ui -f -
```

#### If the --export property throws error, use the yaml converter

```
kubectl get secret gcr-json-key --namespace=default -o yaml | sed 's/namespace: default/namespace: dev-ui/g' | kubectl create -f -
```