# Manages the php-fpm service.
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/macro.jinja" import sls_block %}

include:
  - php.ng.multifpm.install
  - php.ng.multifpm.upstart

{% for pool, config in php.lookup.multi_fpm.iteritems() %}
{% if pool == 'defaults' %}{% continue %}{% endif %}


{% set service_function = {True:'running', False:'dead'}.get(config.enabled) %}
{% set state = 'php_fpm_service_' ~ loop.index0 %}

{{ state }}:
  service.{{ service_function }}:
    {{ sls_block(php.fpm.service.opts) }}
    - name: {{ config.service }}
    - enable: {{ config.enabled }}
    - require:
      - sls: php.ng.multifpm.install
      - sls: php.ng.multifpm.upstart
    - watch:
      - pkg: php_install_fpm

{% endfor %}