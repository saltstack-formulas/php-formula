{%- from "php/map.jinja" import php with context %}

{%- if not 'ng' in salt['pillar.get']('php', {}) %}

  {%- if grains['os'] == "Ubuntu" %}
    {%- set use_ppa = salt['pillar.get']('php:use_ppa', False) %}

    {%- if use_ppa %}
      {%- set ppa_name = salt['pillar.get']('php:ppa_name', 'ondrej/php') %}

php_from_ppa:
  pkgrepo.managed:
    - ppa: {{ ppa_name }}
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