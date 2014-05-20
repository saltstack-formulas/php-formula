# Manages the php-fpm pools config files
{% from 'php/ng/map.jinja' import php, sls_block with context %}

# Simple path concatenation.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}

{% set pool_states = [] %}

{% for pool, config in php.fpm.pools.managed.items() %}
{% set state = 'php_fpm_pool_conf_' ~ loop.index0 %}
{% set fpath = path_join(pool, php.lookup.fpm.pools) %}

{{ state }}:
{% if config.enabled %}
  file.managed:
    {{ sls_block(php.fpm.pools.managed_opts) }}
    - name: {{ fpath }}
    - source: salt://php/ng/files/php.ini
    - template: jinja
    - context:
      config: {{ config.settings }}
{% else %}
  file.absent:
    - name: {{ fpath }}
{% endif %}

{% do pool_states.append(state) %}
{% endfor %}



