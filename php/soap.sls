{% from "php/map.jinja" import php with context %}

php-soap:
  pkg.installed:
    - name : {{ php.soap_pkg }}
