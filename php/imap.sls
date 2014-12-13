{% from "php/map.jinja" import php with context %}

php-imap:
  pkg.installed:
    - name: {{ php.imap_pkg }}
