# Manages the libapache2-mod-php5 main ini file
{% from 'php/ng/map.jinja' import php with context %}
{% from "php/ng/ini.jinja" import php_ini %}

{% set settings = php.ini.defaults %}
{% do settings.update(php.apache2.ini.settings) %}

php_apache2_ini:
  {{ php_ini(php.lookup.apache2.ini, php.apache2.ini.opts, settings) }}
