{#- Manages the php cli main ini file #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/ini.jinja" import php_ini %}

{%- set settings = php.ini.defaults %}
{%- for key, value in php.cli.ini.settings.items() %}
  {%- if settings[key] is defined %}
    {%- do settings[key].update(value) %}
  {%- else %}
    {%- do settings.update({key: value}) %}
  {%- endif %}
{%- endfor %}

{%- set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
{%- if pillar_php_version is iterable and pillar_php_version is not string %}
  {%- for version in pillar_php_version %}
    {%- set first_version = pillar_php_version[0]|string %}
    {%- set ini = php.lookup.cli.ini|replace(first_version, version) %}

    {%- if version in php.cli.ini %}
      {%- set settings_versioned = {} %}
      {%- for key, value in settings.items() %}
        {%- do settings_versioned.update({key: value.copy()}) %}
      {%- endfor %}
      {%- for key, value in php.cli.ini[version].items() %}
        {%- if settings_versioned[key] is defined %}
          {%- do settings_versioned[key].update(value) %}
        {%- else %}
          {%- do settings_versioned.update({key: value}) %}
        {%- endif %}
      {%- endfor %}
    {%- endif %}

php_cli_ini_{{ version }}:
  {{ php_ini(ini,
             'php_cli_ini_' ~ version,
             php.cli.ini.opts,
             settings_versioned | default(settings)
  ) }}
  {%- endfor %}
{%- else %}

php_cli_ini:
  {{ php_ini(php.lookup.cli.ini,
             'php_cli_ini',
             php.cli.ini.opts,
             settings
  ) }}
{%- endif %}
