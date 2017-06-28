{%- from "php/map.jinja" import php with context %}

{%- if not 'ng' in salt['pillar.get']('php', {}) %}
  {%- set use_external_repo = salt['pillar.get']('php:use_external_repo', False) %}
  {%- if use_external_repo %}
include:
  - php.extrepo

php_from_extrepo:
  pkg.latest:
    - name: {{ php.php_pkg }}
    - refresh: True
    - require:
      - pkgrepo: php_external_repo
  {%- endif %}

php:
  pkg.installed:
    - name: {{ php.php_pkg }}

{%- endif %}
