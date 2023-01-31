# PHP + Apache Docker custom image

This Docker image aims to be instantiated when wanting to work locally on PHP & Apache.

## Build

```bash
docker build -t ld-web/php-apache .
```

## Run

```bash
# Map a directory to a /php folder created in the container
docker run -d --name php-apache -v $(pwd)/php:/php ld-web/php-apache
```

## Oh My Zsh

Oh My Zsh is installed into the container.

It can be launched from CLI :

```bash
docker exec -it php-apache zsh
```

If container was attached to VSCode, then from a terminal using default bash, run `zsh`

> **TODO :** See how to make VSCode launch `zsh` directly
