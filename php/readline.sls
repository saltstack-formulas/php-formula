{% from "php/map.jinja" import php with context %}

php-readline:
  pkg:
    - installed
    - name: {{ php.readline_pkg }}
