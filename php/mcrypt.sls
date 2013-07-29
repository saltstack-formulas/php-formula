include:
  - apt

{% if grains['os']=="Ubuntu" %}

php5-mcrypt:
  pkg.installed:
    - order: 180

{% endif %}
