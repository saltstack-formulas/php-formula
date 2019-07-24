{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-imagick:
  pkg.installed:
    - name: {{ php.imagick_pkg }}
