
Changelog
=========

`1.0.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.41.1...v1.0.0>`_ (2019-08-26)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **ng:** promote NG formula (\ `57b37dd <https://github.com/saltstack-formulas/php-formula/commit/57b37dd>`_\ ), closes `#183 <https://github.com/saltstack-formulas/php-formula/issues/183>`_

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **ng:** all previous ``php`` based configurations must be reviewed;
  ``php.ng`` usage must be promoted to ``php`` and any uses of the original
  ``php`` will have to be converted.

`0.41.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.41.0...v0.41.1>`_ (2019-08-26)
--------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **readme:** remove duplicate contents (local) (\ `f16796a <https://github.com/saltstack-formulas/php-formula/commit/f16796a>`_\ )

`0.41.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.40.1...v0.41.0>`_ (2019-08-26)
--------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **ng:** promote NG formula (\ `f1b71d0 <https://github.com/saltstack-formulas/php-formula/commit/f1b71d0>`_\ )

`0.40.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.40.0...v0.40.1>`_ (2019-08-17)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **map:** fix missing value for php.lookup.fpm.user in multi-php mode (\ `f91d942 <https://github.com/saltstack-formulas/php-formula/commit/f91d942>`_\ )

`0.40.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.39.2...v0.40.0>`_ (2019-08-17)
--------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **yamllint:** include for this repo and apply rules throughout (\ `571cc4b <https://github.com/saltstack-formulas/php-formula/commit/571cc4b>`_\ )

`0.39.2 <https://github.com/saltstack-formulas/php-formula/compare/v0.39.1...v0.39.2>`_ (2019-08-13)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **tests:** fix package name for debian (\ `4f75eac <https://github.com/saltstack-formulas/php-formula/commit/4f75eac>`_\ )

`0.39.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.39.0...v0.39.1>`_ (2019-08-12)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **installed.jinja:** remove ``include`` to prevent conflicting IDs (\ `cb11784 <https://github.com/saltstack-formulas/php-formula/commit/cb11784>`_\ ), closes `#188 <https://github.com/saltstack-formulas/php-formula/issues/188>`_

`0.39.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.38.1...v0.39.0>`_ (2019-08-07)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **php/ng:** don't iterate on string, make sure list is not string (\ `dbb542c <https://github.com/saltstack-formulas/php-formula/commit/dbb542c>`_\ )

Documentation
^^^^^^^^^^^^^


* **pillar.example:** add example for alternatives with multiversion (\ `23a6ec1 <https://github.com/saltstack-formulas/php-formula/commit/23a6ec1>`_\ )
* **pillar.example:** example of versions (\ `a98aa7e <https://github.com/saltstack-formulas/php-formula/commit/a98aa7e>`_\ )

Features
^^^^^^^^


* **php/ng:** support for php cli multiversion (\ `bb4a077 <https://github.com/saltstack-formulas/php-formula/commit/bb4a077>`_\ )
* **php/ng:** support the use of a list of php versions (\ `b303239 <https://github.com/saltstack-formulas/php-formula/commit/b303239>`_\ ), closes `#138 <https://github.com/saltstack-formulas/php-formula/issues/138>`_

Styles
^^^^^^


* **pillar.example:** add line break (\ `38fe58f <https://github.com/saltstack-formulas/php-formula/commit/38fe58f>`_\ )

`0.38.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.38.0...v0.38.1>`_ (2019-08-03)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* update deprecation version number in ``semantic-release`` run (\ `a87fb91 <https://github.com/saltstack-formulas/php-formula/commit/a87fb91>`_\ ), closes `/github.com/saltstack-formulas/php-formula/pull/175#issuecomment-517492613 <https://github.com//github.com/saltstack-formulas/php-formula/pull/175/issues/issuecomment-517492613>`_ `/github.com/saltstack-formulas/php-formula/pull/185#issuecomment-517603898 <https://github.com//github.com/saltstack-formulas/php-formula/pull/185/issues/issuecomment-517603898>`_

`0.38.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.37.1...v0.38.0>`_ (2019-08-01)
--------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **map:** add xmlrpc package for xml module, as it was done for SUSE (\ `a09ef92 <https://github.com/saltstack-formulas/php-formula/commit/a09ef92>`_\ )

`0.37.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.37.0...v0.37.1>`_ (2019-08-01)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* add warning message for ng states (\ `d45bae8 <https://github.com/saltstack-formulas/php-formula/commit/d45bae8>`_\ )
* allow muting deprecation warning via. pillar/config entry (\ `8e7471e <https://github.com/saltstack-formulas/php-formula/commit/8e7471e>`_\ )
* change message to warn about upcoming deprecation (\ `e97eeae <https://github.com/saltstack-formulas/php-formula/commit/e97eeae>`_\ )
* warn formula users ng states will be promoted in ``v1.0.0`` (\ `d033381 <https://github.com/saltstack-formulas/php-formula/commit/d033381>`_\ )
* **pillar_from_files:** use ``{}`` pillar files to ensure tests pass (\ `1a5d734 <https://github.com/saltstack-formulas/php-formula/commit/1a5d734>`_\ )
* **readme:** add warning in  docs/README.rst (\ `3ac59e4 <https://github.com/saltstack-formulas/php-formula/commit/3ac59e4>`_\ )

`0.37.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.36.0...v0.37.0>`_ (2019-07-09)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **mods:** fixup for `#181 <https://github.com/saltstack-formulas/php-formula/issues/181>`_ (\ `e2d7b4b <https://github.com/saltstack-formulas/php-formula/commit/e2d7b4b>`_\ )

Features
^^^^^^^^


* **mods:** added some mods support for FreeBSD (\ `3f6c0bc <https://github.com/saltstack-formulas/php-formula/commit/3f6c0bc>`_\ )

`0.36.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.35.1...v0.36.0>`_ (2019-06-29)
--------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **readme:** update with modules, bz2 & dba (\ `5e04187 <https://github.com/saltstack-formulas/php-formula/commit/5e04187>`_\ )

Features
^^^^^^^^


* add 'bz2' and 'dba' module support (\ `758ae88 <https://github.com/saltstack-formulas/php-formula/commit/758ae88>`_\ )

`0.35.1 <https://github.com/saltstack-formulas/php-formula/compare/v0.35.0...v0.35.1>`_ (2019-06-28)
--------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* merge latest changes from ``template-formula`` (\ `4af569a <https://github.com/saltstack-formulas/php-formula/commit/4af569a>`_\ ), closes `#179 <https://github.com/saltstack-formulas/php-formula/issues/179>`_

`0.35.0 <https://github.com/saltstack-formulas/php-formula/compare/v0.34.0...v0.35.0>`_ (2019-06-27)
--------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **semantic-release:** add support of semantic-release (\ `cdd206a <https://github.com/saltstack-formulas/php-formula/commit/cdd206a>`_\ )
