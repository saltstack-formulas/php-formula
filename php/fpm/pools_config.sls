{#- Manages the php-fpm pools config files #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/macro.jinja" import sls_block, serialize %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{#- Simple path concatenation. #}
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

{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
{% if pillar_php_version is iterable and pillar_php_version is not string %}
  {% set first_fpath = path_join(config.get('filename', pool), php.lookup.fpm.pools) %}
  {% set first_version = pillar_php_version[0]|string %}
  {% set fpath = first_fpath.replace(first_version, config.get('phpversion', '7.0')) %}
{% else %}
  {% set fpath = path_join(config.get('filename', pool), php.lookup.fpm.pools) %}
{% endif %}

{{ state }}:
{% if config.enabled %}
  file.managed:
    {{ sls_block(config.get('opts', {})) }}
    - name: {{ fpath }}
    - source: {{ files_switch(['php.ini'],
                              'php_fpm_pool_conf'
              ) }}
    - template: jinja
    - context:
        config: {{ serialize(config.get('settings', {})) }}
{% else %}
  file.absent:
    - name: {{ fpath }}
{% endif %}

{% do pool_states.append(state) %}
{% endfor %}
