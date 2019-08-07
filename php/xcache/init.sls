# Installs php-xcache and manages the associated xcache.ini

include:
  - php.xcache.install
  - php.xcache.ini

extend:
  php_xcache_ini:
    file:
      - require:
        - sls: php.xcache.install
