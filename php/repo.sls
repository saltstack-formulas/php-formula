# php.repo
#
# Manages the installation of an external repository based on Pillar values
{%- from "php/map.jinja" import php with context %}

{%- set os                = salt['grains.get']('os') %}
{%- set os_family         = salt['grains.get']('os_family') %}
{%- set oscodename        = salt['grains.get']('oscodename') %}
{%- set osmajorrelease    = salt['grains.get']('osmajorrelease') %}
{%- set use_external_repo = salt['pillar.get']('php:use_external_repo', False) %}

{%- if use_external_repo %}
  {%- if os_family == 'Debian' %}
php_external_repo:
  pkgrepo:
    - managed
    {%- if os == 'Ubuntu' %}
    {# Use ondrej/php PPA Repo #}
    - ppa: ondrej/php
    - env:
      - LC_ALL: 'C.UTF-8'
    {%- elif os == 'Debian' %}
    {# Use DotDeb Repo #}
    - name: deb http://packages.dotdeb.org {{ oscodename }} all
    - key_url: https://www.dotdeb.org/dotdeb.gpg
    - file: /etc/apt/sources.list.d/dotdeb.list
    {%- endif %}
  {%- elif os_family == 'RedHat' %}
    {# WebTactic PHP repository requires EPEL #}
    {# EPEL states below adapted from 'saltstack-formulas/epel-formula' #}
    {%- if osmajorrelease == '7' %}
      {%- set rhel_map = {
        'epel_key': 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7',
        'epel_key_hash': 'md5=58fa8ae27c89f37b08429f04fd4a88cc',
        'epel_rpm': 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm',
        'webtatic_rpm': 'https://mirror.webtatic.com/yum/el7/webtatic-release.rpm',
      } -%}
    {%- elif osmajorrelease == '6' %}
      {%- set rhel_map = {
        'epel_key': 'https://fedoraproject.org/static/0608B895.txt',
        'epel_key_hash': 'md5=eb8749ea67992fd622176442c986b788',
        'epel_rpm': 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm',
        'webtatic_rpm': 'https://mirror.webtatic.com/yum/el6/latest.rpm',
      } -%}
    {%- endif %}

install_pubkey_epel:
  file.managed:
    - name: /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    - source: {{ rhel_map.epel_key }}
    - source_hash: {{ rhel_map.epel_key_hash }}

epel_release:
  pkg.installed:
    - sources:
      - epel-release: {{ rhel_map.epel_rpm }}
    - require:
      - file: install_pubkey_epel

set_pubkey_epel:
  file.replace:
    - append_if_not_found: True
    - name: /etc/yum.repos.d/epel.repo
    - pattern: '^gpgkey=.*'
    - repl: 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'
    - require:
      - pkg: epel_release

set_gpg_epel:
  file.replace:
    - append_if_not_found: True
    - name: /etc/yum.repos.d/epel.repo
    - pattern: 'gpgcheck=.*'
    - repl: 'gpgcheck=1'
    - require:
      - pkg: epel_release

enable_epel:
  file.replace:
    - name: /etc/yum.repos.d/epel.repo
    - pattern: '^enabled=[0,1]'
    - repl: 'enabled=1'

php_external_repo:
  pkgrepo:
    - managed
    - name: webtactic
    - mirrorlist: https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist
    - gpgcheck: 1
    - failovermethod: 'priority'
    - require:
      - file: enable_epel
  {%- else %}
    {# External repos are only available for Debian and RedHat families #}
  {%- endif %}
{%- endif %}
