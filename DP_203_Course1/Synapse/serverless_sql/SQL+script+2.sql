SELECT
dept, SUM(salary) AS TotalSalary
FROM 
OPENROWSET (
    BULK 'https://gen2storageaccount257.dfs.core.windows.net/synapsecontainer/Data/employee.csv',
    FORMAT = 'csv',
    HEADER_ROW = TRUE,
    PARSER_VERSION = '2.0'
) AS [result]

GROUP BY dept
