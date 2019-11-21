{% if grains['os_family'] in ["Debian", "FreeBSD"] %}
include:
  - php.apache2.install
{% endif %} #END: os = Debian|FreeBSD
{% if grains['os_family'] == "Debian" %}
  - php.apache2.ini

extend:
  php_apache2_ini:
    file:
      - require:
        - sls: php.apache2.install
{% endif %} #END: os = debian
