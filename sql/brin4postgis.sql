-- Test variables
\set points_count 1000
\set box_xmin -10.
\set box_ymin -10.
\set box_zmin -10.
\set box_xmax 10.
\set box_ymax 10.
\set box_zmax 10.

-- Create execution environment
CREATE TABLE points(id serial PRIMARY KEY, x double precision DEFAULT random() * 100., y double precision DEFAULT random() * 100., z double precision DEFAULT random() * 100.);
INSERT INTO points(id) SELECT n FROM generate_series(1, :points_count) f(n);
CREATE TABLE postgis_points AS SELECT id, ST_MakePoint(x, y, z) AS point FROM points;

-- Test without index
SELECT count(*) FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
EXPLAIN SELECT count(*) FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_two AS SELECT id FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

-- CREATE THE INDEX
\timing
CREATE INDEX brin_point_idx ON postgis_points USING brin(point brin_geometry_inclusion_ops_geom);
\timing

-- Test with index
SELECT count(*) FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
EXPLAIN SELECT count(*) FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_one AS SELECT id FROM postgis_points WHERE point @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

-- Compare results
SELECT count(*) FROM brin_compare_one WHERE id NOT IN (SELECT id FROM brin_compare_two);
SELECT count(*) FROM brin_compare_two WHERE id NOT IN (SELECT id FROM brin_compare_one);

-- Append other points
INSERT INTO points(id) SELECT n FROM generate_series(:points_count + 1, :points_count * 2) f(n);
INSERT INTO postgis_points SELECT id, ST_MakePoint(x, y, z) AS point FROM points;

-- Clean working environment
DROP INDEX brin_point_idx;
DROP TABLE postgis_points;
DROP TABLE points;
DROP TABLE brin_compare_one;
DROP TABLE brin_compare_two;
