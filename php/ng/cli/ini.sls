# Manages the php cli main ini file
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/ini.jinja" import php_ini %}

{% set settings = php.ini.defaults %}
{% for key, value in php.cli.ini.settings.iteritems() %}
  {% if settings[key] is defined %}
    {% do settings[key].update(value) %}
  {% else %}
    {% do settings.update({key: value}) %}
  {% endif %}
{% endfor %}

php_cli_ini:
  {{ php_ini(php.lookup.cli.ini, php.cli.ini.opts, settings) }}
