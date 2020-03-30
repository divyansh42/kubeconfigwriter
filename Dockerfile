FROM golang:1.14-alpine AS builder

#ENV GO111MODULE=on
#ENV GOPATH /go
#ENV PATH /go/bin:$PATH

RUN mkdir -p go/src $ go/bin

WORKDIR /go/src/kubeconfigwriter

COPY go.mod .

RUN go mod download

COPY . .
RUN  go build -o /go/bin/kubeconfigwriter .

FROM alpine:3.9

RUN apk add ca-certificates

COPY --from=builder /go/bin/kubeconfigwriter .

ENTRYPOINT ["./kubeconfigwriter"]
# CMD ["/bin/bash"]
