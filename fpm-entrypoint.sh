#!/bin/sh

if [ -z $MYSQL_DATABASE ]; then
	MYSQL_DATABASE="mantis"
fi

if [ -z $MYSQL_USER ]; then
	MYSQL_USER="root"
fi

if [ -z $MYSQL_PASSWORD ]; then
	MYSQL_PASSWORD="root"
fi

if [ -z $MYSQL_HOST ]; then
	MYSQL_HOST="database:3306"
fi


export fic="/var/www/html/config/config_inc.php"
sed -i "s/@@MYSQL_DATABASE@@/$MYSQL_DATABASE/g" $fic
sed -i "s/@@MYSQL_USER@@/$MYSQL_USER/g" $fic
sed -i "s/@@MYSQL_HOST@@/$MYSQL_HOST/g" $fic
sed -i "s/@@MYSQL_PASSWORD@@/$MYSQL_PASSWORD/g" $fic
sed -i "s/@@LDAP_BASE_DN@@/$LDAP_BASE_DN/g" $fic
sed -i "s/@@LDAP_BIND_DN@@/$LDAP_BIND_DN/g" $fic
sed -i "s/@@LDAP_BIND_PW@@/$LDAP_BIND_PW/g" $fic
sed -i "s/@@LDAP_HOST@@/$LDAP_HOST/g" $fic
sed -i "s/@@LDAP_PORT@@/$LDAP_PORT/g" $fic

#php /t.php > /var/www/html/plugins/Ldap_Login/data.dat

apache2-foreground
