Puppet Apache Module and Flag Type
==================================

Type 'a2mod'
===========
This type loads and unloads Apache modules for Debian, Ubuntu and SuSE systems.

Type 'a2flag'
============
This type loads and unloads Apache flags on SuSE systems

License: GPLv3

Requirements
------------

* NA

Usage
-----

    a2mod { "module":
      ensure => present,
    }

    a2flag { "flag":
      ensure => absent,
    }

