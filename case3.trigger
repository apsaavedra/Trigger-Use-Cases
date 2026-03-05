trigger CaseTrigger on Case (before insert) {
  //Whenever a Case is created & Case Origin is Phone, Set Priority as High, else set Priority as Low
    
    if(Trigger.isInsert && Trigger.isBefore) {
        for(Case caseRecord : Trigger.NEW) {
            if(caseRecord.Origin == 'Phone') {
                caseRecord.Priority = 'High';
                } else {
                    caseRecord.Priority = 'Low';
                }
        }
    }

}
