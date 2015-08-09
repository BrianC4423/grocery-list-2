-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

-- DROP TABLE IF EXISTS groceries;
DROP TABLE IF EXISTS grocery_list;

-- Define your schema here:

-- CREATE TABLE groceries (
--   <column definitions go here>
-- );
CREATE TABLE grocery_list(
  id SERIAL PRIMARY KEY,
  item VARCHAR (255) UNIQUE NOT NULL
)
