FROM ibm-semeru-runtimes:open-17-jre AS build
WORKDIR /workdir
RUN apt update && apt install -y curl unzip bash

# install leiningen
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/bin/
RUN chmod +x /usr/bin/lein

# cache deps before build
RUN curl -fSL https://github.com/ahxxm/fo/archive/refs/heads/master.zip --output master.zip && unzip master.zip && mv fo-master/* ./
RUN lein deps && lein uberjar && rm -rf ~/.m2

# runner
FROM ibm-semeru-runtimes:open-17-jre
COPY --from=build /workdir/target/fo-0.1.0-SNAPSHOT-standalone.jar /fo.jar
