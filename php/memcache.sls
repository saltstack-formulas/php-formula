{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-memcache:
  pkg.installed:
    - name: {{ php.memcache_pkg }}
