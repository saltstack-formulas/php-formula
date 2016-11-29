{% from "php/map.jinja"  import php with context %}

{% set version = salt['pillar.get']('php:mongo_version', none) %}

include:
  - php
  - php.xml
  - php.dev
  - php.pear

php-mongo:
  pecl.installed:
    - name: {{ php.mongo_pecl }}
    - defaults: True
{% if version is not none %}
    - version: {{ version }}
{% endif %}
    - require:
      - pkg: {{ php.pear_pkg }}
      - pkg: openssl_dev

openssl_dev:
  pkg.installed:
    - pkgs: {{ php.openssl_dev }}

php-mongo-conf:
  file.managed:
    - name: {{ php.ext_conf_path }}/mongo.ini
    - contents: |
        extension={{ php.mongo_ext }}
    - require:
      - pkg: {{ php.php_pkg }}

{% if salt['grains.get']('os_family') == "Debian" %}

php-mongo-enable:
  cmd.run:
    - name: {{ php.phpenmod_command }} mongo
    - require:
      - file: php-mongo-conf

{% endif %}