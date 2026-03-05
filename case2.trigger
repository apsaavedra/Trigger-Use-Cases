trigger LeadTrigger on Lead (before update) {

    if(Trigger.isUpdate && Trigger.isBefore) {
        for(Lead leadRecord : Trigger.NEW) {
            leadRecord.Status = 'Working-Contacted';
        }
    }
}
