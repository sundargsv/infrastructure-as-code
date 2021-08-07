## Setting up Elasticsearch (Cluster)

docker-compose up -d
docker-compose -f docker-compose.yml up -d

docker pull docker.elastic.co/elasticsearch/elasticsearch:7.8.0
docker run -d --name=my-es -p 9010:9200 -p 9300:9300 -e "http.cors.enabled=true" -e "http.cors.allow-origin=*" -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.8.0
