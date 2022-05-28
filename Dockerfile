# Build CUnit
FROM alpine:3.16.0 AS buildcunit
RUN apk -U upgrade
RUN apk add --no-cache gcc musl-dev make cmake git
WORKDIR /usr/local/src
RUN git clone https://gitlab.com/cunity/cunit
WORKDIR /usr/local/src/cunit/local-build
RUN cmake ..
RUN make
RUN make install

FROM alpine:3.16.0
RUN apk -U upgrade
RUN apk add --no-cache gcc musl-dev make git
COPY --from=buildcunit /usr/local/lib/ /usr/local/lib/
COPY --from=buildcunit /usr/local/include/ /usr/local/include/
WORKDIR /home
