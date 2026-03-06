public class AccountTriggerHandler {
	
    public static void handlePrivateOwnershipInAccount(List<Account> newAccountsList, Map<Id, Account> oldAccountList) {
        
        for(Account accRecord : newAccountsList) {
            if(accRecord.Industry == 'Agriculture' && accRecord.Type == 'Prospect') {
                if((oldAccountList.get(accRecord.Id).Ownership != accRecord.Ownership) && accRecord.Ownership == 'Private') {
                    accRecord.addError('Ownership cannot be private');
                }
            }
        }
    }
}
