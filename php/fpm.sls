{{% from "php/map.jinja" import php with context %}

include:
  - apt

php-fpm:
  pkg:
    - installed
    - name: {{ fpm-pkg }}
  service:
    - running
    - name: {{ fpm-service }}
    - enable: True
