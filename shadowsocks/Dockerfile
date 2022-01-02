FROM rust:alpine AS builder

ADD build.sh /
RUN /build.sh

FROM alpine:3.15 AS runner
COPY --from=builder /workdir/ssserver /workdir/sslocal /workdir/ssurl /workdir/ssmanager /usr/bin/
CMD ["ssserver"]


