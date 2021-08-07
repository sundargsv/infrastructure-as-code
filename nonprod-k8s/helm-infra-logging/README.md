# Settting up EFK (Elasticsearch, FluentBit, Kibana) in Kubernetes (Production Grade)

### Setup Elasticsearch with Authentication (X-Pack Security) Enabled on Kubernetes

###### To set master nodes (elasticsearch)

```
kubectl apply  -f es-master-configmap.yaml -f es-master-service.yaml -f es-master-deplyment.yaml
```

###### To set data nodes (elasticsearch)

```
kubectl apply -f es-data-configmap.yaml -f es-data-service.yaml -f es-data-statefulset.yaml
```


###### To set client nodes (elasticsearch)

```
kubectl apply -f es-client-configmap.yaml -f es-client-service.yaml -f es-client-deployment.yaml
```

###### Verify

```
kubectl get pod -n logging
```

###### Generate passwords for es users

```
kubectl exec -it $(kubectl get pods -n logging | grep elasticsearch-client | sed -n 1p | awk '{print $1}') -n logging -- bin/elasticsearch-setup-passwords auto -b
```

###### Create K8s secret with es password that was generated

```
kubectl create secret generic elasticsearch-pw-elastic -n logging --from-literal password={{YOUR_LITERAL_PASSWORD}}
```

prd/es/pas/ : HbiJjAbA4uwwweerrrt5uWvhWEMk

###### To check es nodes logs

```
kubectl logs -f <POD_NAME> -n logging
```

with cluster health

```
kubectl logs -f -n logging $(kubectl get pods -n logging | grep elasticsearch-master | sed -n 1p | awk '{print $1}') \
| grep "Cluster health status changed from \[YELLOW\] to \[GREEN\]"
```


### Setup Kibana with Elastic cluster Authentication (X-Pack Security) Enabled on Kubernetes

```
kubectl apply  -f kibana-configmap.yaml -f kibana-service.yaml -f kibana-deployment.yaml -f kibana-ingress.yaml
```

###### To check ingress

```
kubectl get ingress -n logging
```

~~~ 
### Setup Fluent Bit with Elasticsearch Authentication (X-Pack Security) Enabled on Kubernetes

Fluent Bit will tails logs from log files, and then save it into Elasticsearch.

For allowing fluent bit to access pods in the Kubernetes cluster, we will define clusterrole, a service account for fluent bit and then a cluster role binding between the cluster role and the service account.

```
kubectl apply  -f fb-clusterrole.yaml -f fb-clusterrolebinding.yaml -f fb-serviceaccount.yaml -f fb-configmap.yaml -f fb-ds.yaml
```

This will start fluent bit service as daemonset in all the nodes of the Kubernetes cluster

###### Reference Links

https://www.studytonight.com/post/setup-elasticsearch-with-authentication-xpack-security-enabled-on-kubernetes
https://www.studytonight.com/post/setup-kibana-with-elastic-cluster-authentication-xpack-security-enabled
https://www.studytonight.com/post/setup-fluent-bit-with-elasticsearch-authentication-enabled-in-kubernetes

~~~

### Setup Filebeats


### To clear EFK stack

kubectl delete -f kibana-configmap.yaml -f kibana-service.yaml -f kibana-deployment.yaml -f kibana-ingress.yaml
kubectl delete secret elasticsearch-pw-elastic -n logging
kubectl delete -f es-client-configmap.yaml -f es-client-service.yaml -f es-client-deployment.yaml
kubectl delete -f es-data-configmap.yaml -f es-data-service.yaml -f es-data-statefulset.yaml
kubectl delete  -f es-master-configmap.yaml -f es-master-service.yaml -f es-master-deplyment.yaml

kubectl delete  -f fb-clusterrole.yaml -f fb-clusterrolebinding.yaml -f fb-serviceaccount.yaml -f fb-configmap.yaml -f fb-ds.yaml