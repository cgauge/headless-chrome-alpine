FROM alpine:3.12

RUN apk update && apk upgrade \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    chromium@edge \
    chromium-chromedriver@edge \
    xvfb \
    nss@edge \
    && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

ENV DISPLAY ":99"

COPY ./init.sh /root/init.sh

RUN chmod +x /root/init.sh

RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

CMD ["/root/init.sh"]

