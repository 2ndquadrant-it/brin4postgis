CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION brin4postgis;

-- test if @ returns true.
SELECT ST_3DMakeBox(ST_MakePoint(-0.5, -0.5, -0.5), ST_MakePoint(0.5, 0.5, 0.5)) @ ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.));

-- test if @ returns false.
SELECT ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.)) @ ST_3DMakeBox(ST_MakePoint(-0.5, -0.5, -0.5), ST_MakePoint(0.5, 0.5, 0.5));

-- test if @ returns true in case of overlapping.
SELECT ST_3DMakeBox(ST_MakePoint(-1., -1., 1.), ST_MakePoint(0., 0., 0.)) @ ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.));
