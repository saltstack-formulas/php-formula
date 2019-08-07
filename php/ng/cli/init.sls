# Installs php-cli and manages the associated php.ini

include:
  - php.ng.deprecated
  - php.ng.cli.install
  - php.ng.cli.ini

{% set pillar_php_ng_version = salt['pillar.get']('php:ng:version', '7.0') %}
{% if pillar_php_ng_version is iterable and pillar_php_ng_version is not string %}
extend:
  {% for version in pillar_php_ng_version %}
  php_cli_ini_{{ version }}:
    file:
      - require:
        - sls: php.ng.cli.install
  {% endfor %}
{% else %}
extend:
  php_cli_ini:
    file:
      - require:
        - sls: php.ng.cli.install
{% endif %}
