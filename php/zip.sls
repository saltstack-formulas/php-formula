{%- from "php/map.jinja" import php with context %}

include:
  - php

php-zip:
  pkg.installed:
    - name: {{ php.zip_pkg }}
