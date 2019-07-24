{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-mcrypt:
  pkg.installed:
    - name: {{ php.mcrypt_pkg }}
