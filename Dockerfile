FROM alpine:3.7
LABEL maintainer "Andrey Maslov <greyzmeem@gmail.com>"

RUN apk --update add curl
RUN curl -sL -o proxy.tar.gz \
    https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz \
    && tar xzvf proxy.tar.gz \
    && mv oauth2_proxy-*/oauth2_proxy /bin/ \
    && chmod +x /bin/oauth2_proxy \
    && rm -rf proxy.tar.gz oauth2_proxy-*

ENTRYPOINT ["oauth2_proxy"]
