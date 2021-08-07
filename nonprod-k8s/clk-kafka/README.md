## Setting up Production Grage Kafka Cluster in Kubernetes using Rancher

#### Rancher

Rancher is an open source UI for Kubernetes Management where we can manage multiple clusters in a single application.

#### Prod cluster - Kafka cluster

```
kafka-topics --zookeeper my-kafka-prod-cluster-1-cp-zookeeper-headless.infra-common:2181 --topic my-kafka-prod-test --create --partitions 1 --replication-factor 1 --if-not-exists
```

```
echo "$MESSAGE" | kafka-console-producer --broker-list my-kafka-prod-cluster-1-cp-kafka-headless.infra-common:9092 --topic my-kafka-prod-test
```

```
kafka-console-consumer --bootstrap-server my-kafka-prod-cluster-1-cp-kafka-headless.infra-common:9092 --topic my-kafka-prod-test --from-beginning --timeout-ms 2000 --max-messages 1 | grep "$MESSAGE"
```