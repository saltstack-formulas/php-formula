{% from "php/map.jinja" import php with context %}

php-oauth:
  pkg.installed:
    - name: {{ php.oauth_pkg }}
