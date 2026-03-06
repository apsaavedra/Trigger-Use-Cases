trigger ContactTrigger on Contact (before insert) {
	
    if(Trigger.isBefore && Trigger.isInsert) {
        //If a Contact is created without a parent Account, do not allow user to create the contact record
        ContactTriggerHandler.handleNullAccountInContact(Trigger.NEW); //Use Case 8
        
    }
}
