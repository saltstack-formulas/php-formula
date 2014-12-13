{% from "php/map.jinja" import php with context %}

php-cli:
  pkg.installed:
    - name: {{ php.cli_pkg }}
