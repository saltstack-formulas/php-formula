{%- from "php/map.jinja" import php with context %}

include:
  - php

php-xml:
  pkg.installed:
    - name: {{ php.xml_pkg }}
