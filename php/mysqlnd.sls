{%- from "php/map.jinja" import php with context %}

include:
  - php

php-mysqlnd:
  pkg.installed:
    - name: {{ php.mysqlnd_pkg }}
