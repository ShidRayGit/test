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
    - wg-out(suffix:instagram.com)
    - wg-out(suffix:cdninstagram.com)
    - wg-out(suffix:igcdn-cdninstagram.com)

    - wg-out(suffix:facebook.com)
    - wg-out(suffix:fbcdn.net)
    - wg-out(suffix:messenger.com)
    - wg-out(suffix:whatsapp.net)

    - wg-out(suffix:x.com)
    - wg-out(suffix:twitter.com)
    - wg-out(suffix:t.co)
    - wg-out(suffix:twimg.com)

    - wg-out(suffix:spotify.com)
    - wg-out(suffix:scdn.co)
    - wg-out(suffix:audio-fa.scdn.co)
    - wg-out(suffix:audio-sp.scdn.co)

    - wg-out(suffix:soundcloud.com)
    - wg-out(suffix:sndcdn.com)

    - default-out(all)