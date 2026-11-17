public class AccountTriggerHandler {

    public static void handleContactCreationAfterInsert(List<Account> newAccountList) {
        List<Contact> consToAdd = new List<Contact>();
        
        for(Account accRecord : newAccountList) {
            if(accRecord.Create_N_Contacts__c != null) {
                for(Integer i = 0; i < acc.Create_N_Contacts__c; i++) {
                    Contact con = new Contact();
                    con.LastName = acc.Name + i;
                    con.AccountId = acc.Id;
                    consToAdd.add(con);
                }
            }
        }
                            
        if(!consToAdd.isEmpty()) {
            update consToAdd;
        }
    }
	
    public static void handlePrivateOwnershipInAccount(List<Account> newAccountsList, Map<Id, Account> oldAccountList) {     
        for(Account accRecord : newAccountsList) {
            if(accRecord.Industry == 'Agriculture' && accRecord.Type == 'Prospect') {
                if((oldAccountList.get(accRecord.Id).Ownership != accRecord.Ownership) && accRecord.Ownership == 'Private') {
                    accRecord.addError('Ownership cannot be private');
                }
            }
        }
    }
    
    public static void handleWebsiteFieldInContact(List<Account> newAccountsList, Map<Id, Account> oldAccountList) {
        Map<Id, String> addAccsToUpdateChildren = New Map<Id, String>();
        
        for(Account accRecord : newAccountsList) {
            if(oldAccountList.get(accRecord.Id).Website != accRecord.Website) {
                addAccsToUpdateChildren.put(accRecord.Id, accRecord.Website);
            }
        }
        
        if(addAccsToUpdateChildren.keySet().size() > 0) {
            List<Contact> consToUpdate = new List<Contact>();
            
            List<Contact> conRecords = [SELECT Id, FirstName, Website__c, AccountId FROM Contact WHERE AccountId IN :addAccsToUpdateChildren.keySet()];
            for(Contact con : conRecords) {
                con.Website__c = addAccsToUpdateChildren.get(con.AccountId);
                consToUpdate.add(con);
            }
            
            if(!consToUpdate.isEmpty()) {
                update consToUpdate;
            }
        }
    }
}
