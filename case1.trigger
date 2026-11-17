trigger TaskTrigger on Task (before insert) {
    //Case: When a task is created, the priority should be set to High

    if(Trigger.isInsert && Trigger.isBefore) {
        for(Task taskRecord : Trigger.NEW) {
            //Insert only has trigger.new
            //For every task that is trigger.new, do the following
            //No DML needed as it's in the before insert context
            taskRecord.Priority = 'High';
        }
    }
}
