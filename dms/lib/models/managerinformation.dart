class ManagerInformationModel {
  String? name;
  String? role;
  String? notAcceptTask;
  String? inprOnprogressTask;
  String? pendingApprovalTask;
  String? overdueTask;
  String? taskfromMe;
  String? verifyTask;

  ManagerInformationModel(ManagerInformationModel user, String string,
      {this.name,
      this.role,
      this.notAcceptTask,
      this.inprOnprogressTask,
      this.overdueTask,
      this.pendingApprovalTask,
      this.taskfromMe,
      this.verifyTask});

  ManagerInformationModel.fromJson(Map<String, dynamic> json) {
    name = json['Username'];
    role = json['Role'];
    notAcceptTask = json['NotAcceptTask'];
    inprOnprogressTask = json['InProgressTask'];
    pendingApprovalTask = json['PendingApprovalTask'];
    overdueTask = json['OverDueTask'];
    taskfromMe = json['TaskFromMe'];
    verifyTask = json['Verify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = name;
    return data;
  }
}
