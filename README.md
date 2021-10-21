Docker file add in this project and k8s deployment file is added

Some docker commands and k8s commands
1. You can run the application by using this command on terminal 
```
./gradlew bootRun
```
2. 3. For creating jar need to run this command ./gradlew build
```
./gradlew build
```
3. jar will create in build/libs folder
4. you can run app using this command with jar
```
java -jar build/libs/basic-login-0.0.1-SNAPSHOT.jar
```
5. create file named "Dockerfile"

create docker image with docker file
```shell
#cd d:\workspace\basic-login
#docker build -t basic-login:v1 .
```

Give tag to docker image and push image to docker hub
```shell
#docker tag basic-login purabdk/basic-login
#docker push purabdk/basic-login
```

remove docker images from local docker hub
```shell
#docker rmi docker-spring purabdk/basic-login
```

docker pull image from docker hub and run it
```shell
#docker run -p 8080:8080 purabdk/basic-login
```

check running container
```shell
#docker ps
```

stop running container
```shell
#docker stop CONTAINER_ID
```

--------Jenkins-------------------
Ref:
https://www.jenkins.io/download/
https://www.jenkins.io/doc/book/installing/initial-settings/

Start jenkins on local machine

```
wsl
java -jar /mnt/c/NON-INSTALLED-SOFTWARES/jenkins.war --httpPort=9090
```

go to http://localhost:9090/pluginManager/ for installing docker related plugins
Docker, Docker Pipeline,docker-build-step,CloudBees Docker Build and Publish

//Note: use Multibranch pipeline and just put your git repo url
