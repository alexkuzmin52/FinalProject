public with sharing class CreateNewTaskLwcController {
  @AuraEnabled
  public static Task saveTask(
    String subject,
    Date activity,
    String description,
    String priority,
    String type,
    String owner
  ) {
    try {
      Task tsk = new Task();
      tsk.Subject = subject;
      tsk.Description = description;
      tsk.Priority = priority;
      tsk.Type = type;
      tsk.OwnerId = owner;
      tsk.ActivityDate = activity;

      insert tsk;
      return tsk;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
