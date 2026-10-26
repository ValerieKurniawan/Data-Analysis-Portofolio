-- Taks-1 Retrieving Rows by Using SELECT 
SELECT
  regionname AS region_area,
  suburb AS local_area,
  address AS property_address,
  type AS property_type,
  method AS sale_method,
  price AS sale_price,
  sellerG AS seller_agent
FROM 
  `is429bda-valeriekurniawan.property.tableOfProperty`;

-- Task-2 Filtering with WHERE
SELECT
  regionname AS region_area,
  suburb AS local_area,
  address AS property_address,
  type AS property_type,
  method AS sale_method,
  price AS sale_price,
  sellerG AS seller_agent
FROM 
  `is429bda-valeriekurniawan.property.tableOfProperty`
WHERE 
  price > 500000;

-- Taks-3 Counting Records by Using COUNT 
SELECT 
  suburb AS local_area,
  COUNT(*) AS total_properties
FROM 
  `is429bda-valeriekurniawan.property.tableOfProperty`
GROUP BY 
  suburb
ORDER BY 
  total_properties DESC;


-- Task-4 Filtering Grouped Items by Using HAVING
SELECT 
  suburb AS local_area,
  AVG(price) AS average_price,
  COUNT(*) AS total_properties
FROM 
  `is429bda-valeriekurniawan.property.tableOfProperty`
GROUP BY 
  suburb
HAVING 
  AVG(price) > 500000;

-- Taks-4, Subselects
SELECT 
  suburb AS local_area,
  address AS property_address,
  price AS sale_price
FROM 
  `is429bda-valeriekurniawan.property.tableOfProperty`
WHERE 
  price > (
    SELECT AVG(price)
    FROM `is429bda-valeriekurniawan.property.tableOfProperty`
  )
ORDER BY 
  price DESC;



