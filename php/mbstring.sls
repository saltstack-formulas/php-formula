{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-mbstring:
  pkg.installed:
    - name: {{ php.mbstring_pkg }}
