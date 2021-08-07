## Setting up Production Grade RabbitMQ Cluster in Kubernetes using Stable helm chart

```
helm install my-non-prod-rabbitmq-ha stable/rabbitmq-ha -f values.yaml --namespace infra-apps
```

Username: my_dev
Password: AbCd7!

managementUsername: my_dev_mgmt
managementPassword: C0L0KiNz7!

##### Reference Links
https://github.com/helm/charts/tree/master/stable/rabbitmq-ha
https://git.app.uib.no/caleno/helm-charts/-/tree/236e39f63a7379efc16a2f0159fb931cfbca31a3/stable/rabbitmq-ha
https://phoenixnap.com/kb/install-and-configure-rabbitmq-on-kubernetes