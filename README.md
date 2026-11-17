# Trigger-Use-Cases
Trigger use cases exercises from Salesforce Makes Sense Youtube channel

# Before Triggers
Used to update additional values to the records or validate them before they are saved in the database.
Use before triggers whenever you want to set some additional values to the record that's getting saved or if you want to validate and avoid bad data in the system and throw some errors to the end user.

# After Triggers
Used to update related or unrelated records and do any kind of post-processing after the record is saved to the database.
User after triggers when you want to do any kind of DML operations on related records or unrelated records. It could also be any kind of post-processing logic, like firing platform events, invoking flows, sending out emails, calling third-party systems, etc.

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
//change is saved
if (Trigger.isAfter) {
 //re-updating or modifying the record is not allowed
 //but you can modified information of a child, like a case
}

# Order of execution
* Execute before records triggered flows
* Execute all before triggers
* Execute duplicate rules
* Save records to database, not committed yet
* Execute all after triggers
* Execute assignments and auto-response rules
* Execute escalation rules
* Execute process and flows (no guaranteed order of execution)
* Execute record triggered flows after records save
* Execute entitlement rules
* If record contains roll up/cross object reference, parent is updated
* Execute criteria based sharing
* Commit to database
* Execute post commit logic (send emails, sync jobs, etc)

# Event vs Context grid
_Before Insert_
 * Trigger.NEW: YES
 * Trigger.OLD: NO

_Before Update_
 * Trigger.NEW: YES
 * Trigger.OLD: YES

_Before Delete_
 * Trigger.NEW: NO
 * Trigger.OLD: YES

_After Insert_
 * Trigger.NEW: YES
 * Trigger.OLD: NO

_After Update_
 * Trigger.NEW: YES
 * Trigger.OLD: YES

_After Delete_
 * Trigger.NEW: NO
 * Trigger.OLD: YES

_After Undelete_
 * Trigger.NEW: YES
 * Trigger.OLD: NO

