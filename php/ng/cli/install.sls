{% set state = 'cli' %}
{% include "php/ng/installed.jinja" %}


php_{{ phpng_version }}_link:
  alternatives.set:
    - name: php
    - path: /usr/bin/php{{ phpng_version }}
    - require_in:
      - pkg: php_install_{{ state }}
    - onlyif:
      - which php
      - test {{ current_php }} != $(which php{{ phpng_version }})
