{%- from "php/map.jinja" import php with context %}

include:
  - php

php-soap:
  pkg.installed:
    - name : {{ php.soap_pkg }}
