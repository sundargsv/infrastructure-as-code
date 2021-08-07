#### Setting up RabbitMQ (Single ode only)

###### Source: Github (Dev only)
>> URL: https://github.com/quangthe/docker-rabbitmq-stomp
>> Docker Build

```
docker build -t rabbitmq-stomp:3 .
```

>> Ports

1. 5672: Default port of RabbitMQ
2. 15672: RabbitMQ Web UI
3. 61613: STOMP port

>> Docker Run

```
docker run -d --name my-rabbitmq-dev -p 9007:15672 -p 9006:5672 -p 9008:61613 rabbitmq-stomp:3
```