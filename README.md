# Base Image


## Build/Update Notes

Auto builds are in [Docker Hub](https://hub.docker.com/r/ahxxm/gentoo/).

Manual build with [docker-slim](https://github.com/cloudimmunity/docker-slim):

    docker build -t gentoo.
    ./docker-slim build gentoo

will generate image named origin-image-name.slim, not working for base image though.
