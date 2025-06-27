FROM alpine:edge

LABEL maintainer="Kirill Andrienko"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN apk update && apk upgrade --no-cache && apk add --no-cache --update 'su-exec==0.2-r3' 'tini==0.19.0-r3' && apk cache clean --purge && apk cache clean && rm -rf /var/cache/apk/* && chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT [ "tini" , "/usr/local/bin/docker-entrypoint" ]

CMD [ "sh" ]
