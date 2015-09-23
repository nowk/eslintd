FROM nowk/alpine-nodejs:4.1.0

ENV ESLINT_MAJOR v1.5
ENV ESLINT_VERSION v1.5.1

RUN npm install eslint@${ESLINT_VERSION} -g
RUN mkdir -p /opt/lint-src

ENTRYPOINT [ "eslint" ]

# /opt/lint-src is the working dir.
# This is needed for syntastic since syntastic does not send in full path
WORKDIR /opt/lint-src

# /opt/lint-src is the mounted source directory.
VOLUME [ "/opt/lint-src" ]
