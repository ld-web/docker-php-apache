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

## VSCode Dev Container

Put the following content into a `.devcontainer.json` file located at the root of your project, then launch with [Dev Containers VSCode extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) :

```json
{
  "name": "PHP - Apache",
  "image": "ghcr.io/ld-web/php-apache:latest",
  "postStartCommand": "sudo service apache2 start",
  "mounts": [
    "source=${localWorkspaceFolder},target=/var/www/html,type=bind,consistency=cached"
  ],
  "customizations": {
    "vscode": {
      "extensions": [
        "eamodio.gitlens",
        "formulahendry.auto-close-tag",
        "formulahendry.auto-rename-tag",
        "adpyke.codesnap",
        "oderwat.indent-rainbow",
        "PKief.material-icon-theme",
        "xdebug.php-debug",
        "neilbrayfield.php-docblocker",
        "junstyle.php-cs-fixer",
        "devsense.phptools-vscode",
        "JakeWilson.vscode-placeholder-images",
        "esbenp.prettier-vscode",
        "helixquar.randomeverything",
        "bradlc.vscode-tailwindcss",
        "narsenico.vscode-progressive-increment",
        "MykhailoKushnir.vscode-php-getter-setter"
      ],
      "settings": {
        "terminal.integrated.defaultProfile.linux": "zsh",
        "editor.wordWrap": "on",
        "search.exclude": {
          "**/node_modules": true,
          "**/bower_components": true,
          "**/vendor": true,
          "**/cache": true,
          "**/docs": true,
          "**/tests": true
        },
        "php.validate.enable": false,
        "editor.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
        "indentRainbow.updateDelay": 200,
        "indentRainbow.colors": [
          "rgba(16,16,16,0.1)",
          "rgba(16,16,16,0.2)",
          "rgba(16,16,16,0.3)",
          "rgba(16,16,16,0.4)",
          "rgba(16,16,16,0.5)",
          "rgba(16,16,16,0.6)",
          "rgba(16,16,16,0.7)",
          "rgba(16,16,16,0.8)",
          "rgba(16,16,16,0.9)",
          "rgba(16,16,16,1.0)"
        ],
        "php.suggest.basic": false,
        "[php]": {
          "editor.defaultFormatter": "junstyle.php-cs-fixer"
        },
        "emmet.includeLanguages": {
          "javascript": "javascriptreact",
          "twig": "html"
        },
        "php-cs-fixer.executablePath": "${extensionPath}/php-cs-fixer.phar",
        "php-cs-fixer.rules": "@PSR12"
      }
    }
  }
}
```
