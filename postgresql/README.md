### Setting up PosgresSQL Database with PG Admin

```
docker-compose up -d
```

#### Issues in connecting??

```
docker inspect my-postgresql-dev | grep IPAddress
```

#### Portal

```
-- CREATE USER portal WITH ENCRYPTED PASSWORD 'AbCd7!';
-- GRANT ALL PRIVILEGES ON DATABASE "portal" TO portal;
```

###### To check the current sessions

```
-- SELECT  *
-- FROM pg_stat_activity
-- WHERE datname = 'portal';
```

###### (Dev)
Host: IP
Port: 9002
Username: portal
Password: AbCd7!
Database Name: portal