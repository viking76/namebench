FROM golang:latest

WORKDIR /go/src/app
RUN export GOPATH=/go/src/app
RUN git clone https://github.com/google/namebench.git namebench
RUN go get github.com/mattn/go-sqlite3
RUN go get golang.org/x/net/publicsuffix
RUN go get github.com/miekg/dns
WORKDIR ../

RUN cd namebench
RUN go build namebench.go

ENTRYPOINT ["/go/src/app/namebench_dev_server.sh"]

CMD ["app"]
