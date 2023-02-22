#FROM golang:1.14-alpine AS build
FROM golang:1.20.1-bullseye AS build
#WORKDIR /go/src/proglog
WORKDIR /cmd/server
COPY . .
#RUN CGO_ENABLED=0 go build -o /go/bin/proglog ./cmd/proglog
RUN CGO_ENABLED=0 go build -o /go/bin/server main.go

FROM scratch
#COPY --from=build /go/bin/proglog /bin/proglog
COPY --from=build /go/bin/server /bin/server
ENTRYPOINT ["/bin/server"]
