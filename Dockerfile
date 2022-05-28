FROM alpine:3.16.0 AS buildtcc
RUN apk -U upgrade
RUN apk add --no-cache wget gcc musl-dev make
WORKDIR /usr/local/src
RUN wget http://download.savannah.gnu.org/releases/tinycc/tcc-0.9.27.tar.bz2
RUN tar vxf tcc-0.9.27.tar.bz2
WORKDIR /usr/local/src/tcc-0.9.27
RUN ./configure --prefix=/usr/local --config-musl
RUN make
RUN make install

FROM alpine:3.16.0
RUN apk -U upgrade
COPY --from=buildtcc /usr/lib/*.a /usr/lib
COPY --from=buildtcc /usr/lib/*.o /usr/lib
COPY --from=buildtcc /usr/include /usr/include
COPY --from=buildtcc /usr/local/bin /usr/local/bin
COPY --from=buildtcc /usr/local/lib /usr/local/lib
COPY --from=buildtcc /usr/local/include /usr/local/include
WORKDIR /home
