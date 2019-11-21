# Installs php-cli and manages the associated php.ini

include:
  - php.cli.install
  - php.cli.ini

{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
{% if pillar_php_version is iterable and pillar_php_version is not string %}
extend:
  {% for version in pillar_php_version %}
  php_cli_ini_{{ version }}:
    file:
      - require:
        - sls: php.cli.install
  {% endfor %}
{% else %}
extend:
  php_cli_ini:
    file:
      - require:
        - sls: php.cli.install
{% endif %}
