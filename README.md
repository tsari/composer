# Composer container for composer interactions in projects

# 1. create a shell script "composer" with the following code in your $HOME/bin dir and make it executable

    #!/bin/bash
    docker run -it --rm \
        --name tsari-composer \
        --env="USER" \
        --env="UID=$(id -u)" \
        --env="GID=$(id -g)" \
        -v $PWD:/app \
    tsari/composer "$@"

# 2. Run your composer commands as always

    composer COMPOSER_COMMAND
