## Create Helm Chart - Custom Sample

helm install api-dev helm/. --namespace=default --set image.tag=latest --set environment=dev --set ingress.domain=my-dev.api.com