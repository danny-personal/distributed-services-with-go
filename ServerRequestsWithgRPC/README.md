```
vscode ➜ .../distributed-services-with-go/ServerRequestsWithgRPC/internal/server (main) $ goreturns server.go 
package server

import (
        api "github.com/danny-personal/distributed-services-with-go/api/v1"
)

type Config struct {
        CommitLog CommitLog
}

var _ api.LogServer = (*grpcServer)(nil)

type grpcServer struct {
        api.UnimplementedLogServer
        *Config
}

func newggrpcServer(config *Config) (srv *grpcServer, err error) {
        srv = &grpcServer{
                Config: config,
        }
        return srv, nil
}
vscode ➜ .../distributed-services-with-go/ServerRequestsWithgRPC/internal/server (main) $
```