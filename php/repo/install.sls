# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/macro.jinja" import format_kwargs with context %}

php/repo/install:
  pkgrepo.managed:
    {{- format_kwargs(php.repo) }}
