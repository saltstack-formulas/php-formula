{%- from "php/map.jinja" import php with context %}

include:
  - php

php-oauth:
  pkg.installed:
    - name: {{ php.oauth_pkg }}
