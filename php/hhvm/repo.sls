# Manages the php-hhvm service.
{% from "php/map.jinja" import php with context %}

include:
  - php.hhvm.install


{% if salt['grains.get']('os_family') == 'Debian' -%}

hhvm_repo:
  pkgrepo.managed:
    - name: deb http://dl.hhvm.com/{{ salt['grains.get']('os')|lower }} {{ salt['grains.get']('oscodename') }} main
    - file: /etc/apt/sources.list.d/hhvm.list
    - keyid: 0x5a16e7281be7a449
    - keyserver: keyserver.ubuntu.com
    - refresh_db: True
    - require_in:
      - pkg: php_install_hhvm
{%- endif %}
