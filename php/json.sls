{%- from "php/map.jinja" import php with context %}

include:
  - php

php-json:
  pkg.installed:
    - name: {{ php.json_pkg }}
