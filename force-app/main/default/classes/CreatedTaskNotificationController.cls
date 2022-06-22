public with sharing class CreatedTaskNotificationController {
  @AuraEnabled
  public static void createNotification(
    String recipient,
    String targetId,
    String title,
    String body
  ) {
    CustomNotificationType notificationType = [
      SELECT Id, customNotifTypeName
      FROM CustomNotificationType
      WHERE customNotifTypeName LIKE 'Created_new_task_notification'
    ];

    Messaging.CustomNotification notification = new Messaging.CustomNotification();

    notification.setTitle(title);
    notification.setBody(body);
    notification.setNotificationTypeId(notificationType.Id);
    notification.setTargetId(targetId);

    try {
      notification.send(new Set<String>{ recipient });
    } catch (Exception e) {
      System.debug('Problem sending notification: ' + e.getMessage());
    }
  }
}
