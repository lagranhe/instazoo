# Instazoo pet-project

## Running instazoo using docker-compose and run.sh locally
Instazoo is a full-stack project with using [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) in back-end and [Angular2+](https://angular.io/) in front-end. At first clone git with all submodules (client and server part of project are separate repositories).
```
git clone --recurse-submodules https://github.com/lagranhe/instazoo.git
```
**Note:** You must have preinstalled docker engine and docker-compose on your mashine for the next steps.

After that you can manualy dicribe next enviroment variables or via bash script run.sh: 
```
./run.sh [option]
Used options:
        start           --- start docker-compose
        stop            --- stop docker-compose
        rm-vars         --- remove all environment variables for this project
        add-vars        --- add all enviroment variables
        cat-vars        --- show all enviroment variables"
```
For exapmle, if you want run docker compose just write command
```
./run.sh start
```
**Note:** Remember to add enviroment variables using add-vars option before starting application.

## Running instazoo using docker-compose manualy

At first clone git with all submodules (client and server part of project are separate repositories).
```
git clone --recurse-submodules https://github.com/lagranhe/instazoo.git
```
After that you can manualy dicribe next enviroment variables in .env file: 
```
MYSQL_ROOT_PASSWORD=""
MYSQL_DB=""
MYSQL_USER=""
MYSQL_PASSWORD=""
JWT_SECRET=""
```
And run manualy docker compose
```
docker-compose up -d
```
## Running instazoo server locally
You can build a jar file and run server part from the command line:

```
git clone https://github.com/lagranhe/instazoo_server
cd instazoo_server
./mvnw package
java -jar target/*.jar
```

You can then access instazoo server here: http://localhost:8080/

Or you can run it from Maven directly using the Spring Boot Maven plugin. If you do this it will pick up changes that you make in the project immediately (changes to Java source files require a compile as well - most people use an IDE for this):

```
./mvnw spring-boot:run
```

> NOTE: Windows users should set `git config core.autocrlf true` to avoid format assertions failing the build (use `--global` to set that flag globally).

## Running instazoo client locally

You can run Angular client part from the command line:


```
git clone https://github.com/lagranhe/instazoo_client
cd instazoo_client
ng serve
```


## In case you find a bug/suggested improvement for Instazoo-server
Our issue tracker is available here: https://github.com/lagranhe/instazoo_server/issues

## Looking for something in particular?

|Spring Boot Configuration | Class or Java property files  |
|--------------------------|---|
|The Main Class | [InstazooApplication](https://github.com/lagranhe/instazoo_server/blob/2dcdd302734175074a705cdc2e6bad97a8483705/src/main/java/com/example/instazoo/InstazooApplication.java) |
|Properties Files | [application.properties](https://github.com/lagranhe/instazoo_server/blob/2dcdd302734175074a705cdc2e6bad97a8483705/src/main/resources/application.properties) |

**Note:** This project is based on [online course in Udemy](https://www.udemy.com/course/full-stack-java-spring-angular/). If you like it please buy a course and leave your positive feedback.