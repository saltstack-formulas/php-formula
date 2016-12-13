{%- from "php/map.jinja" import php with context %}

include:
  - php

php-bcmath:
  pkg.installed:
    - name: {{ php.bcmath_pkg }}
