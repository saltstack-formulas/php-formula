# Installs php-cli and manages the associated php.ini

include:
  - php.ng.cli.install
  - php.ng.cli.ini

extend:
  php_cli_ini:
    file:
      - require:
        - sls: php.ng.cli.install
