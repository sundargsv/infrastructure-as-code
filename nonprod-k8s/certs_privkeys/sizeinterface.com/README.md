## Install certbot on ubuntu

```
sudo add-apt-repository ppa:certbot/certbot
```

```
sudo apt install python-certbot-apache
```

## Creating a wildcard lets-encrypt certs for api.com for prod & non-prod clusters

```
sudo certbot certonly --manual --preferred-challenges=dns --email devops.my@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --manual-public-ip-logging-ok -d "*.api.com"
```

Output

```
Please deploy a DNS TXT record under the name
_acme-challenge.api.com with the following value:

qwertyuiopasdfghjklzxcvbnm-l4cr_8eg

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/api.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/api.com/privkey.pem
   Your cert will expire on 2021-08-14. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

## Creating a secret resoource for api.com for prod & non-prod clusters

```
kubectl create secret tls my-managed-api-tls --cert /etc/letsencrypt/live/api.com/fullchain.pem --key /etc/letsencrypt/live/api.com/privkey.pem
```

#### Or Create secret from local .pem files

```
kubectl create secret tls my-managed-api-tls --namespace=default --cert api.com/fullchain.pem --key api.com/privkey.pem
```

## To Copy the secret resource from default namespace to other

```
kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=dev-ui -f -
```

#### If the --export property throws error, use the yaml converter
```
kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: dev-ui/g' | kubectl create -f -
```


#### Namespaces using SI Cert
###### Non - Prod Cluster
cattle-system
my-auth
default
dev-api
dev-ml
dev-ui
e2e-api
e2e-ml
e2e-ui
infra-apps
kubernetes-dashboard
logging
monitoring

kubectl delete secret my-managed-api-tls --namespace=default

kubectl create secret tls my-managed-api-tls --namespace=default --cert /etc/letsencrypt/live/api.com/fullchain.pem --key /etc/letsencrypt/live/api.com/privkey.pem


kubectl delete secret my-managed-api-tls --namespace=cattle-system

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=cattle-system -f -

kubectl delete secret my-managed-api-tls --namespace=my-auth

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=my-auth -f -

kubectl delete secret my-managed-api-tls --namespace=dev-api

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=dev-api -f -

kubectl delete secret my-managed-api-tls --namespace=dev-ml

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=dev-ml -f -

kubectl delete secret my-managed-api-tls --namespace=dev-ui

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=dev-ui -f -

kubectl delete secret my-managed-api-tls --namespace=e2e-api

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=e2e-api -f -

kubectl delete secret my-managed-api-tls --namespace=e2e-ml

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=e2e-ml -f -

kubectl delete secret my-managed-api-tls --namespace=e2e-ui

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=e2e-ui -f -

kubectl delete secret my-managed-api-tls --namespace=infra-apps

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=infra-apps -f -

kubectl delete secret my-managed-api-tls --namespace=kubernetes-dashboard

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=kubernetes-dashboard -f -

kubectl delete secret my-managed-api-tls --namespace=logging

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=logging -f -

kubectl delete secret my-managed-api-tls --namespace=monitoring

kubectl get secret my-managed-api-tls --namespace=default --export -o yaml | kubectl apply --namespace=monitoring -f -

#### Namespaces using SI Cert
###### Prod Cluster
cattle-system
my-auth
default
prod-api
prod-ml
prod-ui
infra-common
logging
monitoring

```
kubectl delete secret my-managed-api-tls --namespace=default

kubectl create secret tls my-managed-api-tls --namespace=default --cert certs/api/fullchain.pem --key certs/api/privkey.pem

kubectl delete secret my-managed-api-tls --namespace=cattle-system

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: cattle-system/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=my-auth

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: my-auth/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=prod-api

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: prod-api/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=prod-ml

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: prod-ml/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=prod-ui

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: prod-ui/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=infra-common

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: infra-common/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=logging

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: logging/g' | kubectl create -f -

kubectl delete secret my-managed-api-tls --namespace=monitoring

kubectl get secret my-managed-api-tls --namespace=default -o yaml | sed 's/namespace: default/namespace: monitoring/g' | kubectl create -f -

```