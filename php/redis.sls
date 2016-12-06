{%- from "php/map.jinja" import php with context %}

include:
  - php

php-redis:
  pkg.installed:
    - name : {{ php.redis_pkg }}
