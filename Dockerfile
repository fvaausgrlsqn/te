FROM alpine:latest as builder

RUN apk add --no-cache make cmake gcc musl-dev git g++ libuv-dev libmicrohttpd-dev

RUN git clone https://github.com/webchain-network/webchain-miner && cd /webchain-miner && cmake . && make -j

FROM alpine:latest

RUN apk add --no-cache ca-certificates libuv libmicrohttpd
COPY --from=builder /webchain-miner/webchain-miner /usr/sbin/
COPY config.json /usr/sbin/

ENTRYPOINT ["webchain-miner"]
