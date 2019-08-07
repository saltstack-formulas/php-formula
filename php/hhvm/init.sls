# Meta-state to fully install php.hhvm

include:
  - php.hhvm.repo
  - php.hhvm.config
  - php.hhvm.service

extend:
  php_hhvm_service:
    service:
      - watch:
        - file: php_hhvm_ini_config
        - file: php_hhvm_conf_config
      - require:
        - sls: php.hhvm.config
  php_hhvm_ini_config:
    file:
      - require:
        - pkg: php_install_hhvm
  php_hhvm_conf_config:
    file:
      - require:
        - pkg: php_install_hhvm
