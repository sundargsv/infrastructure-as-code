## Setting up Keycloak in Kubernetes with external PostgresSQL

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install keycloak bitnami/keycloak -f values.yaml -n my-auth
```

```
helm install keycloak codecentric/keycloak -f values.yaml -n my-auth-test
```