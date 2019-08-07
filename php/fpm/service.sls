# Manages the php-fpm service.
{% from "php/map.jinja" import php with context %}
{% from "php/macro.jinja" import sls_block %}

{% set service_function = {True:'running', False:'dead'}.get(php.fpm.service.enabled) %}

include:
  - php.fpm.install

php_fpm_service:
  service.{{ service_function }}:
    {{ sls_block(php.fpm.service.opts) }}
    - name: {{ php.lookup.fpm.service }}
    - enable: {{ php.fpm.service.enabled }}
    - require:
      - sls: php.fpm.install
    - watch:
      - pkg: php_install_fpm
