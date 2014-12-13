{% from "php/map.jinja" import php with context %}

php-pgsql:
  pkg.installed:
    - name: {{ php.pgsql_pkg }}
