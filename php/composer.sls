{% from "php/map.jinja" import php with context %}
{% set install_file = php.local_bin + '/composer' %}

include:
  - php

get-composer:
  cmd.run:
    - name: 'CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php'
    - unless: test -f {{ install_file }}
    - cwd: {{ php.temp_dir }}
    - require:
      - pkg: php

install-composer:
  cmd.wait:
    - name: mv {{ php.temp_dir }}/composer.phar {{ install_file }}
    - cwd: {{ php.temp_dir }}
    - watch:
      - cmd: get-composer

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
    - cwd: {{ php.temp_dir }}
    - require:
      - cmd: install-composer
