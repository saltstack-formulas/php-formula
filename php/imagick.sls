{%- from "php/map.jinja" import php with context %}

include:
  - php

php-imagick:
  pkg.installed:
    - name: {{ php.imagick_pkg }}
