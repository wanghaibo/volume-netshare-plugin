# docker-volume-cifs
cifs plugin for docker1.13

##usage
```
docker plugin install wanghaibo/docker-volume-netshare SHARE_CMD=cifs
docker plugin enable wanghaibo/docker-volume-netshare
docker volume create -d wanghaibo/docker-volume-netshare --name wanghaibo -o share=10.0.6.59/remotedir -o username=*** -o password=***
docker run -ti -v wanghaibo:/mount centos ls /mount
```

##compse v3
```
version: '3'
services:
  web:
    images: nginx
    volumes:
      - test:/data
volumes:
  test:
    dirver: wanghaibo/docker-volume-netshare
    dirver_opts:
      share: 10.0.6.59/remotedir
      username: ***
      password: ***
```

##build docker-volume-netshare
```
go  get github.com/wanghaibo/docker-volume-netshare
mkdir -p $GOPATH/github.com/ContainX/
mv $GOPATH/src/github.com/wanghaibo/docker-volume-netshare $GOPATH/github.com/ContainX/
cd $GOPATH/github.com/ContainX/docker-volume-netshare
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build
```

##create plugin
```
sh mkPlugin.sh wanghaibo/docker-volume-netshare
docker plugin push wanghaibo/docker-volume-netshare

```
