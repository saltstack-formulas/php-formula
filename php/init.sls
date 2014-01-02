{% from "php/map.jinja" import php with context %}

include:
  - apt

php:
  pkg:
    - installed
    - name: {{ php.php_pkg }}
