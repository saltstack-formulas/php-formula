# Manages the php-fpm main ini file
{% from 'php/ng/map.jinja' import php with context %}
{% from "php/ng/ini.jinja" import php_ini %}

# Simple path concatenation.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}

{% set ini_settings = php.ini.defaults %}
{% for key, value in php.fpm.config.ini.settings.iteritems() %}
  {% if ini_settings[key] is defined %}
    {% do ini_settings[key].update(value) %}
  {% else %}
    {% do ini_settings.update({key: value}) %}
  {% endif %}
{% endfor %}

php_fpm_ini_config:
  {{ php_ini(php.lookup.multi_fpm.defaults.ini, php.fpm.config.ini.opts, ini_settings) }}

{{ php.lookup.multi_fpm.defaults.pools }}:
    file.directory:
        - name: {{ php.lookup.multi_fpm.defaults.pools }}
        - user: root
        - group: root
        - file_mode: 755
        - make_dirs: True

{% for pool, config in php.lookup.multi_fpm.iteritems() %}
{% if pool == 'defaults' %}{% continue %}{% endif %}

{% set conf_settings = php.lookup.fpm.get('defaults', {}).copy() %}
{% do conf_settings.global.update(php.lookup.multi_fpm.defaults.settings.global) %}
{% do conf_settings.global.update(config.settings.global) %}
{% do config.settings.global.update(conf_settings.global) %}
{% do conf_settings.update(config.settings) %}

{% set state = 'php_fpm_conf_' ~ loop.index0 %}
{% set fpath = path_join(config.get('filename', pool), php.lookup.multi_fpm.defaults.conf) %}


{{ state }}:
{% if config.enabled %}
  {{ php_ini(fpath, config.opts, conf_settings) }}
{% else %}
  file.absent:
    - name: {{ fpath }}
{% endif %}
{% endfor %}

{% set fpm_conf = php.lookup.multi_fpm.defaults.conf ~ '/php-fpm.conf' %}

{% set conf_settings = php.lookup.fpm.defaults %}
{% do conf_settings.update(php.lookup.multi_fpm.defaults.settings) %}

php_fpm_conf_config:
  {{ php_ini(php.lookup.fpm.conf, php.fpm.config.conf.opts, conf_settings) }}

# php_fpm_conf_config:
#   file.absent:
#     - name: {{ fpm_conf }}
