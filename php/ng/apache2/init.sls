# Installs libapache2-mod-php5 package and manages the associated php.ini on os Debian
{% if grains['os_family']=="Debian" %}

include:
  - php.ng.apache2.install
  - php.ng.apache2.ini

extend:
  php_apache2_ini:
    file:
      - require:
        - sls: php.ng.apache2.install

{% endif %} #END: os = debian
