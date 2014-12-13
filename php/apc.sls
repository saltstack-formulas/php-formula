{% from "php/map.jinja" import php with context %}

php-apc:
  pkg.installed:
    - name: {{ php.apc_pkg }}
