{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-cgi:
  pkg.installed:
    - name: {{ php.cgi_pkg }}
