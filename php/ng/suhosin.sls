{% from "php/ng/map.jinja" import php with context %}

include:
  - php.ng.deprecated
  - php.ng
  - php.ng.dev

{% set phpng_version = salt['pillar.get']('php:ng:version', '7.0')|string %}

{% if salt['grains.get']('os') == "Ubuntu" %}
  {% if phpng_version >= '7.0' %}
    {% set suhosin_ext = php.lookup.pkgs.suhosin7_ext %}
    {% set suhosin_name = 'suhosin7' %}
    {% set suhosin_repo = php.lookup.pkgs.suhosin7_repo %}
    {% set tmppath = '/tmp/suhosin7' %}
  {% else %}
    {% set suhosin_ext = php.lookup.pkgs.suhosin5_ext %}
    {% set suhosin_name = 'suhosin' %}
    {% set suhosin_repo = php.lookup.pkgs.suhosin5_repo %}
    {% set tmppath = '/tmp/suhosin5' %}
  {% endif %}
{% elif salt['grains.get']('os_family') == "RedHat" %}
  {% if grains['osmajorrelease'] == "7" %}
    {% set suhosin_ext = php.lookup.pkgs.suhosin5_ext %}
    {% set suhosin_name = 'suhosin' %}
    {% set suhosin_repo = php.lookup.pkgs.suhosin5_repo %}
    {% set tmppath = '/tmp/suhosin5' %}
  {% else %}
    {# RHEL version 6 contains PHP 5.3, which is not supported by Suhosin #}
  {% endif %}
{% else %}
    {% set suhosin_ext = php.lookup.pkgs.suhosin5_ext %}
    {% set suhosin_name = 'suhosin' %}
    {% set suhosin_repo = php.lookup.pkgs.suhosin5_repo %}
    {% set tmppath = '/tmp/suhosin5' %}
{% endif %}

build-pkgs:
  pkg.installed:
    - pkgs: {{ php.lookup.pkgs.build_pkgs }}

git:
  pkg.installed: []

suhosin-source:
  git.latest:
    - name: {{ suhosin_repo }}
    - target: {{ tmppath }}
    - unless:
      - test -d {{ tmppath }}
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
    - unless:
      - test -e {{ php.lookup.pkgs.ext_conf_path }}/{{ suhosin_name }}.ini
    - require:
      - pkg: build-pkgs
      - git: suhosin-source

php-suhosin-conf:
  file.managed:
    - name: {{ php.lookup.pkgs.ext_conf_path }}/{{ suhosin_name }}.ini
    - contents: |
        extension={{ suhosin_ext }}
        suhosin.executor.include.whitelist=phar
    - require:
      - pkg: php
      - cmd: install-suhosin
    - unless:
      - test -e {{ php.lookup.pkgs.ext_conf_path }}/{{ suhosin_name }}.ini

{% if salt['grains.get']('os_family') == "Debian" %}

php-suhosin-enable:
  cmd.run:
    - name: {{ php.lookup.pkgs.phpenmod_command }} {{ suhosin_name }}
    - require:
      - file: php-suhosin-conf

{% endif %}
