## Setting up a Metrics in Kubernetes

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

```
kubectl top pod my-heavy-pod-6d44d656bd-658ww -n dev-api
```

```
resources:
  requests:
    memory: "1000Mi"
    cpu: "1"
  limits:
    memory: "512Mi"
    cpu: "500m"
```


### References

https://github.com/kubernetes-sigs/metrics-server
https://learnk8s.io/setting-cpu-memory-limits-requests