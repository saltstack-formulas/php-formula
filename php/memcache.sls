{% from "php/map.jinja" import php with context %}

php-memcache:
  pkg.installed:
    - name: {{ php.memcache_pkg }}
