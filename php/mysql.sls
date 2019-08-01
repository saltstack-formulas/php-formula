{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-mysql:
  pkg.installed:
    - name: {{ php.mysql_pkg }}
