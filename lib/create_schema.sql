/* 
  database setup script for faf-unit-converter
*/
drop schema if exists faf_units;
create schema faf_units;

drop table if exists faf_units.units;
create table faf_units.units (
  "patch" integer not null,
  "blueprint_id" character varying not null,
  "faction" character varying not null,
  "arena" character varying not null,
  "tech" integer not null,
  "type" character varying not null,
  "name" character varying default null,
  constraint pk_units primary key ("patch", "blueprint_id")
);