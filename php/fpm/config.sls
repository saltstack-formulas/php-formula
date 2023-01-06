{#- Manages the php-fpm main ini file #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/ini.jinja" import php_ini %}

{%- set ini_settings = php.ini.defaults %}
{%- for key, value in php.fpm.config.ini.settings.items() %}
  {%- if ini_settings[key] is defined %}
    {%- do ini_settings[key].update(value) %}
  {%- else %}
    {%- do ini_settings.update({key: value}) %}
  {%- endif %}
{%- endfor %}

{%- set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
{%- if pillar_php_version is iterable and pillar_php_version is not string %}
  {%- for version in pillar_php_version %}
    {%- set conf_settings = odict(php.lookup.fpm.defaults) %}
    {%- set first_version = pillar_php_version[0]|string %}
    {%- set ini = php.lookup.fpm.ini|replace(first_version, version) %}
    {%- set conf = php.lookup.fpm.conf|replace(first_version, version) %}
    {%- set pools = php.lookup.fpm.pools|replace(first_version, version) %}

    {%- if version in php.fpm.config.ini %}
      {%- set ini_settings_versioned = {} %}
      {%- for key, value in ini_settings.items() %}
        {%- do ini_settings_versioned.update({key: value.copy()}) %}
      {%- endfor %}
      {%- for key, value in php.fpm.config.ini[version].items() %}
        {%- if ini_settings_versioned[key] is defined %}
          {%- do ini_settings_versioned[key].update(value) %}
        {%- else %}
          {%- do ini_settings_versioned.update({key: value}) %}
        {%- endif %}
      {%- endfor %}
    {%- endif %}

    {%- for key, value in conf_settings.items() %}
      {%- if value is string %}
        {%- do conf_settings.update({key: value.replace(first_version, version)}) %}
      {%- endif %}
    {%- endfor %}
    {%- do conf_settings.global.update({'pid': '/run/php/php' + version + '-fpm.pid' }) %}
    {%- do conf_settings.global.update({'error_log': '/var/log/php' + version + '-fpm.log' }) %}

php_fpm_ini_config_{{ version }}:
  {{ php_ini(ini,
             'php_fpm_ini_config_' ~ version,
             php.fpm.config.ini.opts,
             ini_settings_versioned | default(ini_settings)
  ) }}

php_fpm_conf_config_{{ version }}:
  {{ php_ini(conf,
             'php_fpm_conf_config_' ~ version,
             php.fpm.config.conf.opts,
             odict(conf_settings)
  ) }}

{{ pools }}:
    file.directory:
        - name: {{ pools }}
        - user: {{ php.lookup.fpm.user }}
        - group: {{ php.lookup.fpm.group }}
        - file_mode: 755
        - make_dirs: True
  {%- endfor %}
{%- else %}

{%- set conf_settings = php.lookup.fpm.defaults %}
{%- do conf_settings.update(php.fpm.config.conf.settings) %}

php_fpm_ini_config:
  {{ php_ini(php.lookup.fpm.ini,
             'php_fpm_ini_config',
             php.fpm.config.ini.opts,
             ini_settings
  ) }}

php_fpm_conf_config:
  {{ php_ini(php.lookup.fpm.conf,
             'php_fpm_conf_config',
             php.fpm.config.conf.opts,
             conf_settings
  ) }}

{{ php.lookup.fpm.pools }}:
    file.directory:
        - name: {{ php.lookup.fpm.pools }}
        - user: {{ php.lookup.fpm.user }}
        - group: {{ php.lookup.fpm.group }}
        - file_mode: 755
        - make_dirs: True
{%- endif %}
