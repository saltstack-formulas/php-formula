{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-apc:
  pkg.installed:
    - name: {{ php.apc_pkg }}
