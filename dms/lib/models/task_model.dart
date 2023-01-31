// ignore_for_file: unnecessary_this

class TaskModel {
  String? finalPlan;
  String? beginPlan;
  String? description;
  String? code;

  TaskModel({this.finalPlan, this.beginPlan, this.description, this.code});

  TaskModel.fromJson(Map<String, dynamic> json) {
    finalPlan = json['FinalPlan'];
    beginPlan = json['BeginPlan'];
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FinalPlan'] = this.finalPlan;
    data['BeginPlan'] = this.beginPlan;
    data['Description'] = this.description;
    data['Code'] = this.code;
    return data;
  }
}
