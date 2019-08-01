{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-adodb:
  pkg.installed:
    - name: {{ php.adodb_pkg }}
