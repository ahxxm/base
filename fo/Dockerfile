FROM eclipse-temurin:17-jre-alpine AS build
WORKDIR /workdir
RUN apk add curl unzip bash

# install leiningen
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/bin/
RUN chmod +x /usr/bin/lein

# cache deps before build
RUN curl -fSL https://github.com/ahxxm/fo/archive/refs/heads/master.zip --output master.zip && unzip master.zip && mv fo-master/* ./
RUN lein deps && lein uberjar && rm -rf ~/.m2

# runner
FROM eclipse-temurin:17-jre-alpine
COPY --from=build /workdir/target/fo-0.1.0-SNAPSHOT-standalone.jar /fo.jar
