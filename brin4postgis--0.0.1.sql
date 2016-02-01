----------
-- N-D GEOMETRY Operators
-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

CREATE OR REPLACE FUNCTION is_overleft(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmax(a) <= st_xmin(b) THEN
      RETURN true;
    END IF;   

    RETURN false;
  END;  
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overright(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) >= st_xmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_left(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmax(a) < st_xmin(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_right(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) > st_xmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION intersects(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF (st_xmin(a) <= st_xmin(b) AND st_xmin(b) <= st_xmax(a)) OR (st_xmin(a) >= st_xmin(b) AND st_xmin(a) <= st_xmax(b)) THEN
      IF (st_ymin(a) <= st_ymin(b) AND st_ymin(b) <= st_ymax(a)) OR (st_ymin(a) >= st_ymin(b) AND st_ymin(a) <= st_ymax(b)) THEN
        IF (st_zmin(a) <= st_zmin(b) AND st_zmin(b) <= st_zmax(a)) OR (st_zmin(a) >= st_zmin(b) AND st_zmin(a) <= st_zmax(b)) THEN
          RETURN true;
        END IF;
      END IF;
    END IF;
    
    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_thesame(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) = st_xmin(b) AND st_ymin(a) = st_ymin(b) AND st_zmin(a) = st_zmin(b) THEN
      IF st_xmax(a) = st_xmax(b) AND st_ymax(a) = st_ymax(b) AND st_zmax(a) = st_zmax(b) THEN
        RETURN true;
      END IF;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION contains(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(b) >= st_xmin(a) AND st_ymin(b) >= st_ymin(a) AND st_zmin(b) >= st_zmin(a) THEN
      IF st_xmax(b) <= st_xmax(a) AND st_ymax(b) <= st_ymax(a) AND st_zmax(b) <= st_zmax(a) THEN
        RETURN true;
      END IF;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_contained(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) >= st_xmin(b) AND st_ymin(a) >= st_ymin(b) AND st_zmin(a) >= st_zmin(b) THEN
      IF st_xmax(a) <= st_xmax(b) AND st_ymax(a) <= st_ymax(b) AND st_zmax(a) <= st_zmax(b) THEN
        RETURN true;
      END IF;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_below(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_zmax(a) < st_zmin(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overbelow(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_zmax(a) <= st_zmin(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_overabove(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_zmin(a) >= st_zmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_above(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_zmin(a) > st_zmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

---------------------------------------------------------
-- the following functions has no physical sense, just --
-- because are required by support functions of BRINs  --
---------------------------------------------------------
CREATE OR REPLACE FUNCTION is_less(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmax(a) < st_xmin(b) AND st_ymax(a) < st_ymin(b) AND st_zmax(a) < st_zmin(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_lessorequal(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmax(a) <= st_xmin(b) AND st_ymax(a) <= st_ymin(b) AND st_zmax(a) <= st_zmin(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greater(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) > st_xmax(b) AND st_ymin(a) > st_ymax(b) AND st_zmin(a) > st_zmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION is_greaterorequal(a box3d, b box3d)
RETURNS boolean AS
$$
  BEGIN
    IF st_xmin(a) >= st_xmax(b) AND st_ymin(a) >= st_ymax(b) AND st_zmin(a) >= st_zmax(b) THEN
      RETURN true;
    END IF;

    RETURN false;
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION merge(a box3d, b box3d)
RETURNS box3d AS
$$
  DECLARE
    xmin double precision := st_xmin(a);
    ymin double precision := st_ymin(a);
    zmin double precision := st_zmin(a);
    xmax double precision := st_xmax(a);
    ymax double precision := st_ymax(a);
    zmax double precision := st_zmax(a);
  BEGIN
    IF xmin > st_xmin(b) THEN
      xmin := st_xmin(b);
    END IF;
    IF ymin > st_ymin(b) THEN
      ymin := st_ymin(b);
    END IF;
    IF zmin > st_zmin(b) THEN
      zmin := st_zmin(b);
    END IF;
    IF xmax < st_xmax(b) THEN
      xmax := st_xmax(b);
    END IF;
    IF ymax < st_ymax(b) THEN
      ymax := st_ymax(b);
    END IF;
    IF zmax < st_zmax(b) THEN
      zmax := st_zmax(b);
    END IF;

    RETURN st_3dmakebox(st_makepoint(xmin, ymin, zmin), st_makepoint(xmax, ymax, zmax));
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OR REPLACE FUNCTION isempty(a box3d)
RETURNS boolean AS
$$
  BEGIN
    RETURN st_isempty(a::geometry);
  END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

-------------------
-- Create operators
-------------------

CREATE OPERATOR &< (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overleft,
  COMMUTATOR = << ,
  NEGATOR    = >>
);

CREATE OPERATOR &> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overright,
  COMMUTATOR = >> ,
  NEGATOR    = <<
);

CREATE OPERATOR << (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_left,
  COMMUTATOR = &< ,
  NEGATOR    = >>
);

CREATE OPERATOR >> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_right,
  COMMUTATOR = &> ,
  NEGATOR    = <<
);

CREATE OPERATOR &&& (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = intersects ,
  COMMUTATOR = &&&
);

CREATE OPERATOR ~= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_thesame,
  COMMUTATOR = ~=
);

CREATE OPERATOR ~ (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = contains,
  COMMUTATOR = ~
);

CREATE OPERATOR @ (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_contained,
  COMMUTATOR = @
);

CREATE OPERATOR <<| (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_below,
  COMMUTATOR = &<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR &<| (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overbelow,
  COMMUTATOR = <<| ,
  NEGATOR    = |>>
);

CREATE OPERATOR |&> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_overabove,
  COMMUTATOR = |>> ,
  NEGATOR    = <<|
);

CREATE OPERATOR |>> (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_above,
  COMMUTATOR = |&> ,
  NEGATOR    = <<|
);

CREATE OPERATOR < (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_less,
  COMMUTATOR = <= ,
  NEGATOR    = >
);

CREATE OPERATOR <= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_lessorequal,
  COMMUTATOR = < ,
  NEGATOR    = >
);

CREATE OPERATOR > (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greater,
  COMMUTATOR = >= ,
  NEGATOR    = <
);

CREATE OPERATOR >= (
  LEFTARG    = box3d ,
  RIGHTARG   = box3d ,
  PROCEDURE  = is_greaterorequal,
  COMMUTATOR = > ,
  NEGATOR    = <
);

-------------------------
-- Create operator class
-------------------------

CREATE OPERATOR CLASS brin_geometry_inclusion_ops_box3d
       FOR TYPE box3d USING brin AS
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
  FUNCTION        11       merge(box3d, box3d) ,
  FUNCTION        13       contains(box3d, box3d) ,
  FUNCTION        14       isempty(box3d) ;
