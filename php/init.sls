{%- from "php/map.jinja" import php with context %}

{%- if not 'ng' in salt['pillar.get']('php', {}) %}

  {%- if grains['os'] == "Ubuntu" %}
    {%- set use_external_repo = salt['pillar.get']('php:use_external_repo', False) %}

    {%- if use_external_repo %}
      {%- set external_repo_name = salt['pillar.get']('php:external_repo_name', 'ondrej/php') %}

php_from_ppa:
  pkgrepo.managed:
    - ppa: {{ external_repo_name }}
    - env:
      - LC_ALL: "C.UTF-8"
    - require_in:
      - pkg: php_from_ppa
  pkg.latest:
    - name: {{ php.php_pkg }}
    - refresh: True

    {%- endif %}

  {%- endif %}

php:
  pkg.installed:
    - name: {{ php.php_pkg }}

{%- endif %}