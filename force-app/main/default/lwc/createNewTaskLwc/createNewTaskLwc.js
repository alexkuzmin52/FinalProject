import { LightningElement, track } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import currentUserId from "@salesforce/user/Id";
import saveTask from "@salesforce/apex/CreateNewTaskLwcController.saveTask";
//import getUsers from '@salesforce/apex/QuickCreateTaskLwcController.getUsers';

export default class CreateNewTaskLwc extends LightningElement {
  @track type;
  @track subject;
  @track description;
  @track priority;
  @track owner = currentUserId;

  @track error;

  @track users;
  @track userOptions = [];
  isVisiableUser = true;

  isVisibleNotification = false;

  get subjectPickListValues() {
    return [
      { label: "Call", value: "Call" },
      { label: "Email", value: "Email" },
      { label: "Send Lette", value: "Send Lette" },
      { label: "Send Quote", value: "Send Quote" },
      { label: "Other", value: "Other" }
    ];
  }

  get typePickListValues() {
    return [
      { label: "Call", value: "Call" },
      { label: "Meeting", value: "Meeting" },
      { label: "Email", value: "Email" },
      { label: "Other", value: "Other" }
    ];
  }

  get priorityPickListValues() {
    return [
      { label: "Normal", value: "Normal" },
      { label: "High", value: "High" },
      { label: "Low", value: "Low" }
    ];
  }

  handleChangeOwnerTask(event) {
    this.owner = event.detail;
    console.log("this.owner :  " + this.owner);
  }

  handleSubjectChange(event) {
    this.subject = event.target.value;
  }

  handleTypeChange(event) {
    this.type = event.target.value;
  }

  handlePriorityChange(event) {
    this.priority = event.target.value;
  }

  hadleDescriptionChange(event) {
    this.description = event.target.value;
  }

  hadleMakeInvisible() {
    this.isVisibleNotification = false;
  }

  addTask() {
    saveTask({
      subject: this.subject,
      description: this.description,
      priority: this.priority,
      type: this.type,
      owner: this.owner
    })
      .then(() => {
        const evt = new ShowToastEvent({
          title: "Task created",
          message: "Task created",
          variant: "success",
          mode: "dismissible"
        });

        this.dispatchEvent(evt);
        this.isVisibleNotification = true;
      })
      .catch((error) => {
        const evt = new ShowToastEvent({
          title: error.detail.message,
          message: error.detail.detail,
          variant: "error",
          mode: "sticky"
        });

        this.dispatchEvent(evt);
      });
  }

  onClickNotification() {
    this.isVisibleNotification = false;
  }
}
