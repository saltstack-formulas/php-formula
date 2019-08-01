{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-curl:
  pkg.installed:
    - name: {{ php.curl_pkg }}
