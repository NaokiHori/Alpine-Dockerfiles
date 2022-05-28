FROM alpine:3.16.0
RUN apk -U upgrade
RUN apk add --no-cache gcc musl-dev make valgrind
WORKDIR /home
