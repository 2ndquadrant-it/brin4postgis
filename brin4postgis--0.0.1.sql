----------
-- N-D GEOMETRY Operators
-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

CREATE OR REPLACE FUNCTION is_overleft_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &< b::geometry;
  END;  
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overleft_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &< b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overleft_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a &< b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overright_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overright_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &> b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overright_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a &> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_left_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry << b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_left_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry << b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_left_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a << b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_right_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry >> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_right_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry >> b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_right_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a >> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION intersects_wrap_3d(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &&& b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION intersects_wrap_3d(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &&& b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION intersects_wrap_3d(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a &&& b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_thesame_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry ~= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_thesame_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry ~= b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_thesame_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a ~= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION contains_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry ~ b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION contains_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry ~ b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION contains_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a ~ b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_contained_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry @ b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_contained_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry @ b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_contained_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a @ b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_below_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry <<| b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_below_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry <<| b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_below_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a <<| b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overbelow_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &<| b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overbelow_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry &<| b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overbelow_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a &<| b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overabove_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry |&> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overabove_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry |&> b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overabove_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a |&> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_above_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry |>> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_above_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry |>> b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_above_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a |>> b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_less_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry < b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_less_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry < b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_less_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a < b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_lessorequal_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry <= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_lessorequal_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry <= b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_lessorequal_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a <= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greater_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry > b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greater_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry > b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greater_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a > b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greaterorequal_wrap(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry >= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greaterorequal_wrap(a box3d, b geometry)
RETURNS boolean AS
$$
  BEGIN
    RETURN a::geometry >= b;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greaterorequal_wrap(a geometry, b box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN a >= b::geometry;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION st_union_wrap(a box3d, b box3d)
RETURNS box3d AS
$$
  BEGIN
    RETURN box3d(st_union(a::geometry, b::geometry));
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION st_isempty_wrap(a box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN st_isempty(a::geometry);
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION box3d_wrap(a geometry)
RETURNS box3d AS
$$
  BEGIN
    RETURN box3d(a);
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

-------------------
-- Create operators
-------------------

CREATE OPERATOR &< (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overleft_wrap,
  COMMUTATOR = << ,
  NEGATOR    = >>
);

CREATE OPERATOR &< (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_overleft_wrap ,
  COMMUTATOR = << ,
  NEGATOR    = >>
);

CREATE OPERATOR &< (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overleft_wrap ,
  COMMUTATOR = << ,
  NEGATOR    = >>
);

CREATE OPERATOR &> (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_overright_wrap ,
  COMMUTATOR = >> ,
  NEGATOR    = <<
);

CREATE OPERATOR &> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overright_wrap ,
  COMMUTATOR = >> ,
  NEGATOR    = <<
);

CREATE OPERATOR &> (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overright_wrap ,
  COMMUTATOR = >> ,
  NEGATOR    = <<
);

CREATE OPERATOR << (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_left_wrap ,
  COMMUTATOR = &< ,
  NEGATOR    = >>
);

CREATE OPERATOR << (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_left_wrap ,
  COMMUTATOR = &< ,
  NEGATOR    = >>
);

CREATE OPERATOR << (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_left_wrap ,
  COMMUTATOR = &< ,
  NEGATOR    = >>
);

CREATE OPERATOR >> (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_right_wrap ,
  COMMUTATOR = &> ,
  NEGATOR    = <<
);

CREATE OPERATOR >> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_right_wrap ,
  COMMUTATOR = &> ,
  NEGATOR    = <<
);

CREATE OPERATOR >> (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_right_wrap ,
  COMMUTATOR = &> ,
  NEGATOR    = <<
);

CREATE OPERATOR &&& (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = intersects_wrap_3d ,
  COMMUTATOR = &&&
);

CREATE OPERATOR &&& (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = intersects_wrap_3d ,
  COMMUTATOR = &&&
);

CREATE OPERATOR &&& (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = intersects_wrap_3d ,
  COMMUTATOR = &&&
);

CREATE OPERATOR ~= (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_thesame_wrap ,
  COMMUTATOR = ~=
);

CREATE OPERATOR ~= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_thesame_wrap ,
  COMMUTATOR = ~=
);

CREATE OPERATOR ~= (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_thesame_wrap ,
  COMMUTATOR = ~=
);

CREATE OPERATOR ~ (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = contains_wrap ,
  COMMUTATOR = ~
);

CREATE OPERATOR ~ (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = contains_wrap ,
  COMMUTATOR = ~
);

CREATE OPERATOR ~ (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = contains_wrap ,
  COMMUTATOR = ~
);

CREATE OPERATOR @ (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_contained_wrap ,
  COMMUTATOR = @
);

CREATE OPERATOR @ (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_contained_wrap ,
  COMMUTATOR = @
);

CREATE OPERATOR @ (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_contained_wrap ,
  COMMUTATOR = @
);

CREATE OPERATOR <<| (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_below_wrap ,
  COMMUTATOR = &<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR <<| (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_below_wrap ,
  COMMUTATOR = &<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR <<| (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_below_wrap ,
  COMMUTATOR = &<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR &<| (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_overbelow_wrap ,
  COMMUTATOR = <<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR &<| (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overbelow_wrap ,
  COMMUTATOR = <<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR &<| (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overbelow_wrap ,
  COMMUTATOR = <<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR |&> (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_overabove_wrap ,
  COMMUTATOR = |>> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |&> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overabove_wrap ,
  COMMUTATOR = |>> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |&> (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overabove_wrap ,
  COMMUTATOR = |>> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |>> (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_above_wrap ,
  COMMUTATOR = |&> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |>> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_above_wrap ,
  COMMUTATOR = |&> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |>> (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_above_wrap ,
  COMMUTATOR = |&> ,
  NEGATOR    = <<|
);

CREATE OPERATOR < (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_less_wrap ,
  COMMUTATOR = <= ,
  NEGATOR    = >
);

CREATE OPERATOR < (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_less_wrap ,
  COMMUTATOR = <= ,
  NEGATOR    = >
);

CREATE OPERATOR < (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_less_wrap ,
  COMMUTATOR = <= ,
  NEGATOR    = >
);

CREATE OPERATOR <= (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_lessorequal_wrap ,
  COMMUTATOR = < ,
  NEGATOR    = >
);

CREATE OPERATOR <= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_lessorequal_wrap ,
  COMMUTATOR = < ,
  NEGATOR    = >
);

CREATE OPERATOR <= (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_lessorequal_wrap ,
  COMMUTATOR = < ,
  NEGATOR    = >
);

CREATE OPERATOR > (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_greater_wrap,
  COMMUTATOR = >= ,
  NEGATOR    = <
);

CREATE OPERATOR > (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greater_wrap,
  COMMUTATOR = >= ,
  NEGATOR    = <
);

CREATE OPERATOR > (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greater_wrap,
  COMMUTATOR = >= ,
  NEGATOR    = <
);

CREATE OPERATOR >= (
  LEFTARG    = box3d ,
  RIGHTARG   = geometry ,
  PROCEDURE  = is_greaterorequal_wrap ,
  COMMUTATOR = > ,
  NEGATOR    = <
);

CREATE OPERATOR >= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greaterorequal_wrap ,
  COMMUTATOR = > ,
  NEGATOR    = <
);

CREATE OPERATOR >= (
  LEFTARG    = geometry ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greaterorequal_wrap ,
  COMMUTATOR = > ,
  NEGATOR    = <
);

-------------------------
-- Create operator family
-------------------------

CREATE OPERATOR FAMILY brin_geometry_inclusion_family USING brin;

CREATE OPERATOR CLASS brin_geometry_inclusion_ops_box3d
       FOR TYPE box3d USING brin FAMILY brin_geometry_inclusion_family AS
  OPERATOR        1        &<(box3d,box3d) ,
  OPERATOR        2        >>(box3d,box3d) ,
  OPERATOR        3        &&&(box3d,box3d) ,
  OPERATOR        4        &>(box3d,box3d) ,
  OPERATOR        5        <<(box3d,box3d) ,
  OPERATOR        6        ~=(box3d,box3d) ,
  OPERATOR        7        ~(box3d,box3d) ,
  OPERATOR        8        @(box3d,box3d) ,
  OPERATOR        9        <<|(box3d,box3d) ,
  OPERATOR        10       &<|(box3d,box3d) ,
  OPERATOR        11       |&>(box3d,box3d) ,
  OPERATOR        12       |>>(box3d,box3d) ,
  OPERATOR        20       <(box3d,box3d) ,
  OPERATOR        21       <=(box3d,box3d) ,
  OPERATOR        22       >(box3d,box3d) ,
  OPERATOR        23       >=(box3d,box3d) ,
  FUNCTION        1        brin_inclusion_opcinfo(internal) ,
  FUNCTION        2        brin_inclusion_add_value(internal, internal, internal, internal) ,
  FUNCTION        3        brin_inclusion_consistent(internal, internal, internal) ,
  FUNCTION        4        brin_inclusion_union(internal, internal, internal) ,
  FUNCTION        11       st_union_wrap(box3d, box3d) ,
  FUNCTION        13       contains_wrap(box3d, box3d) ,
  FUNCTION        14       st_isempty_wrap(box3d);

CREATE OPERATOR CLASS brin_geometry_inclusion_ops_geom
	FOR TYPE geometry  USING brin FAMILY brin_geometry_inclusion_family AS
  OPERATOR        1        &<(geometry,geometry) ,
  OPERATOR        2        >>(geometry,geometry) ,
  OPERATOR        3        &&&(geometry,geometry) ,
  OPERATOR        4        &>(geometry,geometry) ,
  OPERATOR        5        <<(geometry,geometry) ,
  OPERATOR        6        ~=(geometry,geometry) ,
  OPERATOR        7        ~(geometry,geometry) ,
  OPERATOR        8        @(geometry,geometry) ,
  OPERATOR        9        <<|(geometry,geometry) ,
  OPERATOR        10       &<|(geometry,geometry) ,
  OPERATOR        11       |&>(geometry,geometry) ,
  OPERATOR        12       |>>(geometry,geometry) ,
  OPERATOR        20       <(geometry,geometry) ,
  OPERATOR        21       <=(geometry,geometry) ,
  OPERATOR        22       >(geometry,geometry) ,
  OPERATOR        23       >=(geometry,geometry) ,
  FUNCTION        1        brin_inclusion_opcinfo(internal) ,
  FUNCTION        2        brin_inclusion_add_value(internal, internal, internal, internal) ,
  FUNCTION        3        brin_inclusion_consistent(internal, internal, internal) ,
  FUNCTION        4        brin_inclusion_union(internal, internal, internal) ,
  FUNCTION        11       st_union(geometry, geometry) ,
  FUNCTION        13       st_contains(geometry, geometry) ,
  FUNCTION        14       st_isempty(geometry),
  FUNCTION        15       box3d_wrap(geometry),
  STORAGE box3d;

ALTER OPERATOR FAMILY brin_geometry_inclusion_family USING brin ADD
  -- cross type comparisons geometry vs box3d
  OPERATOR        1        &<(geometry,box3d) ,
  OPERATOR        2        >>(geometry,box3d) ,
  OPERATOR        3        &&&(geometry,box3d) ,
  OPERATOR        4        &>(geometry,box3d) ,
  OPERATOR        5        <<(geometry,box3d) ,
  OPERATOR        6        ~=(geometry,box3d) ,
  OPERATOR        7        ~(geometry,box3d) ,
  OPERATOR        8        @(geometry,box3d) ,
  OPERATOR        9        <<|(geometry,box3d) ,
  OPERATOR        10       &<|(geometry,box3d) ,
  OPERATOR        11       |&>(geometry,box3d) ,
  OPERATOR        12       |>>(geometry,box3d) ,
  OPERATOR        20       <(geometry,box3d) ,
  OPERATOR        21       <=(geometry,box3d) ,
  OPERATOR        22       >(geometry,box3d) ,
  OPERATOR        23       >=(geometry,box3d) ,

  -- cross type comparisons box3d vs geometry
  OPERATOR        1        &<(box3d,geometry) ,
  OPERATOR        2        >>(box3d,geometry) ,
  OPERATOR        3        &&&(box3d,geometry) ,
  OPERATOR        4        &>(box3d,geometry) ,
  OPERATOR        5        <<(box3d,geometry) ,
  OPERATOR        6        ~=(box3d,geometry) ,
  OPERATOR        7        ~(box3d,geometry) ,
  OPERATOR        8        @(box3d,geometry) ,
  OPERATOR        9        <<|(box3d,geometry) ,
  OPERATOR        10       &<|(box3d,geometry) ,
  OPERATOR        11       |&>(box3d,geometry) ,
  OPERATOR        12       |>>(box3d,geometry) ,
  OPERATOR        20       <(box3d,geometry) ,
  OPERATOR        21       <=(box3d,geometry) ,
  OPERATOR        22       >(box3d,geometry) ,
  OPERATOR        23       >=(box3d,geometry);



