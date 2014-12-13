{% from "php/map.jinja" import php with context %}

php-suhosin:
  pkg.installed:
    - name: {{ php.suhosin_pkg }}
