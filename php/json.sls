{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-json:
  pkg.installed:
    - name: {{ php.json_pkg }}
