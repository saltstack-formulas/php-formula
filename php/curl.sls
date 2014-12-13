{% from "php/map.jinja" import php with context %}

php-curl:
  pkg.installed:
    - name: {{ php.curl_pkg }}
