#!/bin/bash
if [ $# -ne 1 ] ; then
    echo "Need one argument
    Usage: ./run.sh [option]
    Used commands:
        start           --- start docker-compose
        stop            --- stop docker-compose
        rm-dockers      --- remove all docker containers
        rm-vars         --- remove all environment variables
        add-vars        --- add all enviroment variables
        cat-vars        --- print all enviroment variables"
    exit 1;
fi
if [ $1 == "add-vars" ] ; then 
    echo "This is script for creating environment variables for docker containers"

    echo -n "Enter MYSQL_ROOT_PASSWORD: "
    read -s MYSQL_ROOT_PASSWORD
    echo
    while [ -z "$MYSQL_ROOT_PASSWORD" ] ; do
        echo "This field cannot be empty. Please try again..."  
        echo -n "Enter MYSQL_ROOT_PASSWORD: "
    read -s MYSQL_ROOT_PASSWORD
    echo  
    done

    echo -n "Repeat MYSQL_ROOT_PASSWORD: "
    read -s REPEAT_MYSQL_ROOT_PASSWORD
    echo
    while [ "$REPEAT_MYSQL_ROOT_PASSWORD" != "$MYSQL_ROOT_PASSWORD" ] ; do
        echo "You entered different password."
        echo -n "Repeat MYSQL_ROOT_PASSWORD: "
        read -s REPEAT_MYSQL_ROOT_PASSWORD
        echo
    done

    echo -n "Enter MYSQL_DB - name for database of application: "
    read MYSQL_DB
    while [ -z "$MYSQL_DB" ] ; do
        echo "This field cannot be empty. Please try again..."  
        echo -n "Enter MYSQL_DB: "
    read -s MYSQL_DB
    echo  
    done

    echo -n "Enter MYSQL_USER - name of database user: "
    read MYSQL_USER
    while [ -z "$MYSQL_USER" ] ; do
        echo "This field cannot be empty. Please try again..."  
        echo -n "Enter MYSQL_USER: "
    read -s MYSQL_USER
    echo  
    done
    
    echo -n "Enter MYSQL_PASSWORD - password for $MYSQL_USER: "
    read -s MYSQL_PASSWORD
    echo
    while [ -z "$MYSQL_PASSWORD" ] ; do
        echo "This field cannot be empty. Please try again..."  
        echo -n "Enter MYSQL_PASSWORD: "
    read -s MYSQL_PASSWORD
    echo  
    done
    
    echo -n "Repeat MYSQL_PASSWORD: "
    read -s REPEAT_MYSQL_PASSWORD
    echo
    while [ "$REPEAT_MYSQL_PASSWORD" != "$MYSQL_PASSWORD" ] ; do
        echo "You entered different password"
        echo -n "Repeat MYSQL_PASSWORD: "
        read -s REPEAT_MYSQL_PASSWORD
        echo
    done

    echo -n "Enter JWT_SECRET: "
    read -s JWT_SECRET
    echo
    while [ -z "$JWT_SECRET" ] ; do
        echo "This field cannot be empty. Please try again..."  
        echo -n "Enter JWT_SECRET: "
    read -s JWT_SECRET
    echo  
    done


    echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
MYSQL_DB=$MYSQL_DB
MYSQL_USER=$MYSQL_USER
MYSQL_PASSWORD=$MYSQL_PASSWORD
JWT_SECRET=$JWT_SECRET" > .env
    exit 0;
elif [ $1 == "rm-vars" ] ; then
    rm .env
    exit 0;
elif [ $1 == "cat-vars" ] ; then
    cat .env;
    exit 0;
elif [ $1 == "start" ] ; then 
    FILE=".env"
    NOV=0
    if [ -f "$FILE" ] ; then
        while read LINE ; do 
            RESULT=$((`echo $LINE | wc -c` -1))
            if [ $RESULT -ne 0 ] ; then
                let NOV++
            fi
        done < $FILE
        if [ $NOV -ne 5 ] ; then
            echo "Server cannot start. Please add enviroment variables ---->   ./run.sh add-vars"
            exit 1;
        fi
    else 
        echo "Server cannot start. Please add enviroment variables ---->   ./run.sh add-vars"
        exit 1;
    fi
    docker-compose up --build
    exit 0;
elif [ $1 == "stop" ] ; then
    docker-compose down
    exit 0;
elif [ $1 == "rm-dockers" ] ; then
    docker stop $(docker ps -a -q) 
    docker rmi -f $(docker images -a -q)
    exit 0;
else 
    echo "$1 is invalid command
    Used commands:
        start           --- start docker-compose
        stop            --- stop docker-compose
        rm-dockers      --- remove all docker containers
        rm-vars         --- remove all environment variables
        add-vars        --- add all enviroment variables
        cat-vars        --- print all enviroment variables"
    exit 1;
fi



