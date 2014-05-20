# Manages the php-fpm service.
{% from 'php/ng/map.jinja' import php, sls_block with context %}
{% set service_function = {True:'running', False:'dead'}.get(php.fpm.service.enabled) %}

include:
  - php.ng.fpm.install

php_fpm_service:
  service.{{ service_function }}:
    {{ sls_block(php.fpm.service.opts) }}
    - name: {{ php.lookup.fpm.service }}
    - enable: {{ php.fpm.service.enabled }}
    - require:
      - sls: php.ng.fpm.install
    - watch:
      - pkg: php_install_fpm

