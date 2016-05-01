{% from "php/map.jinja" import php with context %}
{% set install_file = php.local_bin + '/' + php.composer_bin %}

{% if not salt['config.get']('sudo_user') %}
{% set salt_user = salt['config.get']('user', 'root') %}
{% else %}
{% set salt_user = salt['config.get']('sudo_user', 'root') %}
{% endif %}

{% set salt_user_home = salt['user.info'](salt_user).get('home', '/root') %}

include:
  - php

get-composer:
  file.managed:
    - name: {{ php.temp_dir }}/installer
    - mode: 0755
    - unless: test -f {{ install_file }}
    - source: https://getcomposer.org/installer
    - source_hash: https://composer.github.io/installer.sig
    - require:
      - pkg: php

install-composer:
  cmd.run:
    - name: php {{ php.temp_dir }}/installer --filename={{ php.composer_bin }} --install-dir={{ php.local_bin }}
    - unless: test -f {{ install_file }}
    - env:
      - HOME: {{ salt_user_home }}
    - require:
      - file: get-composer

# Get COMPOSER_DEV_WARNING_TIME from the installed composer, and if that time has passed
# then it's time to run `composer selfupdate`
#
# It would be nice if composer had a command line switch to get this, but it doesn't,
# and so we just grep for it.
#
update-composer:
  cmd.run:
    - name: "{{ install_file }} selfupdate"
    - unless: test $(grep --text COMPOSER_DEV_WARNING_TIME {{ install_file }} | egrep '^\s*define' | sed -e 's,[^[:digit:]],,g') \> $(php -r 'echo time();')
    - cwd: {{ php.local_bin }}
    - env:
      - HOME: {{ salt_user_home }}
    - require:
      - cmd: install-composer
