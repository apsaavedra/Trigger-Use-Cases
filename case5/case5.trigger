trigger OpportunityTrigger on Opportunity (after update) {
    
    if(Trigger.isUpdate && Trigger.isAfter) {
        //Whenever an Opportunity is Closed Won, create a Task for the Opportunity Owner to split revenue
        OpportunityTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW); //Trigger.New gets send as parameter as it holds the records that need to be updated
    }
}
