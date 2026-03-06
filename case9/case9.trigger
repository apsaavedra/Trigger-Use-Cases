trigger AccountTrigger on Account (before update) {
	
    if(Trigger.isBefore && Trigger.isUpdate) {
        //If an Account is updated and Ownership is set to Private, do not allow user to save the record
        AccountTriggerHandler.handlePrivateOwnershipInAccount(Trigger.NEW, Trigger.oldMap); //Use Case 9
    }
}
