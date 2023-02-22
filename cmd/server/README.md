`namespace` Create
```
kubectl create ns server
```

Application Deploy
```
cat << EOF  | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: go-server
  namespace: server
spec:
  selector:
    matchLabels:
      run: go-server
  replicas: 1
  template:
    metadata:
      labels:
        run: go-server
    spec:
      containers:
      - name: go-server
        #image: nginx
        image: asia-northeast1-docker.pkg.dev/sanbox-334000/docker/server:latest
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: go-server
  namespace: server
  labels:
    run: go-server
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    targetPort: 8080
    protocol: TCP
  selector:
    run: go-server
EOF
```

Application Confirmation
```
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X POST *.*.*.*:8080 -d '{"record": {"value": "moto"}}'
{"offset":0}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X POST *.*.*.*:8080 -d '{"record": {"value": "yama"}}'
{"offset":1}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X GET *.*.*.*:8080 -d '{"offset": 1}'
{"record":{"value":"yama","offset":1}}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X GET *.*.*.*:8080 -d '{"offset": 0}'
{"record":{"value":"moto","offset":0}}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X POST *.*.*.*:8080 -d '{"record": {"value": "dais"}}'
{"offset":2}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$ curl -X GET *.*.*.*:8080 -d '{"offset": 2}'
{"record":{"value":"dais","offset":2}}
yamamoto_daisuke@cloudshell:~ (sanbox-334000)$
```
