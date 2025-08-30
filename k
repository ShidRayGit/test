{
  "inbounds": [
    {
      "type": "hysteria2",
      "tag": "hy2-in",
      "listen": "::",
      "listen_port": 44666,
      "obfs": {
        "type": "salamander",
        "password": "jahhahyy7766HTft6tH655"
      },
      "tls": {
        "enabled": true,
        "alpn": ["h3"],
        "acme": {
          "domain": ["putin.fizikade.ir"],
          "email": "baqrym439@gmail.com",
          "provider": "letsencrypt",
          "disable_http_challenge": true,
          "disable_tls_alpn_challenge": true,
          "dns01_challenge": {
            "provider": "cloudflare",
            "api_token": "bW7Oaz4ah5misIO18iPIU7nWp29-yj9iemq5SD0j"
          }
        }
      },
      "masquerade": {
        "type": "proxy",
        "url": "https://news.ycombinator.com/",
        "rewrite_host": true
      }
    }
  ],
  "outbounds": [
    {
      "type": "direct"
    },
    {
      "tag": "block",
      "type": "block"
    }
  ],
  "route": {
    "rules": [
      {
        "protocol": ["bittorrent"],
        "outbound": "block"
      },
      {
        "ip_is_private": true,
        "outbound": "block"
      }
    ]
  }
}