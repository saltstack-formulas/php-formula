include:
  - php.ng.deprecated

{% set state = 'mdb2-driver-pgsql' %}
{% include "php/ng/installed.jinja" %}
{% include "php/ng/mdb2/init.sls" %}
