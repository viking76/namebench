FROM golang:1.8


WORKDIR /go/src/app
RUN export GOPATH=`pwd`
RUN go get github.com/mattn/go-sqlite3 && \
    go get golang.org/x/net/publicsuffix && \
    go get github.com/miekg/dns

RUN go build namebench.go
WORKDIR ../

RUN chmod +x /go/src/app/docker-entrypoint.sh
ENTRYPOINT ["/go/src/app/docker-entrypoint.sh"]

CMD ["app"]

