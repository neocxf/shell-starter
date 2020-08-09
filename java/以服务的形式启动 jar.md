# 怎样以服务的形式运行一个 java 程序

[TOC]



## 建立相关目录，分配相关的用户和权限

```shell
sudo mkdir /opt/zipkin
sudo mv zipkin.jar /opt/zipkin
ls /opt/zipkin

sudo groupadd -r zipkin
sudo useradd -r -s /bin/false -g zipkin zipkin
sudo chown -R zipkin:zipkin /opt/zipkin
```



## 建立 service文件

```shell
sudo vim /etc/systemd/system/zipkin.service
```

```bash
# Zipkin System Service
[Unit]
Description=Manage Java service
Documentation=https://zipkin.io/

[Service]
WorkingDirectory=/opt/zipkin
ExecStart=/bin/java -Xms128m -Xmx256m -jar zipkin.jar
User=zipkin
Group=zipkin
Type=simple
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```



## 启动 service

```shell
sudo systemctl daemon-reload
sudo systemctl start zipkin.service
sudo systemctl enable zipkin
```



**参考**

1. [Install Zipkin distributed tracing system on Ubuntu / Debian / CentOS](https://computingforgeeks.com/install-zipkin-distributed-tracing-system-on-ubuntu-debian-centos/)