FROM rust:latest

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
	libssl-dev \
	pkg-config \
	libpq-dev \
	&& rm -rf /var/lib/apt/lists/*

COPY . .