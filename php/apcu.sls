{% from "php/map.jinja" import php with context %}

php-apcu:
  pkg.installed:
    - name: {{ php.apcu_pkg }}
