{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-ldap:
  pkg.installed:
    - name: {{ php.ldap_pkg }}
