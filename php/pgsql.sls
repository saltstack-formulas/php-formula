{%- from "php/map.jinja" import php with context %}

include:
  - php

php-pgsql:
  pkg.installed:
    - name: {{ php.pgsql_pkg }}
