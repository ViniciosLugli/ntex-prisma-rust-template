FROM rust:slim-bullseye

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
	libssl-dev \
	pkg-config \
	&& rm -rf /var/lib/apt/lists/*

COPY . .