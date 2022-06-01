# Steamcmd docker base

### work in progress.

![Trueosiris Rules](https://img.shields.io/badge/trueosiris-rules-f08060)
[![Docker Pulls](https://badgen.net/docker/pulls/trueosiris/steam?icon=docker&label=pulls)](https://hub.docker.com/r/trueosiris/steam/)
[![Docker Stars](https://badgen.net/docker/stars/trueosiris/steam?icon=docker&label=stars)](https://hub.docker.com/r/trueosiris/steam/)
[![Docker Image Size](https://badgen.net/docker/size/trueosiris/steam?icon=docker&label=image%20size)](https://hub.docker.com/r/trueosiris/steam/)
![Github stars](https://badgen.net/github/stars/trueosiris/docker-steam?icon=github&label=stars)
![Github forks](https://badgen.net/github/forks/trueosiris/docker-steam?icon=github&label=forks)
![Github issues](https://img.shields.io/github/issues/TrueOsiris/docker-steam)
![Github last-commit](https://img.shields.io/github/last-commit/TrueOsiris/docker-steam)

Stable baseimage for steamcmd dedicated servers<br>
idea: both linux and windows.<br>

     docker run -d --name='steamserver' --net='bridge' -e TZ="Europe/Paris" 'trueosiris/steam'

