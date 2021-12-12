#!/bin/sh -eu

ca_cert_dir=/usr/share/ca-certificates
ca_cert_file=ca.cert

ca=$ca_cert_dir/$ca_cert_file

if [ -n "${CA_CERT_URL:-}" ]; then
  wget -qO "$ca" "$CA_CERT_URL"

elif [ -n "${CA_CERT:-}" ]; then
  echo -n "$CA_CERT" > "$ca"
fi

if [ -e "$ca" ]; then
  echo "$ca_cert_file" >> /etc/ca-certificates.conf
  update-ca-certificates 2> /dev/null
fi

exec dockerd-entrypoint.sh ${DOCKER_OPTS:-} "$@"
