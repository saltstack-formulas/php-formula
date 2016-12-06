{%- from "php/map.jinja" import php with context %}

include:
  - php

php-gd:
  pkg.installed:
    - name: {{ php.gd_pkg }}
