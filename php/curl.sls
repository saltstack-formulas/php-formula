{% from "php/map.jinja" import php with context %}

include:
  - apt

php-curl:
  pkg
    - installed
    - name: {{ php.curl-pkg }}
