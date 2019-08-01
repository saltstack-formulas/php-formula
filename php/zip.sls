{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-zip:
  pkg.installed:
    - name: {{ php.zip_pkg }}
