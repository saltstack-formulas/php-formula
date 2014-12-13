{% from "php/map.jinja" import php with context %}

php-mysql:
  pkg.installed:
    - name: {{ php.mysql_pkg }}
