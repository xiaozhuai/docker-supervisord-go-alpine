# supervisord-go-alpine

From [ochinchina/supervisord](https://github.com/ochinchina/supervisord)

```yaml
version: '2'
services:
    mariadb:
        image: xiaozhuai/supervisord-go-alpine:latest
        volumes:
            -   ./aria2.conf:/etc/supervisor.d/aria2.conf
```
