# Installs php-xcache and manages the associated xcache.ini

include:
  - php.ng.xcache.install
  - php.ng.xcache.ini

extend:
  php_xcache_ini:
    file:
      - require:
        - sls: php.ng.xcache.install
