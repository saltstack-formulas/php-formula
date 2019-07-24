{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-bcmath:
  pkg.installed:
    - name: {{ php.bcmath_pkg }}
