{% from "php/map.jinja" import php with context %}

php-sqlite:
  pkg.installed:
    - name: {{ php.sqlite_pkg }}
