### Prometheus Exporters

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

##### Mongodb Exporter

```
helm install mongodb-exporter prometheus-community/prometheus-mongodb-exporter -f values.yaml --namespace=monitoring
```

```
kubectl port-forward service/mongodb-exporter-prometheus-mongodb-exporter 9216 -n monitoring
```
#### To write custom exporter

https://medium.com/@ikod/custom-exporter-with-prometheus-b1c23cb24e7a

#### Reference
https://github.com/prometheus-community/helm-charts/tree/main/charts

