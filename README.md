# docker-volume-cifs
cifs plugin for docker1.13

##build
```
go  get github.com/wanghaibo/docker-volume-netshare
cd $GOPATH/github.com/wanghaibo/docker-volume-netshare
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build

```
