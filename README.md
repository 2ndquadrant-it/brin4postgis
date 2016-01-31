BRIN4PostGIS
=======

This software is EXPERIMENTAL and therefore NOT production ready. Use at your
own risk.

BRIN4PostGIS is a PostGIS extension adding support for BRIN indexes.

This project is sponsored by [2ndQuadrant](http://www.2ndquadrant.com).

Installation
------------

- Compatible with PostgreSQL 9.5 and above
- Needs PostGIS 2.1.8 and above
- decompress the tarball
- sudo make install
- In every needed database: CREATE EXTENSION brin4postgis;

Usage
-----
This extension implements the needed Op Class to use BRIN indexes for
3D geometry and box3d datatypes. The following operators have been
overloaded for this purpose:

* &<
* >
* &&&
* &>
* <<
* ~=
* ~
* @
* <<|
* &<|
* |&>
* |>>
* <
* <=
* >
* >=

An example of usage can be found in the script for the regression tests.

IMPORTANT NOTES
---------------
geometries are stored as box3d objects in the BRIN, with SRID set to 0,
so the spatial units are in the units of the spatial reference system in
use denoted by the SRID of the original geometry. No information is kept
about the original SRID, so pay attention during inclusion operations.
