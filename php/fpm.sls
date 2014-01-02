{{% from "php/map.jinja" import php with context %}

include:
  - apt

php-fpm:
  pkg:
    - installed
    - name: {{ php.fpm-pkg }}
  service:
    - running
    - name: {{ php.fpm-service }}
    - enable: True
