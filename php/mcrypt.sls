{% from "php/map.jinja" import php with context %}

php-mcrypt:
  pkg.installed:
    - name: {{ php.mcrypt_pkg }}
