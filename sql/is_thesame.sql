CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION brin4postgis;

-- test if ~= returns true.
SELECT ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.)) ~= ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.));

-- test if ~= returns false.
SELECT ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 1.)) ~= ST_3DMakeBox(ST_MakePoint(-1., -1., -1.), ST_MakePoint(1., 1., 2.));
