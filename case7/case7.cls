public class OpportunityTriggerHandler {

    public static void handleOppAmountBeforeUpdate(List<Opportunity> newOppRecords, Map<Id, Opportunity> oldOppRecords) {
        
        for(Opportunity newOpp : newOppRecords) {
            If(oldOppRecords.get(newOpp.Id).StageName != newOpp.StageName) {
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;
            }
        }
    }
    
    public static void handleActivitiesAfterUpdate(List<Opportunity> newOpportunities) {
        List<Task> newTaskOpp = new List<Task>();
        
        for(Opportunity oppRecord : newOpportunities) {
            if(oppRecord.StageName == 'Closed Won') {
                Task taskRecord = New Task();
                taskRecord.OwnerId = oppRecord.OwnerId;
                taskRecord.Priority = 'High';
                taskRecord.Description = 'Split the revenue among the team';
                taskRecord.Status = 'Not Started';
                taskRecord.Subject = 'Split revenue';
                taskRecord.WhatId = oppRecord.Id;
                
                newTaskOpp.add(taskRecord);
            }
        }
        
        if (!newTaskOpp.isEmpty()) {
            insert newTaskOpp;
        }
    }
}
