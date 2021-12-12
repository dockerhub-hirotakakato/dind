FROM docker:dind

ENTRYPOINT ["entrypoint.sh"]

COPY entrypoint.sh /usr/local/bin
