# What's This
TEOKURE condensed container within [mikutter](https://mikutter.hachune.net)

# How to Use
On macOS

```
$ docker build -t mikutter .
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
$ docker run -e DISPLAY=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`:0 mikutter
```

# Tested Environment
macOS
Docker version 18.03.1-ce-mac65 (24312)
