FROM golang

ENV GO111MODULE=on

ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

WORKDIR /go/src/kubeconfigwriter

COPY go.mod .
COPY go.sum .

RUN go mod download

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

COPY . .

RUN  go build -o /go/bin/kubeconfigwriter /go/src/kubeconfigwriter

ENTRYPOINT ["/go/bin/kubeconfigwriter"]
