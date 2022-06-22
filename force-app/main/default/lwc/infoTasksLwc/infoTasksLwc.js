import { LightningElement, track } from "lwc";
import currentUserId from "@salesforce/user/Id";
import getFilteredTasks from "@salesforce/apex/InfoTasksLwcController.getFilteredTasks";

export default class InfoTasksLwc extends LightningElement {
  @track filterDate = "all";
  @track myTasks = [];
  @track taskListSize;
  @track owner = currentUserId;

  @track options = [
    { label: "All", value: "all" },
    { label: "Today", value: "TODAY" },
    { label: "Yesterday", value: "YESTERDAY" },
    { label: "This week", value: "THIS_WEEK" },
    { label: "Last week", value: "LAST_WEEK" },
    { label: "Last month", value: "LAST_MONTH" },
    { label: "This month", value: "THIS_MONTH" },
    { label: "Last year", value: "LAST_YEAR" },
    { label: "This year", value: "THIS_YEAR" }
  ];
  @track error;

  @track users;
  @track userOptions = [];

  connectedCallback() {
    this.loadTaskListData();
  }

  handleChangeOwner(event) {
    console.log(event.detail);
    this.owner = event.detail;
    this.onChangeFilterDate();
  }

  loadTaskListData() {
    getFilteredTasks({ filter: this.filterDate, owner: this.owner })
      .then((result) => {
        this.myTasks = result;
        this.taskListSize = this.myTasks.length;
      })
      .catch((error) => {
        this.error = error;
      });
  }

  onChangeFilterDate() {
    getFilteredTasks({ filter: this.filterDate, owner: this.owner })
      .then((result) => {
        this.myTasks = result;
        this.taskListSize = this.myTasks.length;
      })
      .catch((error) => {
        this.error = error;
      });
  }

  handleChangeFilterDateCombobox(event) {
    this.filterDate = event.detail.value;
    this.onChangeFilterDate();
  }

  handleChangeUserOwnerCombobox(event) {
    let value = event.detail.value;
    console.log(value);
    this.owner = value;
    this.onChangeFilterDate();
  }
}
