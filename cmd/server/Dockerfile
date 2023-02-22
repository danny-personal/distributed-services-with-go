FROM golang:1.20.1-bullseye AS build
WORKDIR /cmd/server
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/server main.go

FROM scratch
COPY --from=build /go/bin/server /bin/server
ENTRYPOINT ["/bin/server"]
