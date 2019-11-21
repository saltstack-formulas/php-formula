{% set state = 'cli' %}
{% include "php/installed.jinja" %}

{%- if salt['grains.get']('os_family') == "Debian" %}
{% set current_php = salt['alternatives.show_current']('php') %}
{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
{% if pillar_php_version is iterable and pillar_php_version is not string %}
  {% if 'alternatives_version' in salt['pillar.get']('php') %}
    {% set php_version = salt['pillar.get']('php:alternatives_version') %}
  {% else %}
    {% set php_version = false %}
  {% endif %}
{% else %}
{% set php_version = salt['pillar.get']('php:version', '7.0')|string %}
{% endif %}

{% if php_version %}
php_{{ php_version }}_link:
  alternatives.set:
    - name: php
    - path: /usr/bin/php{{ php_version }}
    - require_in:
      - pkg: php_install_{{ state }}
    - onlyif:
      - which php
      - test {{ current_php }} != $(which php{{ php_version }})
{% endif %}
{% endif %}
