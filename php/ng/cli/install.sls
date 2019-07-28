{% set state = 'cli' %}
{% include "php/ng/installed.jinja" %}

include:
  - php.ng.deprecated

{%- if salt['grains.get']('os_family') == "Debian" %}
{% set current_php = salt['alternatives.show_current']('php') %}
{% set phpng_version = salt['pillar.get']('php:ng:version', '7.0')|string %}

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
