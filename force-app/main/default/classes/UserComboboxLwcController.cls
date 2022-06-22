public with sharing class UserComboboxLwcController {
  @AuraEnabled(cacheable=true)
  public static List<User> getAllUsers() {
    return [SELECT Name FROM User WITH SECURITY_ENFORCED];
  }
}
