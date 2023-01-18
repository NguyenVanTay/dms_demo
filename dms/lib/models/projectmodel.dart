// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ProjectModel {
  String? finalPlan;
  String? beginPlan;
  String? code;
  String? description;

  ProjectModel({this.finalPlan, this.beginPlan, this.code, this.description});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    finalPlan = json['FinalPlan'];
    beginPlan = json['BeginPlan'];
    code = json['Code'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FinalPlan'] = this.finalPlan;
    data['BeginPlan'] = this.beginPlan;
    data['Code'] = this.code;
    data['Description'] = this.description;
    return data;
  }
}
