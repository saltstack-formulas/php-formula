{% from "php/map.jinja" import php with context %}

php-adodb:
  pkg.installed:
    - name: {{ php.adodb_pkg }}
