# Manages the php-hhvm main ini file
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/ini.jinja" import php_ini %}

{%- set server_settings = php.lookup.hhvm.server %}
{%- do server_settings.update(php.hhvm.config.server.settings) %}

{%- set php_settings = php.lookup.hhvm.php %}
{%- do php_settings.update(php.hhvm.config.php.settings) %}

php_hhvm_ini_config:
  {{ php_ini(php.lookup.hhvm.conf,
             'php_hhvm_ini_config',
             php.hhvm.config.server.opts,
             server_settings
  ) }}

php_hhvm_conf_config:
  {{ php_ini(php.lookup.hhvm.ini,
             'php_hhvm_conf_config',
             php.hhvm.config.php.opts,
             php_settings
  ) }}
