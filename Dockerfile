FROM alpine:latest

EXPOSE 8080

RUN apk --update add privoxy openvpn runit

COPY app /app

RUN find /app -name run | xargs chmod u+x

ENV OPENVPN_FILENAME=client.ovpn \
    LOCAL_NETWORK=192.168.1.0/24 \
    ONLINECHECK_DELAY=900

CMD ["runsvdir", "/app"]
