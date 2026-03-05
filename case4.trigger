trigger LeadTrigger on Lead (before update) {
//Whenever a Lead is updated and Industry is Healthcare, set Lead Source, SIC Code and Primary
    
    if(Trigger.isUpdate && Trigger.isBefore) {
        for(Lead leadRecord : Trigger.NEW) {
            leadRecord.Status = 'Working-Contacted'; //From Use Case 2
            if(leadRecord.Industry == 'Healthcare') {
                leadRecord.LeadSource = 'Purchased List';
                leadRecord.SICCode__c = '1100';
                leadRecord.Primary__c = 'Yes';
            }
        }
    }
}
