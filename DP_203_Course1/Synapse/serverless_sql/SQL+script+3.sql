SELECT
*
FROM
OPENROWSET(
    BULK 'https://gen2storageaccount257.dfs.core.windows.net/synapsecontainer/Data/NYCTripSmall.parquet',
    FORMAT = 'PARQUET'
) AS [result]

