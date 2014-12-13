{% from "php/map.jinja" import php with context %}

php-gd:
  pkg.installed:
    - name: {{ php.gd_pkg }}
