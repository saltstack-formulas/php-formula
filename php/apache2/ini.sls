{#- Manages the main Apache2 ini file #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/ini.jinja" import php_ini %}

{%- set settings = php.ini.defaults %}
{%- do settings.update(php.apache2.ini.settings) %}

php_apache2_ini:
  {{ php_ini(php.lookup.apache2.ini,
             'php_apache2_ini',
             php.apache2.ini.opts,
             settings
  ) }}
