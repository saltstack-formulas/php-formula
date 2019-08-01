{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-mail:
  pkg.installed:
    - name : {{ php.mail_pkg }}
