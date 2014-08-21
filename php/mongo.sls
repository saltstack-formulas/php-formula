{% from "php/map.jinja"  import php with context %}

{% set version = salt['pillar.get']('php:mongo_version', none) %}

include:
  - php
  - php.dev
  - php.pear

php-mongo:
  pecl.installed:
    - name: {{ php.mongo_pecl }}
    - require:
      - pkg: {{ php.pear_pkg }}
    - defaults: True
{% if version is not none %}
    - version: {{ version }}
{% endif %}

php-mongo-conf:
  file.managed:
    - name: {{ php.ext_conf_path }}/mongo.ini
    - contents: |
        extension={{ php.mongo_ext }}
    - require:
      - pkg: {{ php.php_pkg }}

php-mongo-enable:
  cmd.run:
    - name: php5enmod mongo
    - require:
      - file: php-mongo-conf
