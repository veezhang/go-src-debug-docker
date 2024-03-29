FROM ubuntu:18.04

MAINTAINER Vee Zhang <veezhang@126.com>

ENV PATH /go/bin:$PATH

ARG GOVERSION=1.12.9

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y vim curl tar gdb golang \
    && curl -L -o /go${GOVERSION}.linux-amd64.tar.gz https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz \
    && tar -zxvf /go${GOVERSION}.linux-amd64.tar.gz -C / \
    && cd /go/src \
    && export GO_GCFLAGS="-N -l" \
    && ./all.bash \
    && rm -rf /go${GOVERSION}.linux-amd64.tar.gz /var/lib/apt/lists/* /var/cache/apt/*