@isTest
public with sharing class UserComboboxLwcControllerTest {
  @IsTest
  static void testGetAllUsers() {
    Test.startTest();
    List<User> usersExpected = [SELECT Name FROM User WITH SECURITY_ENFORCED];
    Map<ID, User> mapUsersExpected = new Map<ID, User>(usersExpected);

    List<User> usersActual = UserComboboxLwcController.getAllUsers();
    Map<ID, User> mapUsersActual = new Map<ID, User>(usersActual);
    Test.stopTest();

    System.assertEquals(mapUsersExpected, mapUsersActual);
  }
}
