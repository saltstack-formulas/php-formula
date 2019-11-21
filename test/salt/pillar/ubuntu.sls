# -*- coding: utf-8 -*-
# vim: ft=yaml
---
php:
  use_external_repo: true
  repo:
    humanname: php-sury ppa
    # yamllint disable-line rule:line-length
    name: "deb http://ppa.launchpad.net/ondrej/php/ubuntu {{ salt['grains.get']('oscodename') }} main"
    file: /etc/apt/sources.list.d/php-sury.list
    # yamllint disable-line rule:line-length
    key_url: https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x14aa40ec0831756756d7f66c4f4ea0aae5267a6c
