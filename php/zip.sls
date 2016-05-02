{% from "php/map.jinja" import php with context %}

php-zip:
  pkg.installed:
    - name: {{ php.zip_pkg }}
