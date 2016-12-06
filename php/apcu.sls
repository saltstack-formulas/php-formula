{%- from "php/map.jinja" import php with context %}

include:
  - php

php-apcu:
  pkg.installed:
    - name: {{ php.apcu_pkg }}
