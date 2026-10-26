-- Feature Engineering
CREATE OR REPLACE TABLE `is429-bda-cl-valerie-kurniawan.00000108382.property_feature` AS
SELECT 
    Bedroom2, 
    Bathroom, 
    Car, 
    Landsize, 
    BuildingArea, 
    Distance,
    Lattitude,
    Longtitude,
    YearBuilt,
    Price
FROM 
    `is429-bda-cl-valerie-kurniawan.00000108382.property`;



--Data Cleaning
CREATE OR REPLACE TABLE `is429-bda-cl-valerie-kurniawan.00000108382.property_feature` AS
SELECT * FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
WHERE 
    Bedroom2 IS NOT NULL AND 
    Bathroom IS NOT NULL AND 
    Car IS NOT NULL AND 
    Landsize IS NOT NULL AND 
    BuildingArea IS NOT NULL AND 
    Distance IS NOT NULL AND 
    Lattitude IS NOT NULL AND 
    Longtitude IS NOT NULL AND 
    YearBuilt IS NOT NULL AND 
    Price IS NOT NULL;



-- EDA
-- Kamar Tidur (Bedroom2)
SELECT
  Bedroom2 AS Bedroom,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY Bedroom2
ORDER BY total_properti;

-- Kamar Mandi (Bathroom)
SELECT
  Bathroom,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY Bathroom
ORDER BY total_properti;

-- Garasi (Car)
SELECT
  Car,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY Car
ORDER BY total_properti;

-- Landsize
SELECT
  CASE
    WHEN Landsize < 200 THEN '(1) <200'
    WHEN Landsize BETWEEN 200 AND 500 THEN '(2) 200 - 500'
    WHEN Landsize BETWEEN 501 AND 800 THEN '(3) 501 - 800'
    ELSE '(3) >800'
  END AS landsize_range,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY landsize_range
ORDER BY landsize_range;

-- Building Area
SELECT
  CASE
    WHEN BuildingArea BETWEEN 1 AND 30 THEN '(1) 1-30'
    WHEN BuildingArea BETWEEN 31 AND 60 THEN '(2) 31-60'
    WHEN BuildingArea BETWEEN 61 AND 90 THEN '(3) 61-90'
    WHEN BuildingArea BETWEEN 91 AND 120 THEN '(4) 91-120'
    WHEN BuildingArea BETWEEN 121 AND 150 THEN '(5) 121-150'
    WHEN BuildingArea BETWEEN 151 AND 180 THEN '(6) 151-180'
    WHEN BuildingArea BETWEEN 181 AND 200 THEN '(7) 181-200'
    ELSE '(8) >200'
  END AS buildingarea_range,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY buildingarea_range
ORDER BY buildingarea_range;

-- Distance
SELECT
  CASE
    WHEN Distance < 5 THEN '(1) < 5 km'
    WHEN Distance BETWEEN 5 AND 10 THEN '(2) 5-10 km'
    WHEN Distance BETWEEN 10.1 AND 15 THEN '(3) 10-15 km'
    WHEN Distance BETWEEN 15.1 AND 20 THEN '(4) 15-20 km'
    ELSE '(5) > 20 km'
  END AS distance_range,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY distance_range
ORDER BY distance_range;

-- Latitude (Lintang)
SELECT
  CASE
    WHEN Lattitude > 0 THEN 'Belahan Bumi Utara (0 ke 90)'
    WHEN Lattitude < 0 THEN 'Belahan Bumi Selatan (0 ke -90)'
    ELSE 'Khatulistiwa (Ekuator)'
  END AS zona_lintang_global,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY zona_lintang_global
ORDER BY total_properti;

-- Longitude (Bujur)
SELECT
  CASE
    WHEN Longtitude > 0 THEN 'Belahan Bumi Timur (0 ke 180)'
    WHEN Longtitude < 0 THEN 'Belahan Bumi Barat (0 ke -180)'
    ELSE 'Garis Meridian Utama'
  END AS zona_bujur_global,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY zona_bujur_global
ORDER BY total_properti;

-- YearBuilt
SELECT
  CASE
    WHEN YearBuilt < 1900 THEN '1900 Sebelum'
    WHEN YearBuilt BETWEEN 1900 AND 1909 THEN '1900s'
    WHEN YearBuilt BETWEEN 1910 AND 1919 THEN '1910s'
    WHEN YearBuilt BETWEEN 1920 AND 1929 THEN '1920s'
    WHEN YearBuilt BETWEEN 1930 AND 1939 THEN '1930s'
    WHEN YearBuilt BETWEEN 1940 AND 1949 THEN '1940s'
    WHEN YearBuilt BETWEEN 1950 AND 1959 THEN '1950s'
    WHEN YearBuilt BETWEEN 1960 AND 1969 THEN '1960s'
    WHEN YearBuilt BETWEEN 1970 AND 1979 THEN '1970s'
    WHEN YearBuilt BETWEEN 1980 AND 1989 THEN '1980s'
    WHEN YearBuilt BETWEEN 1990 AND 1999 THEN '1990s'
    WHEN YearBuilt BETWEEN 2000 AND 2009 THEN '2000s'
    WHEN YearBuilt BETWEEN 2010 AND 2018 THEN '2010s'
    ELSE 'Unknown'
  END AS decade_built,
  COUNT(*) AS total_properti,
  AVG(Price) AS rata_rata_harga
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
GROUP BY decade_built
ORDER BY decade_built;



-- MODELLING
-- Data Splitting
CREATE OR REPLACE TABLE `is429-bda-cl-valerie-kurniawan.00000108382.property_feature` AS
SELECT *,
  CASE
    WHEN RAND() < 0.8 THEN 'TRAIN'
    ELSE 'TEST'
  END AS data_split
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`;

-- Linear Regression 
SELECT
  Price AS actual_price,
  predicted_Price AS predicted_price
FROM
  ML.PREDICT(
    MODEL `is429-bda-cl-valerie-kurniawan.00000108382.linear_regression`,
    (
      SELECT *
      FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
      WHERE data_split = 'TEST'
    )
  );


-- Boosted Tree Regressor
SELECT
  Price AS actual_price,
  predicted_Price AS predicted_price
FROM
  ML.PREDICT(
    MODEL `is429-bda-cl-valerie-kurniawan.00000108382.boosted_tree_regressor`,
    (
      SELECT *
      FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
      WHERE data_split = 'TEST'
    )
  );



-- Evaluation
-- Train data Linear Regression
CREATE MODEL `is429-bda-cl-valerie-kurniawan.00000108382.linear_regression`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['Price']
) AS
SELECT *
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
WHERE data_split = 'TRAIN';

-- Test Data Linear Regression
SELECT
  *
FROM
  ML.EVALUATE(
    MODEL `is429-bda-cl-valerie-kurniawan.00000108382.linear_regression`,
    (
      SELECT *
      FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
      WHERE data_split = 'TEST'
    )
  );



-- Train data Boosted Tree
CREATE MODEL `is429-bda-cl-valerie-kurniawan.00000108382.boosted_tree_regressor`
OPTIONS(
  model_type = 'BOOSTED_TREE_REGRESSOR',
  input_label_cols = ['Price']
) AS
SELECT * EXCEPT(data_split)
FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
WHERE data_split = 'TRAIN';

-- Test Data Boosted Tree
SELECT
  *
FROM
  ML.EVALUATE(
    MODEL `is429-bda-cl-valerie-kurniawan.00000108382.boosted_tree_regressor`,
    (
      SELECT *
      FROM `is429-bda-cl-valerie-kurniawan.00000108382.property_feature`
      WHERE data_split = 'TEST'
    )
  );
