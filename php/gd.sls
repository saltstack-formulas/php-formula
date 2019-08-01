{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-gd:
  pkg.installed:
    - name: {{ php.gd_pkg }}
