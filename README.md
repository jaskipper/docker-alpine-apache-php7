## Alpine microcontainer with apache and php7

This is a micro docker container *(forked from nimmis/alpine-apache-php7)* based on Alpine 3.4 and Apache 2.2 and php 7

### Examples

This image is built on nimmis/alpine-micro which is a modified version of Alpine with a working
init process, a working cron, logrotate and syslog. Services are started with
runit daemon, for more information about that see [nimmis/alpine-mico](https://registry.hub.docker.com/u/nimmis/alpine-micro/)


#### starting the container as a daemon

	docker run -d --name apache-php7 jaskipper/alpine-apache-php7

This will start the container with apache process runnung, access the container with

	docker exec -ti apache-php7 /bin/sh

#### Static web folder

The image exposes a volume at /web. The structure below /web is

| Directory | Function |
| --------- | -------- |
| html | web root |
| cgi-bin | cgi bin folder |
| config | config directory |
| logs | log directory |

To use this start the container with

	docker run -d --name apache-php7 -v /path/to/web:/web jaskipper/alpine-apache-php7

if the folders are missing they will be created

#### Accessing apache from outside the container

To access the webserver from external you use the -P command where the syntax is

	-P <external port on host>:<local port in container>

so to access the apache server on port 8080 you should use the command

	docker run -d --name apache-php7 -p 8080:80  jaskipper/alpine-apache-php7
