1. Jenkins slave for Java Spring boot app
2. Jenkins slave for Node app
3. Jenkins slave for Python app
4. Jenkins slave for iOS Build and release
5. Jenkins slave for web plugin app

jenkins-agent = Latest version 1.0.3 (Need to update kube configs, helm3)

#### my private docker registry - Docker Hub

just with your own user name and email that you used for the account. Enter your password when prompted. If everything worked you will get a message similar to

```
docker build -t jenkins-agent:1.0.3 .
```

```
docker run -d jenkins-agent:1.0.3
```

```
docker exec -it {{IMAGE_ID}} /bin/bash
```

```
docker login --username=mydev --email=dev.my@gmail.com
```

```
WARNING: login credentials saved in /home/username/.docker/config.json
Login Succeeded
```

```
docker images
```

```
docker tag {{IMAGE_ID}} mydev/jenkins-agent:1.0.3
```

```
docker push mydev/jenkins-agent:1.0.3
```

##### Pushing to GCP Private Registry

- Java Agent

```
docker build -t asia.gcr.io/my-dev-platform/my-jenkins-java-agent:1.0.4 .
docker push asia.gcr.io/my-dev-platform/my-jenkins-java-agent:1.0.4
```

- Nodejs Agent

```
docker build -t asia.gcr.io/my-dev-platform/my-jenkins-java-agent:1.0.4 .
docker push asia.gcr.io/my-dev-platform/my-jenkins-java-agent:1.0.4 .
```

##### Reference docker Hub Login & Push, k8s plugin, helm

https://plugins.jenkins.io/kubernetes-cli/
https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
https://devopscube.com/install-configure-helm-kubernetes/