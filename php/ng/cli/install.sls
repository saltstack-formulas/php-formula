{% set state = 'cli' %}
{% include "php/ng/installed.jinja" %}

include:
  - php.ng.deprecated

{%- if salt['grains.get']('os_family') == "Debian" %}
{% set current_php = salt['alternatives.show_current']('php') %}
{% set pillar_php_ng_version = salt['pillar.get']('php:ng:version', '7.0') %}
{% if pillar_php_ng_version is iterable and pillar_php_ng_version is not string %}
  {% if 'alternatives_version' in salt['pillar.get']('php:ng') %}
    {% set phpng_version = salt['pillar.get']('php:ng:alternatives_version') %}
  {% else %}
    {% set phpng_version = false %}
  {% endif %}
{% else %}
{% set phpng_version = salt['pillar.get']('php:ng:version', '7.0')|string %}
{% endif %}

{% if phpng_version %}
php_{{ phpng_version }}_link:
  alternatives.set:
    - name: php
    - path: /usr/bin/php{{ phpng_version }}
    - require_in:
      - pkg: php_install_{{ state }}
    - onlyif:
      - which php
      - test {{ current_php }} != $(which php{{ phpng_version }})
{% endif %}
{% endif %}
