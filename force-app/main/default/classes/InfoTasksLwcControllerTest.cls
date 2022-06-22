@isTest
public with sharing class InfoTasksLwcControllerTest {
  @IsTest
  static void getAllTasksForSelectedUser() {
    String targetUser = UserInfo.getUserId();
    Test.startTest();
    List<Task> taskListExpected = [
      SELECT
        Id,
        OwnerId,
        Priority,
        ActivityDate,
        Description,
        Status,
        UserCreated__c,
        DateCreated__c,
        UserIdCreated__c
      FROM Task
      WHERE OwnerId = :targetUser
      WITH SECURITY_ENFORCED
    ];
    Map<ID, Task> taskMapExpected = new Map<ID, Task>(taskListExpected);

    List<Task> taskListActual = InfoTasksLwcController.getFilteredTasks(
      'all',
      '0057Q000002RG1XQAW'
    );
    Map<ID, Task> taskMapActual = new Map<ID, Task>(taskListActual);

    Test.stopTest();

    System.assertEquals(taskMapExpected, taskMapActual);
  }
  static void getAllTasksFilteredByOwner() {
    String targetUser = UserInfo.getUserId();
    Test.startTest();
    List<Task> taskListExpected = [
      SELECT
        Id,
        OwnerId,
        Priority,
        ActivityDate,
        Description,
        Status,
        UserCreated__c,
        DateCreated__c,
        UserIdCreated__c
      FROM Task
      WHERE OwnerId = :targetUser
      WITH SECURITY_ENFORCED
    ];
    Map<ID, Task> taskMapExpected = new Map<ID, Task>(taskListExpected);

    List<Task> taskListActual = InfoTasksLwcController.getFilteredTasks(
      'all',
      '0057Q000002RG1XQAW'
    );
    Map<ID, Task> taskMapActual = new Map<ID, Task>(taskListActual);
    Test.stopTest();

    System.assertEquals(taskMapExpected, taskMapActual);
  }
  @isTest
  static void getFilteredByOwnerAndDateTasksForSelectedUser() {
    String targetUser = UserInfo.getUserId();
    String filter = 'TODAY';
    Date dateFilter = Date.today();
    Test.startTest();
    List<Task> taskListExpected = [
      SELECT
        Id,
        OwnerId,
        Priority,
        ActivityDate,
        Description,
        Status,
        UserCreated__c,
        DateCreated__c,
        UserIdCreated__c
      FROM Task
      WHERE OwnerId = '0057Q000002RG1XQAW' AND DateCreated__c = :dateFilter
    ];
    Map<ID, Task> taskMapExpected = new Map<ID, Task>(taskListExpected);

    List<Task> taskListActual = InfoTasksLwcController.getFilteredTasks(
      filter,
      '0057Q000002RG1XQAW'
    );
    Map<ID, Task> taskMapActual = new Map<ID, Task>(taskListActual);
    Test.stopTest();

    System.assertEquals(taskMapExpected, taskMapActual);
  }
}
