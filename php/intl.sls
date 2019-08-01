{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-intl:
  pkg.installed:
    - name: {{ php.intl_pkg }}
