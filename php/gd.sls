{{% from "php/map.jinja" import php with context %}

include:
  - apt

php-gd:
  pkg:
    - installed
    - name: {{ php.gd_pkg }}
