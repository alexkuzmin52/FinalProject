@isTest
public with sharing class QuickCreateTaskLwcControllerTest {
  @isTest
  static void testCreateTaskQuickCreateTaskLwcControllerTest() {
    DateTime myDateTime = DateTime.now();
    String subject_test = String.valueOf(myDateTime);
    String description_test = 'test description';
    String priority_test = 'Normal';
    String type_test = 'Meeting';
    String owner_test = '0057Q000002RG1XQAW';

    QuickCreateTaskLwcController.saveTask(
      subject_test,
      description_test,
      priority_test,
      type_test,
      owner_test
    );
    List<Task> tskList = [
      SELECT iD, Subject
      FROM Task
      WHERE Subject = :subject_test
      WITH SECURITY_ENFORCED
    ];

    System.assertEquals(1, tskList.size());
  }

  @isTest
  static void testUsersQuickCreateTaskLwcControllerTest() {
    List<User> usrList = [SELECT Id, Name FROM User];
    Map<Id, User> usrMap = new Map<Id, User>(usrList);

    List<User> usrTest = QuickCreateTaskLwcController.getUsers();
    Map<Id, User> usrTestMap = new Map<Id, User>(usrTest);

    System.assert(usrMap == usrTestMap);
  }
}
