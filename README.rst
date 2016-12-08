===
php
===

Formulas to set up and configure php and various php libraries.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``php``
-------

Installs the php package.

``php.apc``
-----------

Installs the php-apc package.
Disabled by default on opensuse need server:php repo

``php.apcu``
------------

Installs the php-apcu package.
Disabled by default on opensuse need server:php repo

``php.adodb``
-------------

Installs the php-adodb package.

``php.cgi``
-----------

Installs the php-cgi package.
Disabled on opensuse not available, only fastcgi

``php.cli``
-----------

Installs the php-cli package.

``php.composer``
-----------

Installs [composer](https://getcomposer.org) and keeps it updated.

``php.curl``
------------

Installs the php5-curl package on Debian, and ensures that curl itself is
installed for RedHat systems, this is due to the curl libs being provided by
php-common, which will get installed with the main php package.

``php.fpm``
-----------

Installs the php-fpm package, starts the service, and enables it.

``php.gd``
----------

Installs the php-gd package.

``php.intl``
------------

Installs the php-intl package.

``php.imagick``
---------------

Installs the php-imagick package.
Disabled on opensuse not available.

``php.imap``
------------

Installs the php-imap package.

``php.json``
------------

Installs the php-json package.

``php.ldap``
------------

Installs the php-ldap package.

``php.mbstring``
----------------

Installs the php-mbstring package.

``php.mcrypt``
--------------

Installs the php-mcrypt package.

``php.memcache``
----------------

Installs the php-memcache package.
Disabled on opensuse need server:php:extensions repo

``php.memcached``
-----------------

Installs the php-memcached package.
Disabled on opensuse need server:php:extensions repo

``php.mysql``
-------------

Installs the php-mysql package.

``php.mysqlnd``
---------------

Installs the php-mysqlnd package.
Disabled on opensuse no package.

``php.pear``
------------

Installs the php-pear package.

``php.redis``
------------

Installs the php-redis package.
Disabled on opensuse need server:php:extensions repo

``php.pgsql``
-------------

Installs the php-pgsql package.

``php.soap``
------------

Installs the php-soap package.

``php.sqlite``
--------------

Installs the php-sqlite package,

``php.suhosin``
---------------

Installs the php-suhosin package.

``php.mongo``
-------------

Installs the php-mongo package.
Disabled on opensuse need server:php:extensions repo

``php.xml``
-----------

Installs the php-xml package.

Next-generation, alternate approach
===================================

The following states provide an alternate approach to managing PHP and FPM
pools, as well as code organization. Please provide feedback by filing issues,
discussing in ``#salt`` in Freenode and the mailing list as normal.

**Note:** php.ng states require the merge parameter of salt.modules.pillar.get(),
first available in the Helium release.

.. contents::
    :local:

``php.ng``
----------

Installs the php package.

``php.ng.adodb``
----------------

Installs the php-adodb package.

``php.ng.apache2``
----------------

Meta-state that combines `php.ng.apache2.install`_ and `php.ng.apache2.ini`_.

``php.ng.apache2.ini``
--------------

Manages the apache2 php.ini file

``php.ng.apache2.install``
--------------

Installs the apache2 and libapache2-mod-php5 package. Debian Only.

``php.ng.apc``
--------------

Installs the php-apc package.
Disabled on opensuse need server:php repo

``php.ng.apcu``
---------------

Installs the php-apcu package.
Disabled on opensuse need server:php repo

``php.ng.cgi``
--------------

Installs the php-cgi package.
Disabled on opensuse only php5-fastcgi available.

``php.ng.cli``
--------------

Meta-state that combines `php.ng.cli.install`_ and `php.ng.cli.ini`_.

``php.ng.cli.ini``
------------------

Manages the php-cli ini file.

``php.ng.cli.install``
----------------------

Installs the php-cli package.

``php.ng.curl``
---------------

Installs the php5-curl package on Debian, and ensures that curl itself is
installed for RedHat systems, this is due to the curl libs being provided by
php-common, which will get installed with the main php package.

``php.ng.gearman``
---------------

Installs the php-gearman package.

``php.ng.fpm``
--------------

Meta-state that combines all php.ng.fpm states.

``php.ng.fpm.config``
---------------------

Manages the (non-pool) php-fpm config files.

``php.ng.fpm.install``
----------------------

Installs the php-fpm package.

``php.ng.fpm.pools``
--------------------

Meta-state that combines `php.ng.fpm.service`_ and `php.ng.fpm.pools_config`_

``php.ng.fpm.pools_config``
---------------------------

Manages php-fpm pool config files.

``php.ng.fpm.service``
----------------------

Manages the php-fpm service.

``php.ng.gd``
-------------

Installs the php-gd package.

``php.ng.geoip``
----------------------

Installs the php-geoip package.

``php.ng.gmp``
----------

Installs the php-gmp package. Debian Only.

``php.ng.hhvm``
---------------

Meta-state that combines php.ng.hhvm states

``php.ng.hhvm.config``
----------------------

Manages the php-hhvm config files

``php.ng.hhvm.install``
-----------------------

Installs the php-hhvm package

``php.ng.hhvm.repo``
--------------------

Configures the hhvm repo for debian/ubuntu

``php.ng.hhvm.service``
-----------------------

Manages the php-hhvm service.

``php.ng.imagick``
------------------

Installs the php-imagick package.
Disabled on opensuse no package.

``php.ng.imap``
---------------

Installs the php-imap package.

``php.ng.intl``
---------------

Installs the php-intl package.

``php.ng.json``
---------------

Installs the php-json package.

``php.ng.ldap``
---------------

Installs the php-ldap package.

``php.ng.mbstring``
-------------------

Installs the php-mbstring package.

``php.ng.mcrypt``
-----------------

Installs the php-mcrypt package.

``php.ng.memcache``
-------------------

Installs the php-memcache package.
Disabled on opensuse need server:php:extensions repo

``php.ng.memcached``
--------------------

Installs the php-memcached package.
Disabled on opensuse need server:php:extensions repo

``php.ng.mongo``
--------------------

Installs the php-mongo package.

``php.ng.mongodb``
--------------------

Installs the php-mongodb package.

``php.ng.mysql``
----------------

Installs the php-mysql package.

``php.ng.mysqlnd``
------------------

Installs the php-mysqlnd package.
Disabled on opensuse no package.

``php.ng.oauth``
---------------

Installs the php-oauth package.

``php.ng.pear``
---------------

Installs the php-pear package.

``php.ng.pgsql``
----------------

Installs the php-pgsql package.

``php.ng.pspell``
----------------

Installs the php-pspell package.

``php.ng.redis``
---------------

Installs the php-redis package.
Disabled on opensuse need server:php:extensions repo

``php.ng.snmp``
---------------

Installs the php-snmp package.

``php.ng.soap``
---------------

Installs the php-soap package.

``php.ng.sqlite``
-----------------

Installs the php-sqlite package,

``php.ng.suhosin``
------------------

Installs the php-suhosin package.

``php.ng.xcache``
---------------

Meta-state that combines `php.ng.xcache.install`_ and `php.ng.xcache.ini`_.

``php.ng.xcache.ini``
---------------

Manages the php-xcache ini file

``php.ng.xcache.install``
---------------

Installs the php-xcache package.
Disabled on opensuse need server:php:extensions repo

``php.ng.xdebug``
--------------

Installs the php-xdebug package.

``php.ng.xml``
--------------

Installs the php-xml package.

``php.ng.xsl``
--------------

Installs the php-xsl package.

``php.ng.dev``
--------------

Installs the php5-dev and build-essential package.

``php.ng.gettext``
--------------

Installs the php-gettext package.

``php.ng.geshi``
--------------

Installs the php-geshi package.

``php.ng.mdb2``
--------------

Installs the php-mdb2 package.

``php.ng.mdb2-driver-mysql``
--------------

Installs the php-mdb2-driver-mysql package.

``php.ng.mdb2-driver-pgsql``
--------------

Installs the php-mdb2-driver-pgsql package.

``php.ng.seclib``
--------------

Installs the php-seclib package.

``php.ng.tidy``
--------------

Installs the php-tidy package.

``php.ng.tcpdf``
--------------

Installs the php-tcpdf package.

``php.ng.cache-lite``
--------------

Installs the php-cache-lite package.

``php.ng.console-table``
--------------

Installs the php-console-table package.
