include:
{% if grains['os_family'] in ["Debian", "FreeBSD"] %}
  - php.ng.apache2.install
{% endif %} #END: os = Debian|FreeBSD
{% if grains['os_family'] == "Debian" %}
  - php.ng.apache2.ini

extend:
  php_apache2_ini:
    file:
      - require:
        - sls: php.ng.apache2.install
{% endif %} #END: os = debian
