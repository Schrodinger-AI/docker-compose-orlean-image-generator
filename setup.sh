
docker cp orlean-image-generator-silo-1:/App/appsettings.json ./silo-appsettings.json
docker cp orlean-image-generator-webapiclient-1:/App/appsettings.json ./webapi-appsettings.json
docker cp orlean-image-generator-watermark-1:/app/appsettings.json ./watermark-appsettings.json

# database
curl -o 01-MySQL-Main.sql https://raw.githubusercontent.com/Schrodinger-AI/orlean-image-generator/develop/setup-guide/database/01-MySQL-Main.sql
curl -o 02-MySQL-Clustering.sql https://raw.githubusercontent.com/Schrodinger-AI/orlean-image-generator/develop/setup-guide/database/02-MySQL-Clustering.sql
curl -o 03-MySQL-Persistence.sql https://raw.githubusercontent.com/Schrodinger-AI/orlean-image-generator/develop/setup-guide/database/03-MySQL-Persistence.sql
docker exec -i orlean-image-generator-mysql-1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" orleans_image_generator' < 01-MySQL-Main.sql
docker exec -i orlean-image-generator-mysql-1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" orleans_image_generator' < 02-MySQL-Clustering.sql
docker exec -i orlean-image-generator-mysql-1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" orleans_image_generator' < 03-MySQL-Persistence.sql