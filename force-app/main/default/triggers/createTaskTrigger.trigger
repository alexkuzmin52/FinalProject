trigger createTaskTrigger on Task(before insert) {
  System.TriggerOperation trop = Trigger.operationType;
  String uName = UserInfo.getUserName();
  TaskTriggerHandler.handleTaskTrigger(Trigger.new, Trigger.old, trop);
}
