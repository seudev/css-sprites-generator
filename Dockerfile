FROM alpine:3.13.4

LABEL vendor="Seudev" \
    homepage="https://github.com/seudev/css-sprites-generator" \
    author="Thomás Sousa Silva <thomassousa.dev>"

RUN apk add --no-cache imagemagick curl grep \
    && rm -rf /var/cache/apk/*

COPY css-sprites-generator /usr/bin

RUN chmod +x /usr/bin/css-sprites-generator

WORKDIR /usr/src/app

ENV DEBUG_ENABLED=false
ENV IMAGES_PATH_PATTERN=src/*
ENV IMAGE_FORMAT=PNG
ENV SPRITES_BASE_CLASS=img
ENV SPRITES_CLASS_PREFIX=img-
ENV IMAGE_SPRITES_FILENAME=sprite-result.png
ENV IMAGE_SPRITES_BASE_URL=
ENV STYLE_FILENAME=style.css
ENV EXAMPLE_FILENAME=example.html
ENV PERCENTAGE_SCALE=2

ENV OPTIMIZE_IMAGE_SPRITES=false
ENV TINIFY_API_SHRINK_URL=https://api.tinify.com/shrink
ENV TINIFY_API_KEY=
ENV TINIFY_JSON_RESPONSE_FILE="tinify-response.json"

CMD ["css-sprites-generator"]
