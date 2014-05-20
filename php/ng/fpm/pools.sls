# Manages the php-fpm pools config files
{% from 'php/ng/map.jinja' import php, sls_block with context %}
{% from 'php/ng/fpm/pools_config.sls' import pool_states with context %}
{% from 'php/ng/fpm/service.sls' import service_function with context %}

include:
  - php.ng.fpm.service
  - php.ng.fpm.pools_config

extend:
  php_fpm_service:
    service.{{ service_function }}:
      - watch:
        {%- for pool in pool_states %}
        - file: {{ pool }}
        {% endfor -%}
