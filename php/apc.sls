{% from "php/map.jinja" import php with context %}

include:
  - apt

php-apc:
  pkg:
    - installed
    - name: {{ php.apc-pkg }}
