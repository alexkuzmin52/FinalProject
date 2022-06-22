import { LightningElement, api, track } from "lwc";
import createNotification from "@salesforce/apex/CreatedTaskNotificationController.createNotification";
export default class CreatedTaskNotification extends LightningElement {
  @api recipient;
  @api targetId;
  @api isSend = false;

  @track body;
  @track isUser = true;
  @track title;

  onChangeTitle(event) {
    this.title = event.target.value;
  }
  onChangeBody(event) {
    this.body = event.target.value;
  }

  handleOnCancel() {
    this.dispatchEvent(new CustomEvent("makeinvisible"));
  }

  onSend() {
    createNotification({
      recipient: this.recipient,
      targetId: this.targetId,
      title: this.title,
      body: this.body
    });

    this.dispatchEvent(new CustomEvent("makeinvisible"));
  }
}
