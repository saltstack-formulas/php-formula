{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-memcached:
  pkg.installed:
    - name: {{ php.memcached_pkg }}
