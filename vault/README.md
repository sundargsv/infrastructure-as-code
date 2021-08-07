### Setting up Vault (Single node only)

docker-compose up -d
docker exec -it my-vault /bin/sh
>> export VAULT_ADDR='http://127.0.0.1:8200'
>> vault operator init
>> some useful vault cmds
   vault operator unseal
   vault operator rekey