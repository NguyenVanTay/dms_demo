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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FinalPlan'] = finalPlan;
    data['BeginPlan'] = beginPlan;
    data['Code'] = code;
    data['Description'] = description;
    return data;
  }
}
