module github.com/danny-personal/distributed-services-with-go/cmd/server

go 1.20

replace github.com/danny-personal/distributed-services-with-go/internal/server => ../../internal/server/

require github.com/danny-personal/distributed-services-with-go/internal/server v0.0.0-00010101000000-000000000000

require github.com/gorilla/mux v1.8.0 // indirect
