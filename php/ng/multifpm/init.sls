# Meta-state to fully install php.fpm

include:
  - php.ng.multifpm.config
  - php.ng.multifpm.pools
  - php.ng.multifpm.service

extend:
  php_fpm_ini_config:
    file:
      - require:
        - pkg: php_install_fpm
  php_fpm_conf_config:
    file:
      - require:
        - pkg: php_install_fpm
