{%- from "php/map.jinja" import php with context %}

include:
  - php

php-pear:
  pkg.installed:
    - name : {{ php.pear_pkg }}
