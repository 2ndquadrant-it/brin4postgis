-- Test variables
\set points_count 1000000
\set box_xmin -10.
\set box_ymin -10.
\set box_zmin -10.
\set box_xmax 10.
\set box_ymax 10.
\set box_zmax 10.

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION brin4postgis;

-- Create test environment
CREATE TABLE points(id serial PRIMARY KEY, x double precision DEFAULT -100 + random() * 200., y double precision DEFAULT -100 + random() * 200., z double precision DEFAULT -100 + random() * 200.);
INSERT INTO points(id) SELECT n FROM generate_series(1, :points_count) f(n);
CREATE TABLE postgis_points AS SELECT id, ST_MakePoint(x, y, z) AS point FROM points;

-- Test without index
EXPLAIN (TIMING false) SELECT count(*) FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_one AS SELECT id FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

-- CREATE THE INDEX
CREATE INDEX brin_point_idx ON postgis_points USING brin(box3d(point) brin_geometry_inclusion_ops_box3d);

-- Test with index
EXPLAIN (TIMING false) SELECT count(*) FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_two AS SELECT id FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

-- Compare results
SELECT count(*) FROM brin_compare_one WHERE id NOT IN (SELECT id FROM brin_compare_two);
SELECT count(*) FROM brin_compare_two WHERE id NOT IN (SELECT id FROM brin_compare_one);

-- Append other points
INSERT INTO points(id) SELECT n FROM generate_series(:points_count + 1, :points_count * 2) f(n);
INSERT INTO postgis_points SELECT id, ST_MakePoint(x, y, z) AS point FROM points where id > :points_count;

-- Empty test tables
DROP TABLE brin_compare_one;
DROP TABLE brin_compare_two;

-- Test with index
EXPLAIN (TIMING false) SELECT count(*) FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_two AS SELECT id FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

--DROP THE INDEX
DROP INDEX brin_point_idx;

-- Test without index
EXPLAIN (TIMING false) SELECT count(*) FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));
CREATE TABLE brin_compare_one AS SELECT id FROM postgis_points WHERE box3d(point) @ ST_3DMakeBox(ST_MakePoint(:box_xmin, :box_ymin, :box_zmin), ST_MakePoint(:box_xmax, :box_ymax, :box_zmax));

-- Compare results
SELECT count(*) FROM brin_compare_one WHERE id NOT IN (SELECT id FROM brin_compare_two);
SELECT count(*) FROM brin_compare_two WHERE id NOT IN (SELECT id FROM brin_compare_one);

-- Clean working environment
--DROP TABLE postgis_points;
DROP TABLE points;
DROP TABLE brin_compare_one;
DROP TABLE brin_compare_two;
