# Manages the php-hhvm service.
{% from "php/map.jinja" import php with context %}
{% from "php/macro.jinja" import sls_block %}

{% set service_function = {True:'running', False:'dead'}.get(php.hhvm.service.enabled) %}

include:
  - php.hhvm.install

php_hhvm_service:
  service.{{ service_function }}:
  {{ sls_block(php.hhvm.service.opts) }}
  - name: {{ php.lookup.hhvm.service }}
  - enable: {{ php.hhvm.service.enabled }}
  - require:
    - sls: php.hhvm.install
  - watch:
    - pkg: php_install_hhvm

