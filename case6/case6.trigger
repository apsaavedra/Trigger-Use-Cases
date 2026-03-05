trigger LeadTrigger on Lead (before update, after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert) {
        //When a Lead record is created, create a Task for the Lead Owner to follow up with the Customer
        LeadTriggerHandler.handleActivitiesAfterInsert(Trigger.NEW);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore) {
        //Whenever a Lead is updated and Industry is Healthcare, set Lead Source, SIC Code and Primary
        for(Lead leadRecord : Trigger.NEW) {
            leadRecord.Status = 'Working-Contacted'; //Use Case 2
            if(leadRecord.Industry == 'Healthcare') { //Use Case 4
                leadRecord.LeadSource = 'Purchased List';
                leadRecord.SICCode__c = '1100';
                leadRecord.Primary__c = 'Yes';
            }
        }
    }
    
}
