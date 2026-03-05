trigger LeadTrigger on Lead (before update) {
//When a Lead record is updated, set the Lead Status to Working-Contacted

    if(Trigger.isUpdate && Trigger.isBefore) {
        for(Lead leadRecord : Trigger.NEW) {
            leadRecord.Status = 'Working-Contacted';
        }
    }
}
