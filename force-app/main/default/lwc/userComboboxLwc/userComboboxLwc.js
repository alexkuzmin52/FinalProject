import { LightningElement, track, wire } from "lwc";
import getAllUsers from "@salesforce/apex/UserComboboxLwcController.getAllUsers";
import currentUserId from "@salesforce/user/Id";
//import NAME_FIELD from '@salesforce/schema/user/Name';
//import currentUserName from '@salesforce/user/Name';

export default class UserComboboxLwc extends LightningElement {
  @track users;
  @track error;
  @track options = [];
  @track selectedUserId = currentUserId;

  @wire(getAllUsers)
  wiredUsers({ data, error }) {
    if (data) {
      this.users = data;
      this.error = undefined;
      this.users.forEach((item) => {
        let opt = { label: item.Name, value: item.Id };
        this.options = [...this.options, opt];
      });
    } else if (error) {
      this.users = undefined;
      this.error = error;
    }
  }
  handleChange(event) {
    this.selectedUserId = event.target.value;
    console.log("this.selectedUserId :  " + this.selectedUserId);
    const selectedEvent = new CustomEvent("selecteduserid", {
      detail: this.selectedUserId
    });

    this.dispatchEvent(selectedEvent);
  }
}
