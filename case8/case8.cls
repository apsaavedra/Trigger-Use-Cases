public class ContactTriggerHandler {
	
    public static void handleNullAccountInContact(List<Contact> contactList) {
        for(Contact contactRecord : contactList) {
            if(contactRecord.AccountId == null) {
                contactRecord.addError('Contact cannot be saved without an Account');
            }
        }
    }
}
