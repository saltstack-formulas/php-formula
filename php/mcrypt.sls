{%- from "php/map.jinja" import php with context %}

include:
  - php

php-mcrypt:
  pkg.installed:
    - name: {{ php.mcrypt_pkg }}
