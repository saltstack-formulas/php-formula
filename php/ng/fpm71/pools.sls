# Manages the php-fpm71 pools config files
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/macro.jinja" import sls_block %}
{% from "php/ng/fpm/pools_config.sls" import pool_states with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
        - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - php.ng.fpm71.service
  - php.ng.fpm71.pools_config

extend:
  php_fpm71_service:
    service:
      - watch:
        {{ file_requisites(pool_states) }}
      - require:
        {{ file_requisites(pool_states) }}
