{
  "log": {
    "level": "info"
  },
  "dns": {
    "servers": [
      { "address": "1.1.1.1" },
      { "address": "1.0.0.1" }
    ]
  },
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
      "type": "wireguard",
      "tag": "wg-social",
      "server": "213.142.133.113",
      "server_port": 47616,
      "local_address": ["10.0.0.2/32"],
      "private_key": "4CMOc61Y0eLqoj3u2ukXDhZNU4wYGSotxge6dlo3JUk=",
      "peer_public_key": "Dz/+AZXMmWzJhf+PEVWAS5s2iLxcbr5NJLQfkaNQaHM=",
      "pre_shared_key": "Sv6yKLQ2HeGoZVVdUCShEZiMKSsef7wYQz1WMr4Jlr8=",
      "mtu": 1420,
      "domain_strategy": "prefer_ipv4"
    },
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
        "domain_suffix": [
          "instagram.com",
          "cdninstagram.com",
          "instagr.am",
          "ig.me",
          "facebook.com",
          "fb.com",
          "fbcdn.net",
          "messenger.com",
          "twitter.com",
          "x.com",
          "t.co",
          "twimg.com",
          "video.twimg.com",
          "spotify.com",
          "scdn.co",
          "spotifycdn.com",
          "soundcloud.com",
          "sndcdn.com",
          "sc-cdn.net"
        ],
        "outbound": "wg-social"
      },
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