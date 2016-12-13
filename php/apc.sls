{%- from "php/map.jinja" import php with context %}

include:
  - php

php-apc:
  pkg.installed:
    - name: {{ php.apc_pkg }}
