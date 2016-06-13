Docker image - PostgreSQL with PostGIS and hstore enabled
---------------------------------------------------------

### Details
- PostgreSQL 9.5.3
- PostGIS 2.2.2

### Build image
    docker build -t skywidesoft/postgis-hstore .

### Push image
    docker push skywidesoft/postgis-hstore

### Tag image
    docker tag [image-id] skywidesoft/postgis-hstore:9.5
    docker push skywidesoft/postgis-hstore:9.5

### Run container
    docker run --name postgis22 -p 5432:5432 -v postgis-data:/var/lib/postgresql/data -e POSTGRES_USER=dev -e POSTGRES_PASSWORD=Password1 -d skywidesoft/postgis-hstore:9.5
