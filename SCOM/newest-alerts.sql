SELECT TOP 20 
  TimeRaised
  ,AlertStringName
  ,TicketId
  
  ,Category
  ,Owner
  ,CustomField1 as [Ticket Status]
  ,CustomField5 as [Assigned Group]
  ,CustomField6 as [Impact]
  ,CustomField6 as [Urgency]
FROM Alertview WITH (NOLOCK) 
WHERE Timeraised is not NULL and ResolutionState < 256 and (MonitoringObjectName like '%[[Server]]%' or MonitoringObjectPath like '%[[Server]]%')
ORDER BY [TimeRaised] desc
