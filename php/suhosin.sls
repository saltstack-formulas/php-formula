{% from "php/map.jinja" import php with context %}

include:
  - php
  - php.dev

build-pkgs:
  pkg.installed:
    - pkgs: {{ php.build_pkgs }}

{% set php_version = salt['pillar.get']('php:version', '7.0')|string %}

{% if php_version >= '7.0' %}
git:
  pkg.installed: []

suhosin7-repo:
  git.latest:
    - name: {{ php.suhosin7_repo }}
    - target: /tmp/suhosin7
    - require:
      - pkg: git

install-suhosin:
  cmd.run:
    - name: |
        phpize
        ./configure
        make
        make install
    - cwd: /tmp/suhosin7
    - shell: /bin/bash
    - runas: root
    - require:
      - pkg: build-pkgs
      - git: suhosin7-repo

php-suhosin-conf:
  file.managed:
    - name: {{ php.ext_conf_path }}/suhosin7.ini
    - contents: |
        extension={{ php.suhosin7_ext }}
    - require:
      - pkg: {{ php.php_pkg }}
      - cmd: install-suhosin

php-suhosin-enable:
  cmd.run:
    - name: {{ php.phpenmod_command }} suhosin7
    - require:
      - file: php-suhosin-conf

{% else %}

suhosin-pkg:
  archive.extracted:
    - name: /tmp/suhosin
    - source: https://download.suhosin.org/suhosin-{{ php.suhosin_version }}.tar.gz
    - source_hash: sha256=c02d76c4e7ce777910a37c18181cb67fd9e90efe0107feab3de3131b5f89bcea
    - archive_format: tar

install-suhosin:
  cmd.run:
    - name: |
        phpize
        ./configure
        make
        make install
    - cwd: /tmp/suhosin/suhosin-{{ php.suhosin_version }}
    - shell: /bin/bash
    - runas: root
    - require:
      - pkg: build-pkgs
      - archive: suhosin-pkg

php-suhosin-conf:
  file.managed:
    - name: {{ php.ext_conf_path }}/suhosin.ini
    - contents: |
        extension={{ php.suhosin_ext }}
    - require:
      - pkg: {{ php.php_pkg }}
      - cmd: install-suhosin

php-suhosin-enable:
  cmd.run:
    - name: {{ php.phpenmod_command }} suhosin
    - require:
      - file: php-suhosin-conf

{% endif %}
