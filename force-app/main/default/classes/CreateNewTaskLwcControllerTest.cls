@isTest
public with sharing class CreateNewTaskLwcControllerTest {
  @isTest
  static void testCreateNewTask() {
    DateTime myDateTime = DateTime.now();
    String subject_test = String.valueOf(myDateTime);
    String description_test = 'test description';
    String priority_test = 'Normal';
    String type_test = 'Meeting';
    String owner_test = '0057Q000002RG1XQAW';

    CreateNewTaskLwcController.saveTask(
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
    ];

    System.assertEquals(1, tskList.size());
  }
}
