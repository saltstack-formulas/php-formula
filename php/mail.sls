{% from "php/map.jinja" import php with context %}

php-mail:
  pkg.installed:
    - name : {{ php.mail_pkg }}
