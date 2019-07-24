{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-readline:
  pkg:
    - installed
    - name: {{ php.readline_pkg }}
