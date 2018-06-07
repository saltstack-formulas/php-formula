# Manages the php-fpm pools config files
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/macro.jinja" import sls_block %}
{% from "php/ng/fpm/pools_config.sls" import pool_states with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
        - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - php.ng.fpm.service
  - php.ng.fpm.pools_config

{% if pool_states %}
extend:
  php_fpm_service:
    service:
      - watch:
{{ file_requisites(pool_states) }}
      - require:
{{ file_requisites(pool_states) }}
{% endif %}
