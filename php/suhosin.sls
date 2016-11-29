{% from "php/map.jinja" import php with context %}

include:
  - php
  - php.dev

{% set php_version = salt['pillar.get']('php:version', '7.0')|string %}

{% if salt['grains.get']('os') == "Ubuntu" %}
  {% if php_version >= '7.0' %}
    {% set suhosin_ext = php.suhosin7_ext %}
    {% set suhosin_name = 'suhosin7' %}
    {% set suhosin_repo = php.suhosin7_repo %}
    {% set tmppath = '/tmp/suhosin7' %}
  {% else %}
    {% set suhosin_ext = php.suhosin5_ext %}
    {% set suhosin_name = 'suhosin' %}
    {% set suhosin_repo = php.suhosin5_repo %}
    {% set tmppath = '/tmp/suhosin5' %}
  {% endif %}
{% else %}
  {% set suhosin_ext = php.suhosin5_ext %}
  {% set suhosin_name = 'suhosin' %}
  {% set suhosin_repo = php.suhosin5_repo %}
  {% set tmppath = '/tmp/suhosin5' %}
{% endif %}

build-pkgs:
  pkg.installed:
    - pkgs: {{ php.build_pkgs }}

git:
  pkg.installed: []

suhosin-source:
  git.latest:
    - name: {{ suhosin_repo }}
    - target: {{ tmppath }}
    - require:
      - pkg: git

install-suhosin:
  cmd.run:
    - name: |
        phpize
        ./configure
        make
        make install
    - cwd: {{ tmppath }}
    - shell: /bin/bash
    - runas: root
    - require:
      - pkg: build-pkgs
      - git: suhosin-source

php-suhosin-conf:
  file.managed:
    - name: {{ php.ext_conf_path }}/{{ suhosin_name }}.ini
    - contents: |
        extension={{ suhosin_ext }}
    - require:
      - pkg: {{ php.php_pkg }}
      - cmd: install-suhosin
    - unless:
      - test -f {{ php.ext_conf_path }}/{{ suhosin_name }}.ini

{% if salt['grains.get']('os_family') == "Debian" %}

php-suhosin-enable:
  cmd.run:
    - name: {{ php.phpenmod_command }} {{ suhosin_name }}
    - require:
      - file: php-suhosin-conf

{% endif %}