{%- from "php/map.jinja" import php with context %}

include:
  - php

php-cgi:
  pkg.installed:
    - name: {{ php.cgi_pkg }}
