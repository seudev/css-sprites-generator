# CSS Sprites Generator

[![css-sprites-generator](http://dockeri.co/image/seudev/css-sprites-generator)](https://hub.docker.com/r/seudev/css-sprites-generator)

## What is it?

A tool to combine multiple images into a single image file and generate CSS classes for each image, to help with website performance.

This tool is made with Docker and Shell Script. Internally it use [ImageMagick](https://imagemagick.org) to combine the images and get image infos.

## Useful links

* [CSS Sprites: What They Are, Why They’re Cool, and How To Use Them](https://css-tricks.com/css-sprites)
* [Implementing image sprites in CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Images/Implementing_image_sprites_in_CSS)

## Demo

See the `demo` folder. The `demo/src/` folder contains the source images and the `demo/build` contains the generated files.

* The total size of the ten images is *66.3 kB*, combining it the total size was reduced to *10.7 kB* and after optimization is *3.8 kB*.
* The generated stylesheet file size is *784 bytes* (non minified).

## Using css-sprites-generator

Put the desired images in a folder, then run the below command mapping the source images folder and build folder.

* Map the source image folder to `/usr/src/app/src`
* Map the build folder to `/usr/src/app/build`

```sh
docker run --rm -v `pwd`/src:/usr/src/app/src -v `pwd`/build:/usr/src/app/build seudev/css-sprites-generator:1.0
```

### Environment Variables

If necessary you can change the below variables. Pass it to the docker container (e.g `docker run -e VARIABLE=value`)

| **Env**                     | **Default Value**               | **Description**                                                                                                     |
| --------------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `DEBUG_ENABLED`             | `false`                         | Use `true` to enable the debug mode                                                                                 |
| `IMAGES_PATH_PATTERN`       | `src/*`                         | The images path pattern used to filter the images.                                                                  |
| `IMAGE_FORMAT`              | `PNG8`                          | The sprite image format.                                                                                            |
| `SPRITES_BASE_CLASS`        | `img`                           | The CSS class name of the base style.                                                                               |
| `SPRITES_CLASS_PREFIX`      | `img-`                          | The CSS class name prefix of the image sprites.                                                                     |
| `IMAGE_SPRITES_FILENAME`    | `sprite-result.png`             | The filename of the combined images.                                                                                |
| `IMAGE_SPRITES_BASE_URL`    |                                 | The base URL of the image sprites.                                                                                  |
| `STYLE_FILENAME`            | `style.css`                     | The CSS filename.                                                                                                   |
| `EXAMPLE_FILENAME`          | `example.html`                  | The filename of the example HTML page.                                                                              |
| `OPTIMIZE_SPRITES_IMAGE`    | `false`                         | Use `true` to optimize the image sprites, using the tinify API.                                                     |
| `TINIFY_API_SHRINK_URL`     | `https://api.tinify.com/shrink` | The tinify API URL to compress the image. See https://tinypng.com/developers/reference                              |
| `TINIFY_API_KEY`            |                                 | The tinify API key. Example: `api:ewp9orweoifuwerfjoaewsirfu9aw3eu`. Get your key on https://tinypng.com/developers |
| `TINIFY_JSON_RESPONSE_FILE` | `tinify-response.json`          | The filename of the tinify shrink response.                                                                         |

## Building this image

```sh
docker build -t seudev/css-sprites-generator:1.0 .
```

## Licensing

**seudev/css-sprites-generator** is provided and distributed under the [Apache Software License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Refer to *LICENSE* for more information.
