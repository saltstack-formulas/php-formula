# Manages the php-fpm pools config files
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/macro.jinja" import sls_block %}
{% from "php/ng/multifpm/pools_config.sls" import pool_states with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
        - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - php.ng.multifpm.pools_config
