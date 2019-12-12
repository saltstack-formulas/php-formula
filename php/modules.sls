{% from "php/map.jinja" import php with context %}

{% set modules = salt['pillar.get']('php:modules') or [] %}
{% set base_name = 'php.' %}
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

{% for module_with_no_state in install %}
{%   set state = module_with_no_state %}
{%   include "php/installed.jinja" %}
{% endfor %}
