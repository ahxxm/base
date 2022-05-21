FROM amazoncorretto:11 as build
WORKDIR /workdir
RUN yum install -y unzip curl
RUN curl -fSL https://github.com/ahxxm/fo/archive/refs/heads/master.zip --output master.zip && unzip master.zip && mv fo-master/* ./

# install leiningen
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/bin/
RUN chmod +x /usr/bin/lein

# cache deps before build
ADD project.clj ./
RUN lein deps
ADD . ./
RUN lein uberjar

# runner
FROM amazoncorretto:11
COPY --from=build /workdir/target/fo-0.1.0-SNAPSHOT-standalone.jar /fo.jar
