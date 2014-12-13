{% from "php/map.jinja" import php with context %}

php-mbstring:
  pkg.installed:
    - name: {{ php.mbstring_pkg }}
