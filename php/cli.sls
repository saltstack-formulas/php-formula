{%- from "php/map.jinja" import php with context %}

include:
  - php

php-cli:
  pkg.installed:
    - name: {{ php.cli_pkg }}
