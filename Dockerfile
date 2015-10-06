FROM nowk/nodejs-env:v4.1.2

ENV ESLINT_MAJOR v1.5
ENV ESLINT_VERSION v1.5.1

RUN npm install eslint@${ESLINT_VERSION} -g

ENTRYPOINT [ "eslint" ]

