public with sharing class InfoTasksLwcController {
  @AuraEnabled
  public static List<Task> getFilteredTasks(String filter, String owner) {
    try {
      String baseFilter = ' AND DateCreated__c = ';
      String targetUser = owner;
      String queryString =
        'SELECT Id, OwnerId, Priority, ActivityDate,' +
        ' Description, Status, UserCreated__c, DateCreated__c,' +
        ' CreatedById FROM Task WHERE OwnerId= :targetUser';

      if (filter != 'all') {
        queryString = queryString + baseFilter + filter;
      }

      List<Task> taskList = DataBase.query(queryString);
      return taskList;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
