# php.ng.ini.sls
#
# Generic php.ini management state.
{% from "php/ng/map.jinja" import php, sls_block with context %}

php_ini:
  file.managed:
    {{ sls_block(php.ini.file_opts) }}
    - source: salt://php/ng/files/php.ini
    - template: jinja
    - context:
      config: {{ php.ini.settings }}
