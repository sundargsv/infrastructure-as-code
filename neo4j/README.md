## Setting up Neo4j Database (Multi Node cluster)

```
docker-compose -f my-neo4j/docker-compose.yml up -d
```

#### To enable metrics and prometheus metrics

NEO4J_metrics_enabled=true
NEO4J_metrics_jvm_gc_enabled=true
NEO4J_metrics_jvm_heap_enabled=true
NEO4J_metrics_jvm_memory_enabled=true
NEO4J_metrics_prometheus_enabled=true


##### Reference for docker-compose with metrics
https://github.com/graphaware/monitoring-neo4j-prometheus-grafana/blob/master/docker-compose.yml

##### Other
https://graphaware.com/neo4j/2019/06/11/monitoring-neo4j-prometheus.html
