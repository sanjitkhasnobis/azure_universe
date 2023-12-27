SELECT passenger_count as PassengerCount,
      SUM(trip_distance) as SumTripDistance_miles,
      AVG(trip_distance) as AvgTripDistance_miles
INTO dbo.PassengerCountStats
FROM  dbo.NYCTaxiTripSmall
WHERE trip_distance > 0 AND passenger_count > 0
GROUP BY passenger_count;

SELECT * FROM dbo.PassengerCountStats