{%- from "php/map.jinja" import php with context %}

include:
  - php

php-mail:
  pkg.installed:
    - name : {{ php.mail_pkg }}
