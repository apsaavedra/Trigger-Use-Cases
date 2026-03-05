trigger OpportunityTrigger on Opportunity (before update, after update) {
    
    if(Trigger.isUpdate && Trigger.isBefore) {
        //When an Opportunity Stage is Modified, update Opportunity Amount
        OpportunityTriggerHandler.handleOppAmountBeforeUpdate(Trigger.NEW, Trigger.oldMap); //Use Case 7
    }
    
    if(Trigger.isUpdate && Trigger.isAfter) {
        //Whenever an Opportunity is Closed Won, create a Task for the Opportunity Owner to split revenue
        OpportunityTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW); //Use Case 5
    }
    
}
