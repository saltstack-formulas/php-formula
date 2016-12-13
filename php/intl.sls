{%- from "php/map.jinja" import php with context %}

include:
  - php

php-intl:
  pkg.installed:
    - name: {{ php.intl_pkg }}
