{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-sybase:
  pkg.installed:
    - name: {{ php.sybase_pkg }}
