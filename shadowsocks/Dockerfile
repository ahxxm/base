FROM rust:alpine AS builder

ADD build.sh /
RUN /build.sh

FROM alpine AS runner
COPY --from=builder /workdir/ssserver /workdir/sslocal /workdir/ssurl /workdir/ssmanager /usr/bin/
CMD ["ssserver"]


