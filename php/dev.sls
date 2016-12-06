{%- from "php/map.jinja" import php with context %}

include:
  - php

php-dev:
  pkg.installed:
    - name: {{ php.dev_pkg }}
