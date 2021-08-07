## Setting up mariadb (Master/ Slave cluster)

```
docker-compose up -d
```

### Wordpress portal

```
-- CREATE DATABASE portal_wordpress_dev;

-- CREATE USER 'portal_dev' IDENTIFIED BY 'AbCd007!!';

-- GRANT ALL privileges ON `portal_wordpress_dev`.* TO 'portal_dev'@'%';

-- FLUSH PRIVILEGES;
```

#### To check the users/ grants

```
-- USE my_api; 

-- SHOW GRANTS FOR 'portal_dev';

-- SELECT host,user,authentication_string FROM mysql.user;
```

##### (Dev)
Host: IP
Port: 9013
Username: portal_dev
Password: AbCd007!!
Database Name: portal_wordpress_dev

##### Reference URLS

https://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/

https://www.shellhacks.com/mysql-show-users-privileges-passwords/#:~:text=Show%20User%20Privileges%20In%20MySQL,have%20connected%20to%20the%20server.