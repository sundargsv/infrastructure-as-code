## Setting up a Production grade Jenkins (Master/ Slave) in Kubernetes

```
helm install jenkinsprod-ops jenkins/jenkins --values values.yml -n infra-apps
```

## CI CD Setup

'''
kubectl -n kube-system create serviceaccount jenkins-sa
'''

```
kubectl create clusterrolebinding ci-cd-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:jenkins-sa
```

```
JENKINS_TOKEN_NAME=`kubectl -n kube-system get serviceaccount/jenkins-sa -o jsonpath='{.secrets[0].name}'`
```

```
JENKINS_TOKEN_NAME=`kubectl -n kube-system get secret $JENKINS_TOKEN_NAME -o jsonpath='{.data.token}'| base64 --decode`
```

```
kubectl config set-credentials jenkins-sa --token=$JENKINS_TOKEN_NAME
```

```
kubectl config set-context --current --user=jenkins-sa
```

##### Reference
https://docs.cloud.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengaddingserviceaccttoken.htm