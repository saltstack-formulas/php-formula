# Manages the php-fpm pools config files
{% from "php/map.jinja" import php with context %}
{% from "php/macro.jinja" import sls_block %}
{% from "php/fpm/pools_config.sls" import pool_states with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
        - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - php.fpm.service
  - php.fpm.pools_config

{% if pool_states %}
extend:
  php_fpm_service:
    service:
      - watch:
{{ file_requisites(pool_states) }}
      - require:
{{ file_requisites(pool_states) }}
{% endif %}
