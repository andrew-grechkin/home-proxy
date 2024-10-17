# home-proxy

Simple server setup to access home SSH through SSL (HTTPS)

Supported backends:

* haproxy (default)
* nginx

## Client setup (.ssh/config)

```conf
Match host "home-proxy.domain"
	ProxyCommand             openssl s_client -quiet -verify_quiet -connect home-proxy.domain:8443 -servername 127.0.0.1 2>/dev/null
```
