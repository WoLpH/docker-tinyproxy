# Tinyproxy in Docker
An anonymous Tinyproxy based proxy server with configurable authentication and ACL.

Find it on [GitHub](https://github.com/wolph/docker-tinyproxy).

Find it on [DockerHub](https://hub.docker.com/repository/docker/wolph/tinyproxy).

### Usage
---
##### Running a new Tinyproxy container

```
Usage:
    docker run -d --name='tinyproxy' -p <Host_Port>:8888 --env BASIC_AUTH_USER=<username> --env BASIC_AUTH_PASSWORD=<password> wolph/tinyproxy:latest <ACL>

        - Set <Host_Port> to the port you wish the proxy to be accessible from.
        - Set <ACL> to 'ANY' to allow unrestricted proxy access, or one or more space seperated IP/CIDR addresses for tighter security.
        - Basic auth is optional.

    Examples:
        docker run -d --name='tinyproxy' -p 6666:8888 wolph/tinyproxy:latest ANY
        docker run -d --name='tinyproxy' -p 7777:8888 wolph/tinyproxy:latest 87.115.60.124
        docker run -d --name='tinyproxy' -p 8888:8888 wolph/tinyproxy:latest 10.103.0.100/24 192.168.1.22/16
```

### Monitoring
---
##### Logs
`docker logs -f tinyproxy` will display a following tail of `/var/log/tinyproxy/tinyproxy.log`

##### Stats
Navigating to `http://tinyproxy.stats/` while connected to the proxy will display the Tinyproxy Stats page.

##### Filtering
Any Tinyproxy filter setting such as FilterDefaultDeny can be set as an environment variable.  You can map a filter file on the parent file system into the container for the proxy instance to use.

```
        docker run -d --name='tinyproxy' -p 6666:8888 -v ~/filter-on-parent.conf:/etc/tinyproxy/filter.conf  --env Filter="/etc/tinyproxy/filter.conf" --env FilterDefaultDeny=Yes  wolph/tinyproxy:latest ANY
```

### Contribute
---
As always, contributions are appriciated. Simply open a Pull request.
