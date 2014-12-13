{% from "php/map.jinja" import php with context %}

php-dev:
  pkg.installed:
    - name: {{ php.dev_pkg }}
