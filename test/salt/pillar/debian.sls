# -*- coding: utf-8 -*-
# vim: ft=yaml
---
php:
{% if salt['grains.get']('os') == 'Ubuntu' %}
  use_external_repo: true
  repo:
    humanname: php-sury ppa
    name: "deb http://ppa.launchpad.net/ondrej/php/ubuntu {{ salt['grains.get']('oscodename') }} main"
    file: /etc/apt/sources.list.d/php-sury.list
    key_url: https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x14aa40ec0831756756d7f66c4f4ea0aae5267a6c
{% else %}
  repo:
    humanname: php-sury repo
    name: "deb https://packages.sury.org/php/ {{ salt['grains.get']('oscodename') }} main"
    file: /etc/apt/sources.list.d/php-sury.list
    key_url: https://packages.sury.org/php/apt.gpg
{% endif %}

  version:
    - '5.6'
    - '7.3'

  fpm:
    config:
      ini:
        settings:
          Assertion:
            zend.assertions: -1
          PHP:
            expose_php: 'Off'
            default_charset: UTF-8
            cgi.fix_pathinfo: 0
          Date:
            date.timezone: Europe/Paris

    pools:
      'radius-admin.conf':
        enabled: true
        phpversion: '5.6'
        settings:
          radius-admin:
            user: www-data
            group: www-data
            listen: /tmp/php-fpm-radius-admin.sock
            listen.mode: '0666'
            pm: static
            pm.max_children: 3
            pm.max_requests: 500
            pm.status_path: /php-status
            ping.path: /php-ping
            catch_workers_output: 'yes'
            security.limit_extensions: .php
            'php_admin_value[date.timezone]': Europe/Paris

      'ldap-admin.conf':
        enabled: true
        phpversion: '7.3'
        settings:
          ldap-admin:
            user: www-data
            group: www-data
            listen: /tmp/php-fpm-ldap-admin2.sock
            listen.mode: '0666'
            pm: static
            pm.max_children: 3
            pm.max_requests: 500
            pm.status_path: /php-status
            ping.path: /php-ping
            catch_workers_output: 'yes'
            security.limit_extensions: .php
            'php_admin_value[date.timezone]': Europe/Paris

  cli:
    ini:
      settings:
        Assertion:
          zend.assertions: -1
        PHP:
          default_charset: UTF-8
        Date:
          date.timezone: Europe/Paris

  modules:
    - bz2
    - cli
    - curl
    - gd
    - imagick
    - imap
    - intl
    - mbstring
    - mysql
    - readline
    - redis
    - xml
    - zip
