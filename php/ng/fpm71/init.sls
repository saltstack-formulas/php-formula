# Meta-state to fully install php.fpm71

include:
  - php.ng.fpm71.config
  - php.ng.fpm71.service
  - php.ng.fpm71.pools

extend:
  php_fpm71_service:
    service:
      - watch:
        - file: php_fpm71_ini_config
        - file: php_fpm71_conf_config
      - require:
        - sls: php.ng.fpm71.config
  php_fpm71_ini_config:
    file:
      - require:
        - pkg: php_install_fpm71
  php_fpm71_conf_config:
    file:
      - require:
        - pkg: php_install_fpm71
