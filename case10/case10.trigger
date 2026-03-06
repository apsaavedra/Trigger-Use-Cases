trigger AccountTrigger on Account (before update, after update) {
	
    if(Trigger.isBefore && Trigger.isUpdate) {
        //If an Account is updated and Ownership is set to Private, do not allow user to save the record
        AccountTriggerHandler.handlePrivateOwnershipInAccount(Trigger.NEW, Trigger.oldMap); //Use Case 9
    }
    
    if(Trigger.isAfter && Trigger.isUpdate) {
        //Every time an account website is updated, update the website field on all its child contacts
        AccountTriggerHandler.handleWebsiteFieldInContact(Trigger.NEW, Trigger.oldMap); //Use Case 10
    }
}
