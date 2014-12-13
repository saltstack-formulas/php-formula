{% from "php/map.jinja" import php with context %}

php-pear:
  pkg.installed:
    - name : {{ php.pear_pkg }}
