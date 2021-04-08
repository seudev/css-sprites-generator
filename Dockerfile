FROM alpine:3.13.4

LABEL vendor="Seudev" \
    homepage="http://docker-4dev.seudev.com" \
    author="Thomás Sousa Silva <thomassousa.dev>"

RUN apk add --no-cache imagemagick \
    && rm -rf /var/cache/apk/*

COPY css-sprites-generator /usr/bin

RUN chmod +x /usr/bin/css-sprites-generator

WORKDIR /usr/src/app

ENV DEBUG_ENABLED=false
ENV IMAGES_PATH_PATTERN=src/*
ENV IMAGE_FORMAT=PNG8
ENV SPRITES_BASE_CLASS=img
ENV SPRITES_CLASS_PREFIX=img-
ENV IMAGE_SPRITES_FILENAME=sprite-result.png
ENV IMAGE_SPRITES_BASE_URL=
ENV STYLE_FILENAME=style.css
ENV EXAMPLE_FILENAME=example.html

CMD ["css-sprites-generator"]
