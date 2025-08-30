listen: :44666

acme:
  domains:
    - putin.fizikade.ir
  email: baqrym439@gmail.com
  type: dns
  dns:
    name: cloudflare
    config:
      cloudflare_api_token: bW7Oaz4ah5misIO18iPIU7nWp29-yj9iemq5SD0j

auth:
  type: command
  command: echo

masquerade:
  type: proxy
  proxy:
    url: https://news.ycombinator.com/
    rewriteHost: true

obfs:
  type: salamander
  salamander:
    password: jahhahyy7766HTft6tH655

sniff:
  enable: true
  timeout: 2s
  rewriteDomain: false
  tcpPorts: 80,443,8000-9000
  udpPorts: all

outbounds:
  - name: default-out
    type: direct
    direct:
      mode: auto
  - name: wg-out
    type: direct
    direct:
      mode: auto
      bindIPv4: 10.0.0.2

acl:
  inline:
    - { rule: "suffix", value: "instagram.com", outbound: "wg-out" }
    - { rule: "suffix", value: "cdninstagram.com", outbound: "wg-out" }
    - { rule: "suffix", value: "igcdn-cdninstagram.com", outbound: "wg-out" }

    - { rule: "suffix", value: "facebook.com", outbound: "wg-out" }
    - { rule: "suffix", value: "fbcdn.net", outbound: "wg-out" }
    - { rule: "suffix", value: "messenger.com", outbound: "wg-out" }
    - { rule: "suffix", value: "whatsapp.net", outbound: "wg-out" }

    - { rule: "suffix", value: "x.com", outbound: "wg-out" }
    - { rule: "suffix", value: "twitter.com", outbound: "wg-out" }
    - { rule: "suffix", value: "t.co", outbound: "wg-out" }
    - { rule: "suffix", value: "twimg.com", outbound: "wg-out" }

    - { rule: "suffix", value: "spotify.com", outbound: "wg-out" }
    - { rule: "suffix", value: "scdn.co", outbound: "wg-out" }
    - { rule: "suffix", value: "audio-fa.scdn.co", outbound: "wg-out" }
    - { rule: "suffix", value: "audio-sp.scdn.co", outbound: "wg-out" }

    - { rule: "suffix", value: "soundcloud.com", outbound: "wg-out" }
    - { rule: "suffix", value: "sndcdn.com", outbound: "wg-out" }

    - { rule: "all", outbound: "default-out" }