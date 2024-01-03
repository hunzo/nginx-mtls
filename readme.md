# Nginx mTls

## docker

### build images

```bash
docker build -t mynginx .
```

### start container

```bash
docker run --rm -d -p 443:443 mynginx
```

```bash
curl https://server.local.dev
```

```bash
curl --cacert ./ca.crt https://server.local.dev
```

```bash
curl --cacert ./ca.crt --key user1.key --cert user1.crt https://server.local.dev
```

```bash
curl --cacert ./ca.crt --key stranger.key --cert stranger.crt https://server.local.dev
```

```bash
echo -e "GET /\n" | openssl s_client  -key user1.key -cert user1.crt -connect server.local.dev:443 -CAfile ca.crt -state -ign_eof
```

[ref](https://blog.d8k.io/cloudnative/mtls_nginx_curl/)
