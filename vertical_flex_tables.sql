/******  Drop table if exists ******/
DROP TABLE IF EXISTS csv_hello_world;

/******  Create Flex Table ******/
CREATE FLEX TABLE csv_hello_world();

/******  Compute the virtual columns (keys and values) from the flex table VMap data ******/
SELECT compute_flextable_keys('csv_hello_world');

/******  There is no csv data imported yet, so this will return 0 rows  ******/
SELECT * 
FROM csv_hello_world_keys;


/******  Import CSV into csv_hello_world  table ******/
COPY csv_hello_world 
FROM '/home/dbadmin/docker/data/SalesRecords.csv' PARSER fcsvparser();

/******  Re-compute virtual columns ******/
SELECT compute_flextable_keys('csv_hello_world');

/******  Check keys table again ******/
SELECT * 
FROM csv_hello_world_keys;

/******  __raw__ column stores loaded data ******/
SELECT *
FROM csv_hello_world;

/******  Query virtual columns explicitly to get values ******/
SELECT 
        "Region",
        "Country",
        "Item Type",
        "Sales Channel",
        "Order Priority",
        "Order Date",
        "Order ID",
        "Ship Date",
        "Units Sold",
        "Unit Price",
        "Unit Cost",
        "Total Revenue",
        "Total Cost",
        "Total Profit"
FROM csv_hello_world;


 
