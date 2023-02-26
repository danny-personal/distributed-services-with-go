```
vscode ➜ .../distributed-services-with-go/ServerSideServiceDiscovery/internal/discovery (main) $ go get -u github.com/hashicorp/serf/serf
go: writing stat cache: mkdir /go/pkg/mod/cache/download/github.com/hashicorp: permission denied
go: downloading github.com/hashicorp/serf v0.10.1
go: github.com/hashicorp/serf/serf: mkdir /go/pkg/mod/cache/download/github.com/hashicorp: permission denied
vscode ➜ .../distributed-services-with-go/ServerSideServiceDiscovery/internal/discovery (main) 
```

```
sudo chmod -R a+w /go/pkg/mod
go get -u github.com/hashicorp/serf/serf
go mod tidy
```

```
vscode ➜ .../distributed-services-with-go/ServerSideServiceDiscovery/internal/discovery (main) $ go test ./...
ok      github.com/danny-personal/distributed-services-with-go/ServerSideServiceDiscovery/internal/discovery    (cached)
vscode ➜ .../distributed-services-with-go/ServerSideServiceDiscovery/internal/discovery (main) $ 
```