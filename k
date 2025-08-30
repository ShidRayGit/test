{
    "inbounds": [],
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
                "protocol": [
                    "bittorrent"
                ],
                "outbound": "block"
            },
            {
                "ip_is_private": true,
                "outbound": "block"
            }
        ]
    }
}
