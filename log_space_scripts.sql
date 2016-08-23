
-- SELECT file_id, name, type_desc, physical_name, size, max_size
-- FROM sys.database_files ;

-- dbcc sqlperf(logspace);

-- SELECT RTRIM(instance_name) + ' (used in kb)', cntr_value
-- FROM sys.dm_os_performance_counters 
-- WHERE counter_name = 'Log File(s) Used Size (KB)'
-- AND instance_name != '_Total'
