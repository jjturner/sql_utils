use ReportServer
go
SELECT COUNT(Name) AS ExecutionCount,
       Name,
	   max(timestart) as LastRunDate,
	   max(datediff(MINUTE,TimeEnd,TimeStart)) as LongestRunTime,
       SUM(TimeDataRetrieval) AS TimeDataRetrievalSum,
       SUM(TimeProcessing) AS TimeProcessingSum,
       SUM(TimeRendering) AS TimeRenderingSum,
       SUM(ByteCount) AS ByteCountSum,
       SUM([RowCount]) AS RowCountSum
  FROM (SELECT TimeStart,
			   TimeEnd,
               Catalog.Type,
               Catalog.Name,
               TimeDataRetrieval,
               TimeProcessing,
               TimeRendering,
               ByteCount,
               [RowCount]
          FROM Catalog
               INNER JOIN 
               ExecutionLog
                 ON Catalog.ItemID = ExecutionLog.ReportID
         WHERE Type = 2
       ) AS RE
GROUP BY Name
ORDER BY COUNT(Name) DESC,
         Name;
