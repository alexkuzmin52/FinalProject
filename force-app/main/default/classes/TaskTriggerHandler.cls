public with sharing class TaskTriggerHandler {
  public static void handleTaskTrigger(
    List<Task> newRecords,
    List<Task> oldRecords,
    System.TriggerOperation triggerEvent
  ) {
    switch on triggerEvent {
      when BEFORE_INSERT {
        for (Task tsk : newRecords) {
          tsk.UserCreated__c =
            UserInfo.getFirstName() +
            ' ' +
            UserInfo.getLastName();
          tsk.DateCreated__c = Date.today();

          System.debug(tsk.UserCreated__c);
          System.debug(tsk.DateCreated__c);
        }
      }
      when else {
        System.debug('System.TriggerOperation triggerEvent not found');
      }
    }
  }
}
