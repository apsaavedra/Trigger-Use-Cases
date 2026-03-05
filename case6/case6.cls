public class LeadTriggerHandler {
	
    public static void handleActivitiesAfterInsert(List<Lead> newLeads) {
        List<Task> newTaskLeadList = New List<Task>();
        
        for(Lead leadRecord : newLeads) {
            Task taskRecord = New Task();
            taskRecord.OwnerId = leadRecord.OwnerId;
            taskRecord.WhoId = leadRecord.Id;
            taskRecord.Status = 'Not Started';
            taskRecord.Description = 'Follow up with customer';
            taskRecord.Subject = 'Customer follow-up';
            taskRecord.Priority = 'High';
            
            newTaskLeadList.add(taskRecord);
        }
        
        if(!newTaskLeadList.isEmpty()) {
            insert newTaskLeadList;
        }
    }
}
