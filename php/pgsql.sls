{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-pgsql:
  pkg.installed:
    - name: {{ php.pgsql_pkg }}
