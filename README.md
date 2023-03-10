# PHP + Apache Docker custom image

This Docker image aims to be instantiated when wanting to work locally on PHP & Apache.

## Build

```bash
docker compose build .
```

## Run

```bash
docker compose up -d
```

## Oh My Zsh

Oh My Zsh is installed into the container.

It can be launched from CLI :

```bash
docker exec -it php-sf zsh
```

If container was attached to VSCode, then from a terminal using default bash, run `zsh`

> **TODO :** See how to make VSCode launch `zsh` directly
