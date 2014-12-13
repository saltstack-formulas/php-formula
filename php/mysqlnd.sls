{% from "php/map.jinja" import php with context %}

php-mysqlnd:
  pkg.installed:
    - name: {{ php.mysqlnd_pkg }}
