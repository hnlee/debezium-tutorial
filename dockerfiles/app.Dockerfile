FROM debian:bullseye

WORKDIR /app

RUN apt-get update -y

COPY bin/ .

CMD ["./set-up-connector.sh"]
