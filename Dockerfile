FROM node:20-bookworm-slim

# 2. THE FIX: Place Option A right here
# This updates the package list and installs the specific security patch
RUN apt-get update && apt-get install -y --no-install-recommends \
    git=1:2.20.1-2+deb10u9 \
    && rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  4000
CMD node graphserver.js
