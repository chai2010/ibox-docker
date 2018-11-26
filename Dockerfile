# Copyright 2017 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a Apache
# license that can be found in the LICENSE file.

FROM golang:1.11.2-alpine3.6 as builder

RUN apk add --no-cache git curl openssl gcc

RUN go get rsc.io/goversion
RUN go get github.com/google/gops

RUN go get github.com/golang/protobuf/protoc-gen-go
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get github.com/mwitkow/go-proto-validators/protoc-gen-govalidators

RUN go get github.com/kelseyhightower/confd
RUN go get github.com/yunify/metad

RUN go get github.com/chai2010/pwdgen

# download grpcurl_1.0.0
RUN mkdir -p /grpcurl-download && cd /grpcurl-download \
	&& curl -L https://github.com/fullstorydev/grpcurl/releases/download/v1.0.0/grpcurl_1.0.0_linux_x86_64.tar.gz | tar zx

# download etcd-v3.3.10
RUN mkdir -p /etcd-download && cd /etcd-download \
	&& curl -L https://github.com/coreos/etcd/releases/download/v3.3.10/etcd-v3.3.10-linux-amd64.tar.gz | tar zx

# the protoc can't run on alpine,
# we only need the protobuf's stdarnd library in the `/protoc/include`.
RUN mkdir -p /protoc && cd /protoc \
	&& wget https://github.com/google/protobuf/releases/download/v3.5.0/protoc-3.5.0-linux-x86_64.zip \
	&& unzip protoc-3.5.0-linux-x86_64.zip

FROM golang:1.11.2-alpine3.6

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


COPY --from=builder /grpcurl-download/grpcurl /usr/local/bin/grpcurl

COPY --from=builder /etcd-download/etcd-v3.2.12-linux-amd64/etcd    /usr/local/bin/etcd
COPY --from=builder /etcd-download/etcd-v3.2.12-linux-amd64/etcdctl /usr/local/bin/etcdctl

COPY --from=builder /protoc/include /usr/local/include
COPY --from=builder /go/bin /go/bin
