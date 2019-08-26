{% from "php/map.jinja" import php with context %}

{% set state = 'apache2' %}
{% include "php/installed.jinja" %}

{% if grains['os_family'] == "FreeBSD" %}
{{ php.lookup.apache2.module_config }}:
  file.managed:
    - source: salt://php/apache2/files/mod_php.conf.jinja
    - template: jinja
{% if salt['pillar.get']('php:use_apache_formula', True) %}
    - makedirs: true
    - require_in:
      - sls: apache
    - watch_in:
      - module: apache-restart
{% endif %} #END: use apache formula
{% endif %} #END: os = debian
