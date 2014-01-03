{% from "php/map.jinja" import php with context %}

php:
  pkg:
    - installed
    - name: {{ php.php_pkg }}
