FROM golang:1.17.7-bullseye AS Builder

WORKDIR /go/src
COPY . .

ENV GOPROXY=https://goproxy.io,direct
RUN CGO_ENABLED=0 \
    GOOS=linux \
    go build -ldflags '-w -extldflags "-static"' -o app

FROM scratch 

COPY --from=Builder /go/src/app /app
CMD [ "/app" ]
