-- Cache table for scanned products
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  barcode VARCHAR(50) UNIQUE NOT NULL,
  name VARCHAR(255),
  material VARCHAR(100),
  category VARCHAR(100),
  recyclable BOOLEAN,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Geolocated collection points table
CREATE TABLE IF NOT EXISTS collection_points (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(100),
  address TEXT,
  city VARCHAR(255),
  insee_code CHAR(5),
  location GEOMETRY(Point, 4326),
  opening_hours TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Spatial index on location (required for proximity queries)
CREATE INDEX IF NOT EXISTS idx_collection_points_location
  ON collection_points USING GIST(location);

-- Sorting rules per city table
CREATE TABLE IF NOT EXISTS city_sorting_rules (
  id SERIAL PRIMARY KEY,
  insee_code CHAR(5) UNIQUE NOT NULL,
  city_name VARCHAR(255),
  all_plastics_allowed BOOLEAN DEFAULT FALSE,
  dedicated_biowaste_bin BOOLEAN DEFAULT FALSE,
  recycling_bin_color VARCHAR(20) DEFAULT 'yellow',
  notes TEXT,
  updated_at TIMESTAMP DEFAULT NOW()
);