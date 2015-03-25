# Composer container for composer interactions in projects

# 1. Put this in your ~/.profile file

    alias composer="docker run --rm -i -t -v \$PWD:/srv tsari/composer"

# 2. Run your composer commands as always

    composer COMPOSER_COMMAND
