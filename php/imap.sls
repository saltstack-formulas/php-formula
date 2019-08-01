{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-imap:
  pkg.installed:
    - name: {{ php.imap_pkg }}
