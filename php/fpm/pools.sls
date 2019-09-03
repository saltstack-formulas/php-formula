# Manages the php-fpm pools config files
{% from "php/map.jinja" import php with context %}
{% from "php/macro.jinja" import sls_block %}
{% from "php/macro.jinja" import file_requisites %}
{% from "php/fpm/pools_config.sls" import pool_states with context %}

include:
  - php.fpm.service
  - php.fpm.pools_config

{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}

{% if pool_states %}
extend:

{% if pillar_php_version is iterable and pillar_php_version is not string %}
  {% for version in pillar_php_version %}
  php_fpm_service_{{ version }}:
    service:
      - watch:
{{ file_requisites(pool_states) }}
      - require:
{{ file_requisites(pool_states) }}

  {% endfor %}

{% else %}

  php_fpm_service:
    service:
      - watch:
{{ file_requisites(pool_states) }}
      - require:
{{ file_requisites(pool_states) }}

{% endif %}

{% endif %}
