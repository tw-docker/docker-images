FROM data.forgejo.org/forgejo/runner:12@sha256:48b0539854bfc769fbf629725e089e35cfa1227ddedc7e45436b83bb9502ae27
USER 0
RUN apk upgrade --no-cache brotli-libs c-ares git git-init-template libcrypto3 libcurl libexpat libssl3 musl musl-utils nghttp2-libs pcre2 zlib
USER 1000:1000
