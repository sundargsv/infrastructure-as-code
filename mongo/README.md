## Setting up Mongo Database (Single Node)

```
docker-compose -f docker-compose.yml up -d
```

Mongo URI: mongodb://my-mongo:qwerty@0.0.0.0:27017/my-datastore?authSource=my-datastore

###### Commands to mongorestore

```
mongorestore -v --uri "mongodb://my-mongo:qwerty@0.0.0.0:27017" -d "mainDB" --authenticationDatabase admin --dir /dump/mainDB --objcheck
```