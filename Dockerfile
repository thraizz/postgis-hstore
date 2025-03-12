FROM postgres:17

# Add PostgreSQL's repository for PostGIS packages
RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      ca-certificates \
      gnupg \
      lsb-release \
      wget \
      && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
      && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
      && apt-get update

# Install PostGIS
RUN apt-get install -y --no-install-recommends \
      postgis \
      postgresql-$PG_MAJOR-postgis-3 \
      postgresql-$PG_MAJOR-postgis-3-scripts \
      && rm -rf /var/lib/apt/lists/*

# Add initialization scripts
RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
