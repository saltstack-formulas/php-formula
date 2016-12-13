{%- from "php/map.jinja" import php with context %}

include:
  - php

php-ldap:
  pkg.installed:
    - name: {{ php.ldap_pkg }}
