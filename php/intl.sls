{% from "php/map.jinja" import php with context %}

php-intl:
  pkg.installed:
    - name: {{ php.intl_pkg }}
