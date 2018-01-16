[![Docker Build Status](https://img.shields.io/docker/build/chai2010/ibox.svg)](https://hub.docker.com/r/chai2010/ibox/)

# docker工具箱

配置中国区镜像:

- https://www.docker-cn.com/registry-mirror

下载工具箱镜像:

```
$ docker pull chai2010/ibox
$ docker pull chai2010/ibox:plantuml
$ docker pull chai2010/ibox:ditaa
```

使用工具:

```
$ docker run --rm -it -v `pwd`:/root chai2010/ibox go version
```
