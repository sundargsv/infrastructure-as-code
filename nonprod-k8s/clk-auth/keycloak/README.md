## Setting up Keycloak (SSO) in Kubernetes connect an external PostgresSQL database


```
kubectl apply -f deployment.yaml -n my-auth
```

```
kubectl apply -f svc.yaml -n my-auth
```

```
kubectl apply -f ingress.yaml -n my-auth
```

```
kubectl delete -f deployment.yaml -n my-auth
```

```
kubectl delete -f svc.yaml -n my-auth
```

```
kubectl delete -f ingress.yaml -n my-auth
```


#### References
https://github.com/keycloak/keycloak-documentation/blob/master/server_admin/topics/export-import.adoc