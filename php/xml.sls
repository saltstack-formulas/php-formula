{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-xml:
  pkg.installed:
    - name: {{ php.xml_pkg }}
