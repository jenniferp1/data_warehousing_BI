-- Create a new table
CREATE TABLE IF NOT EXISTS cafe (
  id SERIAL PRIMARY KEY,        -- AUTO_INCREMENT integer, as primary key
  category cat_enum NOT NULL,   -- Use the enum type defined earlier
  name VARCHAR(50) NOT NULL,    -- Variable-length string of up to 50 characters
  price NUMERIC(5,2) NOT NULL,  -- 5 digits total, with 2 decimal places
  last_update DATE              -- 'YYYY-MM-DD'
);

-- Insert rows.
INSERT INTO cafe (category, name, price) VALUES
  ('coffee', 'Espresso', 3.19),
  ('coffee', 'Cappuccino', 3.29),
  ('coffee', 'Caffe Latte', 3.39),
  ('coffee', 'Caffe Mocha', 3.49),
  ('coffee', 'Brewed Coffee', 3.59),
  ('tea', 'Green Tea', 2.99),
  ('tea', 'Wulong Tea', 2.89);
  

-- Query (SELECT)
SELECT * FROM cafe;

