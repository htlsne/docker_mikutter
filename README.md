# docker\_mikutter
ておくれをコンテナに凝縮した

# なんこれ
mikutter の develop ブランチ環境をお手軽に構築できてしまうておくれたコンテナ  
ruby 2.4.1 の環境で mikutter を git から落としてきます

# 使い方
コンテナイメージ作成
```
$ git clone https://github.com/orumin/docker_mikutter.git
$ cd docker_mikutter
$ docker-compose up --build
```

# 作った環境
ArchLinux
Docker version 17.10.0-ce, build f4ffd2511c
