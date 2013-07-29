include:
  - apt

{% if grains['os']=="Ubuntu" %}

php5:
  pkg.installed:
    - order: 175

{% endif %}
