{% from "php/map.jinja" import php with context %}

php-cgi:
  pkg.installed:
    - name: {{ php.cgi_pkg }}
