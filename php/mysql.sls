{%- from "php/map.jinja" import php with context %}

include:
  - php

php-mysql:
  pkg.installed:
    - name: {{ php.mysql_pkg }}
