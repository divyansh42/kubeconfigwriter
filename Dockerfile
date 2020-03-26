FROM golang

ENV GO111MODULE=on

WORKDIR /go/src/kubeconfigwriter
COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

RUN go build .

EXPOSE 8080
