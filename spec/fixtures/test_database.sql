-- Test graph via http://docs.pgrouting.org/dev/doc/src/developer/sampledata.html

CREATE TABLE edge_table (
  id serial,
  dir character varying,
  source integer,
  target integer,
  cost double precision,
  reverse_cost double precision,
  x1 double precision,
  y1 double precision,
  x2 double precision,
  y2 double precision,
  to_cost double precision,
  name character varying,
  facility character varying,
  rule text,
  the_geom geometry(Linestring)
);

CREATE TABLE vertex_table (
  id serial,
  x double precision,
  y double precision
);

INSERT INTO edge_table VALUES (1, 'B', 1, 2, 1, 1, 2, 0, 2, 1, NULL, NULL, 'Main Street', '',
  '010200000002000000000000000000004000000000000000000000000000000040000000000000F03F');
INSERT INTO edge_table VALUES (2, 'TF', 2, 3, -1, 1, 2, 1, 3, 1, NULL, NULL, 'Albemarle Road', '',
  '0102000000020000000000000000000040000000000000F03F0000000000000840000000000000F03F');
INSERT INTO edge_table VALUES (3, 'TF', 3, 4, -1, 1, 3, 1, 4, 1, NULL, NULL, 'Albemarle Road', '',
  '0102000000020000000000000000000840000000000000F03F0000000000001040000000000000F03F');
INSERT INTO edge_table VALUES (4, 'B', 2, 7, 1, 1, 2, 1, 2, 2, NULL, NULL, 'Main Street', '',
  '0102000000020000000000000000000040000000000000F03F00000000000000400000000000000040');
INSERT INTO edge_table VALUES (5, 'FT', 3, 8, 1, -1, 3, 1, 3, 2, NULL, NULL, 'Rugby Road', '',
  '0102000000020000000000000000000840000000000000F03F00000000000008400000000000000040');
INSERT INTO edge_table VALUES (6, 'B', 5, 6, 1, 1, 0, 2, 1, 2, NULL, NULL, 'Canal Street', '',
  '01020000000200000000000000000000000000000000000040000000000000F03F0000000000000040');
INSERT INTO edge_table VALUES (7, 'B', 6, 7, 1, 1, 1, 2, 2, 2, NULL, NULL, 'Canal Street', '',
  '010200000002000000000000000000F03F000000000000004000000000000000400000000000000040');
INSERT INTO edge_table VALUES (8, 'B', 7, 8, 1, 1, 2, 2, 3, 2, NULL, NULL, 'Canal Street', '',
  '0102000000020000000000000000000040000000000000004000000000000008400000000000000040');
INSERT INTO edge_table VALUES (9, 'B', 8, 9, 1, 1, 3, 2, 4, 2, NULL, NULL, 'Canal Street', '',
  '0102000000020000000000000000000840000000000000004000000000000010400000000000000040');
INSERT INTO edge_table VALUES (10, 'B', 7, 10, 1, 1, 2, 2, 2, 3, NULL, NULL, 'Main Street', '',
  '0102000000020000000000000000000040000000000000004000000000000000400000000000000840');
INSERT INTO edge_table VALUES (11, 'FT', 8, 11, 1, -1, 3, 2, 3, 3, NULL, NULL, 'Rugby Road', '',
  '0102000000020000000000000000000840000000000000004000000000000008400000000000000840');
INSERT INTO edge_table VALUES (12, 'FT', 10, 11, 1, -1, 2, 3, 3, 3, NULL, NULL, 'Church Avenue', '',
  '0102000000020000000000000000000040000000000000084000000000000008400000000000000840');
INSERT INTO edge_table VALUES (13, 'FT', 11, 12, 1, -1, 3, 3, 4, 3, NULL, NULL, 'Church Avenue', '',
  '0102000000020000000000000000000840000000000000084000000000000010400000000000000840');
INSERT INTO edge_table VALUES (14, 'B', 10, 13, 1, 1, 2, 3, 2, 4, NULL, NULL, 'Main Street', '',
  '0102000000020000000000000000000040000000000000084000000000000000400000000000001040');
INSERT INTO edge_table VALUES (15, 'B', 9, 12, 1, 1, 4, 2, 4, 3, NULL, NULL, 'Ocean Avenue', '',
  '0102000000020000000000000000001040000000000000004000000000000010400000000000000840');
INSERT INTO edge_table VALUES (16, 'B', 4, 9, 1, 1, 4, 1, 4, 2, NULL, NULL, 'Ocean Avenue', '',
  '0102000000020000000000000000001040000000000000F03F00000000000010400000000000000040');

INSERT INTO vertex_table VALUES
  (1,2,0), (2,2,1), (3,3,1), (4,4,1), (5,0,2), (6,1,2), (7,2,2),
  (8,3,2), (9,4,2), (10,2,3), (11,3,3), (12,4,3), (13,2,4);