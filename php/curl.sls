{%- from "php/map.jinja" import php with context %}

include:
  - php

php-curl:
  pkg.installed:
    - name: {{ php.curl_pkg }}
