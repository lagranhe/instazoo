#!/bin/bash
echo "This is script for creating environment variables for docker containers"
echo -n "Enter MYSQL_ROOT_PASSWORD: "
read -s MYSQL_ROOT_PASSWORD
echo
echo -n "Repeat MYSQL_ROOT_PASSWORD: "
read -s REPEAT_MYSQL_ROOT_PASSWORD
echo
if [ "$REPEAT_MYSQL_ROOT_PASSWORD" != "$MYSQL_ROOT_PASSWORD" ] ; then
    echo "You entered different password"
    exit 1
fi
echo -n "Enter MYSQL_DB - name for database of application: "
read MYSQL_DB
echo -n "Enter MYSQL_USER - name of database user: "
read MYSQL_USER
echo -n "Enter MYSQL_PASSWORD - password for $MYSQL_USER: "
read -s MYSQL_PASSWORD
echo
echo -n "Repeat MYSQL_PASSWORD: "
read -s REPEAT_MYSQL_PASSWORD
echo
if [ "$REPEAT_MYSQL_PASSWORD" != "$MYSQL_PASSWORD" ] ; then
    echo "You entered different password"
    exit 1
fi
echo -n "Enter JWT_SECRET: "
read -s JWT_SECRET
echo
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
MYSQL_DB=$MYSQL_DB
MYSQL_USER=$MYSQL_USER
MYSQL_PASSWORD=$MYSQL_PASSWORD
JWT_SECRET=$JWT_SECRET" > .env
exit 0;




