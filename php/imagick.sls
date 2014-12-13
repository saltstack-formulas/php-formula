{% from "php/map.jinja" import php with context %}

php-imagick:
  pkg.installed:
    - name: {{ php.imagick_pkg }}
