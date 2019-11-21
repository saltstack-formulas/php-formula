# Manages the php-fpm service.
{% from "php/map.jinja" import php with context %}
{% from "php/macro.jinja" import sls_block %}

{% set service_function = {True:'running', False:'dead'}.get(php.fpm.service.enabled) %}
{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}

include:
  - php.fpm.install

{% if pillar_php_version is iterable and pillar_php_version is not string %}
  {% for version in pillar_php_version %}

php_fpm_service_{{ version }}:
  service.{{ service_function }}:
    {{ sls_block(php.fpm.service.opts) }}
    - name: {{ 'php' ~ version ~ '-fpm' }}
    - enable: {{ php.fpm.service.enabled }}
    - require:
      - sls: php.fpm.install
    - watch:
      - pkg: php_install_fpm

  {% endfor %}

{% else %}

php_fpm_service:
  service.{{ service_function }}:
    {{ sls_block(php.fpm.service.opts) }}
    - name: {{ php.lookup.fpm.service }}
    - enable: {{ php.fpm.service.enabled }}
    - require:
      - sls: php.fpm.install
    - watch:
      - pkg: php_install_fpm

{% endif %}
