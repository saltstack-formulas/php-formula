{% from "php/map.jinja" import php with context %}

include:
  - php

php-suhosin:
  pkg.installed:
    - name: {{ php.suhosin_pkg }}
