## Setting up Kafka (Single Node - dev only)

1. docker-compose up -d
2. docker-compose ps

### Log Check Healthy Zookeeper
docker-compose logs zookeeper | grep -i binding

### Log Check Healthy Kafka
docker-compose logs kafka | grep -i started



### Produce event
docker-compose exec kafka  bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list 127.0.0.1:29092 --topic my-test && echo 'Produced 42 messages.'"

### Consume event
docker-compose exec kafka  \
  kafka-console-consumer --bootstrap-server 127.0.0.1:29092 --topic my-test --from-beginning --max-messages 42

  ### Kafka Dev Instance env
  - "${KAFKA_BROKER_ID}"
  - "${INSTANCE_PUBLIC_IP}"