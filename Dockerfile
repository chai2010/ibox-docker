# Copyright 2017 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a Apache
# license that can be found in the LICENSE file.

FROM golang:1.9.2-alpine3.6 as builder

RUN apk add --no-cache git curl openssl

RUN go get github.com/golang/protobuf/protoc-gen-go
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get github.com/mwitkow/go-proto-validators/protoc-gen-govalidators

RUN go get github.com/coreos/etcd
RUN go get github.com/kelseyhightower/confd
RUN go get github.com/yunify/metad

RUN go get go get github.com/chai2010/pwdgen

# the protoc can't run on alpine,
# we only need the protobuf's stdarnd library in the `/protoc/include`.
RUN mkdir -p /protoc && cd /protoc \
	&& wget https://github.com/google/protobuf/releases/download/v3.5.0/protoc-3.5.0-linux-x86_64.zip \
	&& unzip protoc-3.5.0-linux-x86_64.zip

FROM golang:1.9.2-alpine3.6

RUN apk add --no-cache \
	git \
	make \
	curl \
	openssl \
	swig \
	protobuf \
	graphviz \
	gnuplot \
	lua \
	hugo \
	caddy \
	imagemagick

COPY --from=builder /protoc/include /usr/local/include
COPY --from=builder /go/bin /go/bin
