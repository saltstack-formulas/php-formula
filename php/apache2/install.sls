{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- set state = 'apache2' %}
{%- include tplroot ~ "/installed.jinja" %}

{%- if grains['os_family'] == "FreeBSD" %}
{{ php.lookup.apache2.module_config }}:
  file.managed:
    - source: {{ files_switch(['mod_php.conf.jinja'],
                               lookup='php_apache2_module_config',
                               use_subpath=True
              ) }}
    - template: jinja
{%- if salt['pillar.get']('php:use_apache_formula', True) %}
    - makedirs: true
    - require_in:
      - sls: apache
    - watch_in:
      - module: apache-service-running-restart
{%- endif %} #END: use apache formula
{%- endif %} #END: os = debian
