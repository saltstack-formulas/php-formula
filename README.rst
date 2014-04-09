===
php
===

Formulas to set up and configure php and various php libraries.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

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

``php.adodb``
------------

Installs the php-cli package.

``php.cli``
------------

Installs the php-adodb package.

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


``php.imagick``
------------

Installs the php-imagick package.

``php.imap``
------------

Installs the php-imap package.

``php.ldap``
------------

Installs the php-ldap package.

``php.mbstring``
---------------

Installs the php-mbstring package.

``php.mcrypt``
--------------

Installs the php-mcrypt package.


``php.memcache``
------------

Installs the php-memcache package.

``php.memcached``
------------

Installs the php-memcached package.

``php.mysql``
-------------

Installs the php-mysql package.

``php.mysqlnd``
------------

Installs the php-mysqlnd package.

``php.pear``
------------

Installs the php-pear package.

``php.pgsql``
------------

Installs the php-pgsql package.

``php.soap``
------------

Installs the php-soap package.

``php.suhosin``
------------

Installs the php-suhosin package.

``php.xml``
------------

Installs the php-xml package.
