FROM alpine:latest AS build

ENV OPTIMIZATION="-O3"
ENV BUILD_DEPS="build-base linux-headers cmake clang g++ make autoconf automake libtool pkgconf git wget bash"

ENV CFLAGS="${OPTIMIZATION}"
ENV CXXFLAGS="${OPTIMIZATION}"

RUN apk update && \
    apk add --update ${BUILD_DEPS}

RUN mkdir -p /build/src /build/obj /build/prefix

COPY install-cmake.sh /build

WORKDIR /build

RUN ./install-cmake.sh \
    --build-dir=/build/src \
    --prefix=/build/prefix \
    --disable-shared \
    --enable-static \
    --with-icu \
    --build-icu \
    --build-boost \
    --build-secp256k1

RUN rm -rf /build/src /build/obj



FROM alpine:latest AS runtime

ENV RUNTIME_DEPS="bash libstdc++"

RUN apk update && \
    apk add --update ${RUNTIME_DEPS}

COPY --from=build /build/prefix/bin/bn /bitcoin/bn
COPY bn-linux-startup.sh /bitcoin/startup.sh

# Bitcoin P2P
EXPOSE 8333/tcp
EXPOSE 8333/udp

# Query Service (Secure/Public)
EXPOSE 9081/tcp
EXPOSE 9091/tcp

# Heartbeat Service (Secure/Public)
EXPOSE 9082/tcp
EXPOSE 9092/tcp

# Block Service (Secure/Public)
EXPOSE 9083/tcp
EXPOSE 9093/tcp

# Transaction Service (Secure/Public)
EXPOSE 9084/tcp
EXPOSE 9094/tcp

WORKDIR /bitcoin
VOLUME ["/bitcoin/blockchain", "/bitcoin/conf"]
CMD [ "/bitcoin/startup.sh" ]
