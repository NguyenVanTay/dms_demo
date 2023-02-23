class PerformerInformationModel {
  String? name;
  String? role;
  String? notAcceptTask;
  String? inprOnprogressTask;
  String? pendingApprovalTask;
  String? overdueTask;

  PerformerInformationModel(PerformerInformationModel user, String string,
      {this.name,
      this.role,
      this.notAcceptTask,
      this.inprOnprogressTask,
      this.overdueTask,
      this.pendingApprovalTask});

  PerformerInformationModel.fromJson(Map<String, dynamic> json) {
    name = json['Username'];
    role = json['Role'];
    notAcceptTask = json['NotAcceptTask'];
    inprOnprogressTask = json['InProgressTask'];
    pendingApprovalTask = json['PendingApprovalTask'];
    overdueTask = json['OverDueTask'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = name;
    return data;
  }
}
