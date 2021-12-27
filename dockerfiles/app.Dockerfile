FROM rust:1.57

WORKDIR /app

RUN apt-get update -y

COPY bin/ .

CMD ["./set-up-connector.sh"]
