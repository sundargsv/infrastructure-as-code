## Setting up Production Grade RabbitMQ Cluster in Kubernetes using Bitnami chart

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```
helm install my-non-prod-rabbitmq -f values-production.yaml bitnami/rabbitmq --namespace infra-apps
```

```
helm upgrade my-non-prod-rabbitmq bitnami/rabbitmq --set plugins="rabbitmq_management rabbitmq_peer_discovery_k8s rabbitmq_stomp" --namespace infra-apps
```

Username: my_dev
Password: AbCd7!

##### Reference Links
https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq/templates
https://github.com/bitnami/bitnami-docker-rabbitmq#environment-variables

