{%- from "php/map.jinja" import php with context %}

include:
  - php

php-mbstring:
  pkg.installed:
    - name: {{ php.mbstring_pkg }}
