{% from "php/ng/map.jinja" import php with context %}

{% set modules = salt['pillar.get']('php:ng:modules') or [] %}
{% set base_name = 'php.ng.' %}
{% set existing_states = salt['cp.list_states']() %}

{% set includes = [] %}
{% set install = [] %}

{% for module in modules %}
{%   set state = base_name ~ module %}
{%   if state in existing_states %}
{%     do includes.append(state) %}
{%   else %}
{%     do install.append(module) %}
{%   endif %}
{% endfor %}

include: {{ includes|json }}

{% for state in install %}
{%   include "php/ng/installed.jinja" %}
{% endfor %}
