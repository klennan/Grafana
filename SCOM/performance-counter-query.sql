 SELECT   
 vPerf.DateTime,  
 vPerf.SampleCount,   
 vPerf.AverageValue,  
 vPerf.MinValue,  
 vPerf.MaxValue,  
 vPerf.StandardDeviation,   
 vPerformanceRuleInstance.InstanceName,   
 vManagedEntity.Path,   
 vPerformanceRule.ObjectName,   
  vPerformanceRule.CounterName  
 FROM OperationsManagerDW.Perf.vPerfHourly AS vPerf INNER JOIN  
  OperationsManagerDW.dbo.vPerformanceRuleInstance ON OperationsManagerDW.dbo.vPerformanceRuleInstance.PerformanceRuleInstanceRowId = vPerf.PerformanceRuleInstanceRowId INNER JOIN  
  OperationsManagerDW.dbo.vManagedEntity ON vPerf.ManagedEntityRowId = OperationsManagerDW.dbo.vManagedEntity.ManagedEntityRowId INNER JOIN  
  OperationsManagerDW.dbo.vPerformanceRule ON OperationsManagerDW.dbo.vPerformanceRuleInstance.RuleRowId = OperationsManagerDW.dbo.vPerformanceRule.RuleRowId   
 WHERE   
 vManagedEntity.Path like '[[Server]]'  
 and vPerf.DateTime > getdate()
 order by [DateTime] desc
