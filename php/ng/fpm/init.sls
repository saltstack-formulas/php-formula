# Meta-state to fully install php.fpm

include:
  - php.ng.fpm.config
  - php.ng.fpm.service
  - php.ng.fpm.pools

extend:
  php_fpm_service:
    service:
      - watch:
    {% if salt['pillar.get']('php:ng:version') is iterable %}
      {% for version in salt['pillar.get']('php:ng:version') %}
        - file: php_fpm_ini_config_{{ version }}
        - file: php_fpm_conf_config_{{ version }}
      {% endfor %}
    {% else %}
        - file: php_fpm_ini_config
        - file: php_fpm_conf_config
    {% endif %}
      - require:
        - sls: php.ng.fpm.config
  {% if salt['pillar.get']('php:ng:version') is iterable %}
    {% for version in salt['pillar.get']('php:ng:version') %}
  php_fpm_ini_config_{{ version }}:
    file:
      - require:
        - pkg: php_install_fpm
  php_fpm_conf_config_{{ version }}:
    file:
      - require:
        - pkg: php_install_fpm
    {% endfor %}
  {% else %}
  php_fpm_ini_config:
    file:
      - require:
        - pkg: php_install_fpm
  php_fpm_conf_config:
    file:
      - require:
        - pkg: php_install_fpm
  {% endif %}
