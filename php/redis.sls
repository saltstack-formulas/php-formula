{% from "php/map.jinja" import php with context %}

php-redis:
  pkg.installed:
    - name : {{ php.redis_pkg }}
