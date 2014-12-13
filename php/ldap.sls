{% from "php/map.jinja" import php with context %}

php-ldap:
  pkg.installed:
    - name: {{ php.ldap_pkg }}
