IF NOT EXISTS (SELECT * FROM sys.objects O JOIN sys.schemas S ON O.schema_id = S.schema_id WHERE O.NAME = 'NYCTaxiTripSmall' AND O.TYPE = 'U' AND S.NAME = 'dbo')
CREATE TABLE dbo.NYCTaxiTripSmall
    (
    [VendorID] bigint, 
    [store_and_fwd_flag] nvarchar(1) NULL, 
    [RatecodeID] float NULL, 
    [PULocationID] bigint NULL,  
    [DOLocationID] bigint NULL, 
    [passenger_count] float NULL, 
    [trip_distance] float NULL, 
    [fare_amount] float NULL, 
    [extra] float NULL, 
    [mta_tax] float NULL, 
    [tip_amount] float NULL, 
    [tolls_amount] float NULL, 
    [ehail_fee] float NULL, 
    [improvement_surcharge] float NULL, 
    [total_amount] float NULL, 
    [payment_type] float NULL, 
    [trip_type] float NULL, 
    [congestion_surcharge] float  NULL
    )
WITH
    (
    DISTRIBUTION = ROUND_ROBIN,
     CLUSTERED COLUMNSTORE INDEX
     -- HEAP
    )
GO

COPY INTO dbo.NYCTaxiTripSmall
(VendorID 1, store_and_fwd_flag 4, RatecodeID 5,  PULocationID 6 , DOLocationID 7,  
 passenger_count 8,trip_distance 9, fare_amount 10, extra 11, mta_tax 12, tip_amount 13, 
 tolls_amount 14, ehail_fee 15, improvement_surcharge 16, total_amount 17, 
 payment_type 18, trip_type 19, congestion_surcharge 20 )
FROM 'https://gen2storageaccount258.dfs.core.windows.net/synapsecontainer/Data/NYCTripSmall.parquet'
WITH
(
    FILE_TYPE = 'PARQUET'
    ,MAXERRORS = 0
    ,IDENTITY_INSERT = 'OFF'
)

SELECT * FROM dbo.NYCTaxiTripSmall

SELECT COUNT(*) FROM dbo.NYCTaxiTripSmall