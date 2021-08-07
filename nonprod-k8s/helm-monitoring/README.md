## Setting up a Monitoring system (Prometheus/ Grafana) in Kubernetes (Production)


~~To create a namespace~~

```
kubectl create namespace monitoring
```

To install prometheus-operator

~~
helm install prometheus stable/prometheus-operator --namespace=monitoring

helm install prometheus stable/prometheus-operator -f values.yaml --n monitoring


kubectl --namespace monitoring get pods -l "release=prometheus"

helm uninstall prometheus stable/prometheus-operator --namespace=monitoring


To check the status

kubectl --namespace monitoring get pods -l "release=prometheus"
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring -f values.yaml
helm upgrade prometheus stable/prometheus-operator -f values.yaml --namespace monitoring --version {{VERSION}}
~~

### To install grafana

```
helm install grafana bitnami/grafana --namespace=monitoring -f values.yaml
```


##### To get grafana password

```
kubectl get secret --namespace monitoring prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
```
cHJvbS1qwertyGVyYXRvcg==
```

```
Password: prom-operator
```
#### Setup bitnami supported prometheus-operator helm chart

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```
helm install prometheus bitnami/kube-prometheus -f values.yaml --namespace=monitoring
```

##### To reset the Grafana Password admin

Password: AbCd7!
admin

##### Helm chart Repo
https://github.com/helm/charts/tree/master/stable/prometheus-operator
https://github.com/helm/charts/blob/master/stable/prometheus-operator/values.yaml

##### 

##### Reference
https://medium.com/zolo-engineering/configuring-prometheus-operator-helm-chart-with-aws-eks-c12fac3b671a
https://prometheus.io/docs/alerting/latest/configuration/#route
https://medium.com/@yitaek/practical-monitoring-with-prometheus-grafana-part-i-22d0f172f993
https://docs.portworx.com/portworx-install-with-kubernetes/operate-and-maintain-on-kubernetes/monitoring/monitoring-px-prometheusandgrafana.1/
https://www.metricfire.com/blog/monitoring-kubernetes-tutorial-using-grafana-and-prometheus/

https://grafana.com/blog/2020/02/25/step-by-step-guide-to-setting-up-prometheus-alertmanager-with-slack-pagerduty-and-gmail/
https://prometheus.io/docs/alerting/latest/api_examples/
https://juliusv.com/promslack/

