{% from "php/map.jinja" import php with context %}

php-psql:
  pkg:
    - installed
    - name: {{ php.psql_pkg }}
