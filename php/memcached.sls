{% from "php/map.jinja" import php with context %}

php-memcached:
  pkg.installed:
    - name: {{ php.memcached_pkg }}
