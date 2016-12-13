{%- from "php/map.jinja" import php with context %}

include:
  - php

php-memcached:
  pkg.installed:
    - name: {{ php.memcached_pkg }}
