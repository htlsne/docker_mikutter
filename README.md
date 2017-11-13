# What's This
TEOKURE condensed container within [mikutter](https://mikutter.hachune.net)

# How to Use
```
$ git clone https://github.com/orumin/docker_mikutter.git
$ cd docker_mikutter
$ docker-compose up --build
```

or

```
$ docker pull orumin/mikutter:latest
$ docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/ orumin/mikutter:latest
```

# Tested Environment
ArchLinux
Docker version 17.10.0-ce, build f4ffd2511c
