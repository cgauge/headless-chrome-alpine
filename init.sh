#!/usr/bin/env sh

Xvfb :99 &

/usr/bin/chromedriver --whitelisted-ips 0.0.0.0 --allowed-origins='*'

