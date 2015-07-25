# Manages the php-hhvm main ini file
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/ini.jinja" import php_ini %}

{% set ini_settings = php.ini.defaults %}
{% do ini_settings.update(php.hhvm.config.ini.settings) %}

{% set conf_settings = php.lookup.hhvm.defaults %}
{% do conf_settings.update(php.hhvm.config.conf.settings) %}

php_hhvm_ini_config:
  {{ php_ini(php.lookup.hhvm.ini, php.hhvm.config.ini.opts, ini_settings) }}

php_hhvm_conf_config:
  {{ php_ini(php.lookup.hhvm.conf, php.hhvm.config.conf.opts, conf_settings) }}

