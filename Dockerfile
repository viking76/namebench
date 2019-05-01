FROM golang:1.8


WORKDIR /go/src/app
RUN export GOPATH=/go/src/app
RUN go get github.com/mattn/go-sqlite3
RUN go get golang.org/x/net/publicsuffix
RUN go get github.com/miekg/dns
COPY . /app/src/app

RUN go build namebench.go
WORKDIR ../

ENTRYPOINT ["/go/src/app/namebench_dev_server.sh"]

CMD ["app"]

