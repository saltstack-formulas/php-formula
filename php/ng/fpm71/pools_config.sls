# Manages the php-fpm71 pools config files
{% from 'php/ng/map.jinja' import php with context %}
{% from "php/ng/macro.jinja" import sls_block, serialize %}

# Simple path concatenation.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}

{% set pool_states = [] %}

{% for pool, config in php.fpm.pools.items() %}
{% if pool == 'defaults' %}{% continue %}{% endif %}
{% for pkey, pvalues in config.get('settings', {}).items() %}
{% set pool_defaults = php.fpm.pools.get('defaults', {}).copy() %}
  {% do pool_defaults.update(pvalues) %}
  {% do pvalues.update(pool_defaults) %}
{% endfor %}
{% set state = 'php_fpm_pool_conf_' ~ loop.index0 %}
{% set fpath = path_join(config.get('filename', pool), php.lookup.fpm.pools) %}

{{ state }}:
{% if config.enabled %}
  file.managed:
    {{ sls_block(config.get('opts', {})) }}
    - name: {{ fpath }}
    - source: salt://php/ng/files/php.ini
    - template: jinja
    - context:
        config: {{ serialize(config.get('settings', {})) }}
{% else %}
  file.absent:
    - name: {{ fpath }}
{% endif %}

{% do pool_states.append(state) %}
{% endfor %}
