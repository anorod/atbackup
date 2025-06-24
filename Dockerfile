FROM alpine:3.22

LABEL maintainer="Lorenzo Carbonell <a.k.a. atareao> lorenzo.carbonell.cerezo@gmail.com"

RUN apk add --update \
            --no-cache \
            openssh~=10.0 \
            tzdata~=2025 \
            curl~=8.14 \
            borgbackup~=1.4 \
            mariadb-client~=11.4 \
            jq~=1.8 \
            fuse~=2.9 \
            dcron~=4.6 \
            run-parts~=4.11 && \
            mariadb-connector~=3.4 && \
    rm -rf /var/cache/apk && \
    rm -rf /var/lib/app/lists* && \
    mkdir -p /root/.ssh

COPY run.sh backup.sh /

WORKDIR "/cronitab"

CMD ["/bin/sh", "/run.sh"]
