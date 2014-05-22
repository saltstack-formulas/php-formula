# php.ng.ini.sls
#
# Generic php.ini management state.
{% from "php/ng/map.jinja" import php with context %}
{% from "php/ng/macro.jinja" import sls_block, serialize %}

php_ini:
  file.managed:
    {{ sls_block(php.ini.file_opts) }}
    - source: salt://php/ng/files/php.ini
    - template: jinja
    - context:
      config: {{ serialize(php.ini.settings) }}
