# Trigger-Use-Cases
Trigger use cases exercises from Salesforce Makes Sense Youtube channel

# Before Triggers
Used to update additional values to the records or validate them before they are saved in the database.

# After Triggers
Used to update related or unrelated records and do any kind of post-processing after the record is saved to the database.

# Syntax
trigger TriggerName on ObjectName (trigger_events) {
 code_block
}
// Database changes are automatically rollbacked if the trigger doesn't run successfully.
// Trigger events: Before insert, before update, before delete, after insert, after update, after delete, after undelete (only for some objets).
// Content variables (they come from System.Trigger class): isInsert, isUpdate, isDelete, New, Old, Size, isBefore, isAfter, isUndelete.

trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
  if (Trigger.isInsert) {
    // do insert activities here
    if (Trigger.isBefore) {
      //do before activities here
    } else {
      //do after activities here
    }
  } else if (Trigger.isUpdate) {
    // do update activities here
  }
}

Trigger.NEW -> holds the new information
Trigger.OLD -> holds the old information (Cannot hold any value if you're inserting the record, as there's no old information.)

//Available in the after context
Trigger.newMap -> key-value pair, where the key is the object ID and the value is the entire object
Trigger.oldMap -> key-value pair, where the key is the object ID and the value is the entire object

# Considerations
* You cannot use DML on Trigger.New and Trigger.Old variables
* Trigger.Old is always read only. No changes are allowed on top of it, because as the name says, it's the old information
* We can use Trigger.New in before context to update values, but no in the after context

//The object of the insert trigger can be modified before but not after, as the data is committed 
if (Trigger.isBefore) {
  contact.Address = 'Modified address';
}
//change is committed
if (Trigger.isAfter) {
 //re-updating or modifying the record is not allowed
 //but you can modified information of a child, like a case
}

# Order of execution

