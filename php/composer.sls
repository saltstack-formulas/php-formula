{% from "php/map.jinja" import php with context %}

{% set install_file = php.lookup.pkgs.local_bin + '/' + php.lookup.pkgs.composer_bin %}

{% if not salt['config.get']('sudo_user') %}
  {% set salt_user = salt['config.get']('user', 'root') %}
{% else %}
  {% set salt_user = salt['config.get']('sudo_user', 'root') %}
{% endif %}

{% set salt_user_home = salt['user.info'](salt_user).get('home', '/root') %}

include:
  - php
{%- for module in php.lookup.get('composer', {}).get('required_modules', []) %}
  - php.{{ module }}
{%- endfor %}

get-composer:
  file.managed:
    - name: {{ php.lookup.pkgs.temp_dir }}/installer
    - mode: '0755'
    - unless: test -f {{ install_file }}
    - source: https://getcomposer.org/installer
    - source_hash: https://composer.github.io/installer.sig
    - require:
      - pkg: php

install-composer:
  cmd.run:
    - name: php {{ php.lookup.pkgs.temp_dir }}/installer --filename={{ php.lookup.pkgs.composer_bin }} --install-dir={{ php.lookup.pkgs.local_bin }}
    - unless: test -f {{ install_file }}
    - env:
      - HOME: {{ salt_user_home }}
    - require:
      - file: get-composer

# Get composer version date and check if older than 60day (defaultvalue of COMPOSER_DEV_WARNING_TIME)
# then it's time to run `composer selfupdate`
#
# It would be nice if composer had a command line switch to get this, but it doesn't,
# and so we just grep for it.
#
update-composer:
  cmd.run:
    - name: "{{ install_file }} selfupdate"
{% if grains['os_family'] == 'FreeBSD' %}
    - unless: test $(date -v+60d -j -f "%Y-%m-%d %H:%M:%S" "$({{ install_file }} --version | cut -d ' ' -f 4,5)" "+%s") -gt $(date "+%s")
{% else %}
    - unless: test $(date -d "60 days $({{ install_file }} --version | cut -d ' ' -f 4,5)" "+%s") -gt $(date "+%s")
{% endif %}
    - cwd: {{ php.lookup.pkgs.local_bin }}
    - env:
      - HOME: {{ salt_user_home }}
    - require:
      - cmd: install-composer
