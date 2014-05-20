# php.ng.fpm
#
# Meta-state to fully install php.

include:
  - php.ng.fpm.config
  - php.ng.fpm.service
  - php.ng.fpm.pools

extend:
  php_fpm_service:
    service:
      - watch:
        - file: php_fpm_ini_config
        - file: php_fpm_conf_config
