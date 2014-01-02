{% from "php/map.jinja" import php with context %}

include:
  - apt

php-mcrypt:
  pkg:
    - installed
    - name: {{ php.mcrpyt_pkg }}
