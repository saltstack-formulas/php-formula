{% from "php/map.jinja" import php with context %}

php-json:
  pkg.installed:
    - name: {{ php.json_pkg }}
