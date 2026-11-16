FROM nodered/node-red:latest@sha256:2ccd38b4066648bd5e17430c50a2f8102c566a82fd4f2fc5c342e61664d6896f
USER 0
RUN apk upgrade --no-cache git git-init-template libexpat openssh-client-common openssh-client-default openssh-keygen patch zlib
USER node-red
