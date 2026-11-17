public class LeadTriggerHandler {

    public static void handleNoDeletingBeforeDelete(List<Lead> newLeads) {
        for (Lead leadRecord : newLeads) {
            if (leadRecord.Status == 'Working - Contacted') {
                leadRecord.addError('If Lead status is Working-contacted, it cannot be deleted');
            }
        }
    }
	
    public static void handleActivitiesAfterInsert(List<Lead> newLeads) {
        List<Task> newTaskLeadList = New List<Task>();
        
        for(Lead leadRecord : newLeads) {
            Task taskRecord = New Task();
            taskRecord.OwnerId = leadRecord.OwnerId;
            taskRecord.WhoId = leadRecord.Id; //WhoId is for objects that represent humans, like contacts and leads, and WhatId is for non-human ones, like opportunities
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
