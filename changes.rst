## Overview

This is a major update to the `php-formula` that has been needed since the release of the updated `ondrej/php` PPA formula. When updating this formula, I attempted to keep much of the existing logic intact, while allowing for the new structure introduced by the PPA.

## Issues Solved

Issue 108 -> https://github.com/saltstack-formulas/php-formula/issues/108
Defaults for versions are now set so that the states `php.ng.cli.ini` and `php.ng.apache2.ini` work provided you run the parent SLS.

Issue 93 -> https://github.com/saltstack-formulas/php-formula/issues/93
Issue 92 -> https://github.com/saltstack-formulas/php-formula/issues/92
Issue 90 -> https://github.com/saltstack-formulas/php-formula/issues/90

Most of the changes solve these issues with versioning.

## Changes

 - Updated `suhosin` states to use corresponding Git repositories  (PHP 5.X or 7.X)
 - Updated `mongo` states to compile from PECL (needed build packages)

## Help Needed

 - How to handle states like `gearman` which, without a PPA, has an installation candidate in Ubuntu Trusty and below, but not in Ubuntu Xenial
