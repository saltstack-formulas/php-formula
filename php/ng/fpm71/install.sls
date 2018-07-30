# Installs Centos SCL Realeas repo for the php-fpm71 pools config files

repo_centos_scl_scl:
  pkgrepo.managed:
    - humanname: CentOS-$releasever - SCLo sclo
    - baseurl: http://mirror.centos.org/centos/7/sclo/$basearch/sclo/
    - gpgcheck: 0
    - enabled: 1

repo_centos_scl_rh:
  pkgrepo.managed:
    - humanname: CentOS-$releasever - SCLo sclo
    - baseurl: http://mirror.centos.org/centos/7/sclo/$basearch/rh/
    - gpgcheck: 0
    - enabled: 1

php_install_fpm71:
  pkg.installed:
    - pkgs:
      - rh-php71-php-fpm
      - rh-php71-php-pgsql

php_remove_old_php_version:
  pkg.removed:
    - pkgs:
      - php
      - php-common
