{% from "php/map.jinja" import php with context %}

php-bcmath:
  pkg.installed:
    - name: {{ php.bcmath_pkg }}
